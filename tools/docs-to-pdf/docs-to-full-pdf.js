/**
 * docs-to-full-pdf.js
 *
 * Converts an entire Docusaurus docs section into ONE merged PDF by:
 *   1. Reading the site's sitemap.xml (the authoritative list of every real page)
 *   2. Filtering to the section you care about (e.g. "/next/")
 *   3. Crawling the live sidebar navigation to recover true reading order
 *      (sitemap order is arbitrary; the sidebar's DOM order is the actual
 *      table of contents a human would read top to bottom)
 *   4. Visiting each page with headless Chromium (Playwright), expanding
 *      anything that's collapsed by default (OS/language tabs, <details>
 *      accordions) so their content isn't silently dropped, and printing
 *      it to its own PDF
 *   5. Building a cover/TOC page and merging everything, in order, into one
 *      final file
 *   6. Reporting exactly what was and wasn't included, and failing loudly
 *      (non-zero exit code) if anything is missing
 *
 * This avoids the "next-page-link guessing" problem that tools like
 * docs-to-pdf and docusaurus-prince-pdf have — every page in the sitemap
 * gets included, in the order the sidebar actually presents it.
 *
 * SETUP:
 *   npm install
 *   npx playwright install chromium   (skip if a system Chromium is already configured)
 *
 * USAGE:
 *   node docs-to-full-pdf.js
 *
 * Adjust the CONFIG block below for a different site/section.
 */

const { chromium } = require('playwright');
const PDFMerger = require('pdf-merger-js').default;
const fs = require('fs');
const path = require('path');
const https = require('https');

// ---------------------- CONFIG ----------------------
const SITEMAP_URL = 'https://docs.serverpod.dev/sitemap.xml';
const PATH_FILTER = '/next/';           // only keep URLs with this as a path segment
const SITE_ORIGIN = new URL(SITEMAP_URL).origin;
const NAV_ENTRY_URL = `${SITE_ORIGIN}${PATH_FILTER}`; // page to crawl the sidebar from
const OUTPUT_DIR = './pdf-pages';       // temp folder for per-page PDFs
const OUTPUT_FILE = './serverpod-docs-next.pdf';
const REPORT_FILE = './docs-to-full-pdf-report.json';
const NAV_TIMEOUT_MS = 45000;
const EXTRA_WAIT_MS = 1000;             // pause after load for hydration/JS content
const PAGE_RETRIES = 3;                 // retry a page this many times before giving up on it
const TAB_CLICK_SETTLE_MS = 150;        // pause after clicking a tab for React to re-render
// ------------------------------------------------------

function fetchText(url) {
  return new Promise((resolve, reject) => {
    https.get(url, (res) => {
      if (res.statusCode >= 300 && res.statusCode < 400 && res.headers.location) {
        return resolve(fetchText(new URL(res.headers.location, url).toString()));
      }
      if (res.statusCode !== 200) {
        return reject(new Error(`Failed to fetch ${url}: HTTP ${res.statusCode}`));
      }
      let data = '';
      res.on('data', (chunk) => (data += chunk));
      res.on('end', () => resolve(data));
    }).on('error', reject);
  });
}

function decodeXmlEntities(str) {
  return str
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&apos;/g, "'");
}

function extractUrlsFromSitemap(xml) {
  return [...xml.matchAll(/<loc>([^<]+)<\/loc>/g)].map((m) => decodeXmlEntities(m[1]));
}

// Strip hash fragments and trailing slashes so the same page reached two
// different ways (with/without a trailing slash, with an in-page anchor)
// is only counted once.
function normalizeUrl(url) {
  const u = new URL(url);
  u.hash = '';
  u.pathname = u.pathname.replace(/\/+$/, '') || '/';
  return u.toString();
}

// Match PATH_FILTER as a path segment, not a raw substring, so e.g.
// "/next/" doesn't also swallow a hypothetical "/next-gen/" section.
function matchesPathFilter(url, filter) {
  const seg = filter.replace(/^\/|\/$/g, '');
  return new URL(url).pathname.split('/').filter(Boolean).includes(seg);
}

function dedupePreserveOrder(urls) {
  const seen = new Set();
  const out = [];
  for (const u of urls) {
    if (!seen.has(u)) {
      seen.add(u);
      out.push(u);
    }
  }
  return out;
}

function safeFilenameFromUrl(url, index) {
  const u = new URL(url);
  const slug = u.pathname.replace(/\//g, '_').replace(/^_|_$/g, '') || 'index';
  return `${String(index).padStart(3, '0')}_${slug}.pdf`;
}

// The sidebar's DOM order is the real reading order. Docusaurus keeps
// collapsed categories mounted but visually hidden, so in most versions
// their links are already queryable — but we also proactively click every
// collapsed category to be safe, since that behavior isn't guaranteed
// across theme versions.
async function discoverNavOrder(page, origin, pathFilter) {
  await page.goto(NAV_ENTRY_URL, { waitUntil: 'domcontentloaded', timeout: NAV_TIMEOUT_MS });
  await page
    .waitForSelector('.theme-doc-sidebar-container, nav[aria-label="Docs sidebar"]', { timeout: NAV_TIMEOUT_MS })
    .catch(() => {});

  for (let pass = 0; pass < 8; pass++) {
    const collapsed = await page
      .locator('.theme-doc-sidebar-container .menu__link--sublist[aria-expanded="false"]')
      .all();
    if (collapsed.length === 0) break;
    for (const btn of collapsed) {
      await btn.click({ timeout: 3000 }).catch(() => {});
    }
    await page.waitForTimeout(150);
  }

  const hrefs = await page
    .$$eval('.theme-doc-sidebar-container a.menu__link[href]', (as) => as.map((a) => a.getAttribute('href')))
    .catch(() => []);

  const abs = hrefs
    .map((h) => {
      try {
        return new URL(h, origin).toString();
      } catch {
        return null;
      }
    })
    .filter((u) => u && matchesPathFilter(u, pathFilter))
    .map(normalizeUrl);

  return dedupePreserveOrder(abs);
}

// Docusaurus <Tabs> only render the currently-selected <TabItem> in the DOM.
// Serverpod's docs use these for OS-specific / language-specific snippets,
// so without this, printing a page only captures whichever tab happened to
// be selected — silently dropping the rest. We click through every tab and
// stack the captured HTML of each into static, always-visible blocks.
async function expandAllTabs(page) {
  const tablists = await page.locator('[role="tablist"]').all();
  for (const tablist of tablists) {
    const tabs = await tablist.locator('[role="tab"]').all();
    if (tabs.length <= 1) continue;

    const wrapperHandle = await tablist.evaluateHandle(
      (el) => el.closest('.tabs-container') || el.parentElement
    );

    const panels = [];
    for (const tab of tabs) {
      const label = ((await tab.textContent()) || '').trim();
      await tab.click({ timeout: 5000 }).catch(() => {});
      await page.waitForTimeout(TAB_CLICK_SETTLE_MS);
      const html = await wrapperHandle
        .evaluate((wrapper) => wrapper.querySelector('[role="tabpanel"]')?.innerHTML ?? null)
        .catch(() => null);
      if (html != null) panels.push({ label, html });
    }

    if (panels.length > 1) {
      await wrapperHandle.evaluate((wrapper, panels) => {
        const container = document.createElement('div');
        container.className = 'docs-pdf-expanded-tabs';
        for (const { label, html } of panels) {
          const heading = document.createElement('div');
          heading.textContent = `[${label}]`;
          heading.style.cssText =
            'font-weight:700;margin-top:14px;margin-bottom:4px;padding:3px 8px;' +
            'background:#eef1f8;border-left:3px solid #4a5a8a;font-size:0.85em;';
          const body = document.createElement('div');
          body.innerHTML = html;
          body.style.cssText = 'margin-bottom:10px;';
          container.appendChild(heading);
          container.appendChild(body);
        }
        wrapper.style.display = 'none';
        wrapper.insertAdjacentElement('afterend', container);
      }, panels);
    }
  }
}

async function renderPageToPdf(page, url, outPath) {
  await page.goto(url, { waitUntil: 'domcontentloaded', timeout: NAV_TIMEOUT_MS });
  await page.waitForSelector('article', { timeout: NAV_TIMEOUT_MS }).catch(() => {});
  await page.waitForTimeout(EXTRA_WAIT_MS);

  // Force light theme regardless of a persisted dark-mode preference, so
  // every page in the merged PDF looks consistent.
  await page.evaluate(() => {
    document.documentElement.setAttribute('data-theme', 'light');
  });

  // Expand anything collapsed by default so its content actually prints.
  await expandAllTabs(page).catch(() => {});
  await page.evaluate(() => {
    document.querySelectorAll('details').forEach((d) => (d.open = true));
  });

  const title = await page.title();

  // Hide site chrome that shouldn't appear in a PDF.
  await page.addStyleTag({
    content: `
      nav.navbar, .theme-doc-sidebar-container, footer,
      .theme-edit-this-page, .pagination-nav, .breadcrumbs,
      .table-of-contents, .theme-back-to-top-button,
      [class*="announcementBar"], .navbar-sidebar,
      .clean-btn, .skipToContent_fXgn, iframe.giscus-frame {
        display: none !important;
      }
      article { max-width: 100% !important; }
    `,
  });

  await page.pdf({
    path: outPath,
    format: 'A4',
    margin: { top: '20mm', bottom: '20mm', left: '15mm', right: '15mm' },
    printBackground: true,
  });

  return title;
}

async function withRetries(fn, retries, label) {
  let lastErr;
  for (let attempt = 1; attempt <= retries; attempt++) {
    try {
      return await fn();
    } catch (err) {
      lastErr = err;
      console.warn(`  ! Attempt ${attempt}/${retries} failed for ${label}: ${err.message}`);
    }
  }
  throw lastErr;
}

async function buildCoverPage(page, outPath, entries) {
  const rows = entries
    .map(
      (e, i) =>
        `<tr><td style="padding:4px 10px;color:#666;">${i + 1}</td>
             <td style="padding:4px 10px;">${e.title}${e.orphan ? ' <em>(not in sidebar nav)</em>' : ''}</td>
             <td style="padding:4px 10px;color:#666;font-size:0.85em;">${e.url}</td></tr>`
    )
    .join('\n');

  const html = `
    <html>
      <body style="font-family: sans-serif; padding: 40px;">
        <h1>Serverpod Docs (next) — Full PDF</h1>
        <p>Generated ${new Date().toISOString()} from ${SITEMAP_URL}</p>
        <p>${entries.length} pages included.</p>
        <table style="border-collapse: collapse; width: 100%;">${rows}</table>
      </body>
    </html>
  `;

  await page.setContent(html, { waitUntil: 'domcontentloaded' });
  await page.pdf({
    path: outPath,
    format: 'A4',
    margin: { top: '20mm', bottom: '20mm', left: '15mm', right: '15mm' },
  });
}

async function main() {
  console.log(`Fetching sitemap: ${SITEMAP_URL}`);
  const xml = await fetchText(SITEMAP_URL);
  const allUrls = extractUrlsFromSitemap(xml);

  const sitemapUrls = dedupePreserveOrder(
    allUrls.filter((u) => matchesPathFilter(u, PATH_FILTER)).map(normalizeUrl)
  );

  if (sitemapUrls.length === 0) {
    console.error('No URLs matched. Check SITEMAP_URL and PATH_FILTER.');
    process.exit(1);
  }

  if (!fs.existsSync(OUTPUT_DIR)) fs.mkdirSync(OUTPUT_DIR, { recursive: true });

  const browser = await chromium.launch();
  const navPage = await browser.newPage();

  console.log(`Crawling sidebar nav from ${NAV_ENTRY_URL} for true reading order...`);
  let navUrls = [];
  try {
    navUrls = await discoverNavOrder(navPage, SITE_ORIGIN, PATH_FILTER);
  } catch (err) {
    console.warn(`  ! Sidebar nav crawl failed (${err.message}); falling back to alphabetical order.`);
  }
  await navPage.close();

  const sitemapSet = new Set(sitemapUrls);
  const navSet = new Set(navUrls);

  const orderedUrls = navUrls.filter((u) => sitemapSet.has(u));
  const orphanUrls = sitemapUrls.filter((u) => !navSet.has(u)).sort((a, b) => a.localeCompare(b));
  const finalUrls = dedupePreserveOrder([...orderedUrls, ...orphanUrls]);

  if (orphanUrls.length > 0) {
    console.log(
      `Note: ${orphanUrls.length} sitemap page(s) were not found in the sidebar nav; ` +
        `appending them at the end:`
    );
    orphanUrls.forEach((u) => console.log('  -', u));
  }

  console.log(`Found ${finalUrls.length} pages to include:`);
  finalUrls.forEach((u) => console.log('  -', u));

  const page = await browser.newPage();
  const pdfPaths = [];
  const includedEntries = [];
  const skipped = [];

  for (let i = 0; i < finalUrls.length; i++) {
    const url = finalUrls[i];
    const outPath = path.join(OUTPUT_DIR, safeFilenameFromUrl(url, i));
    console.log(`[${i + 1}/${finalUrls.length}] ${url}`);

    try {
      const title = await withRetries(() => renderPageToPdf(page, url, outPath), PAGE_RETRIES, url);
      pdfPaths.push(outPath);
      includedEntries.push({ url, title, orphan: orphanUrls.includes(url) });
    } catch (err) {
      console.error(`  ! Skipped after ${PAGE_RETRIES} attempts: ${err.message}`);
      skipped.push({ url, error: err.message });
    }
  }

  await browser.close();

  const finalBrowser = await chromium.launch();
  const coverPage = await finalBrowser.newPage();
  const coverPath = path.join(OUTPUT_DIR, '000_cover.pdf');
  await buildCoverPage(coverPage, coverPath, includedEntries);
  await finalBrowser.close();

  console.log(`Merging ${pdfPaths.length + 1} PDFs into ${OUTPUT_FILE} ...`);
  const merger = new PDFMerger();
  await merger.add(coverPath);
  for (const p of pdfPaths) {
    await merger.add(p);
  }
  await merger.save(OUTPUT_FILE);

  const report = {
    generatedAt: new Date().toISOString(),
    sitemapUrl: SITEMAP_URL,
    pathFilter: PATH_FILTER,
    sitemapPageCount: sitemapUrls.length,
    includedCount: includedEntries.length,
    orphanCount: orphanUrls.length,
    skippedCount: skipped.length,
    skipped,
  };
  fs.writeFileSync(REPORT_FILE, JSON.stringify(report, null, 2));

  console.log(`Done. Output: ${OUTPUT_FILE}`);
  console.log(`Report: ${REPORT_FILE}`);
  console.log(`(Per-page PDFs kept in ${OUTPUT_DIR}/ if you want to inspect or reorder them.)`);

  if (skipped.length > 0) {
    console.error(
      `\n${skipped.length} of ${sitemapUrls.length} sitemap pages are MISSING from the PDF. See ${REPORT_FILE}.`
    );
    process.exit(1);
  }
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
