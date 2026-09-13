/**
 * docs-to-full-pdf.js
 *
 * Converts an entire Docusaurus docs section into ONE merged, book-formatted
 * PDF by:
 *   1. Reading the site's sitemap.xml (the authoritative list of every real page)
 *   2. Filtering to the section you care about (e.g. "/next/")
 *   3. Crawling the live sidebar navigation to recover true reading order and
 *      chapter/section hierarchy (sitemap order is arbitrary; the sidebar's
 *      DOM order and nesting is the actual table of contents a human reads)
 *   4. Visiting each page with headless Chromium (Playwright), expanding
 *      anything collapsed by default (OS/language tabs, <details> accordions)
 *      so their content isn't silently dropped, and printing it to its own PDF
 *   5. Building a real, clickable, hierarchically-numbered table of contents
 *      with accurate page numbers, and a title page
 *   6. Merging everything into one PDF with continuous page numbers — lowercase
 *      roman numerals for the front matter (TOC), Arabic numerals for the body,
 *      exactly like a printed book
 *   7. Reporting exactly what was and wasn't included, and failing loudly
 *      (non-zero exit code) if anything is missing
 *
 * This avoids the "next-page-link guessing" problem that tools like
 * docs-to-pdf and docusaurus-prince-pdf have — every page in the sitemap
 * gets included, in the order and hierarchy the sidebar actually presents it.
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
const { PDFDocument, StandardFonts, rgb, PDFName, PDFArray } = require('pdf-lib');
const fs = require('fs');
const path = require('path');
const https = require('https');

// ---------------------- CONFIG ----------------------
const SITEMAP_URL = 'https://docs.serverpod.dev/sitemap.xml';
const PATH_FILTER = '/next/';           // only keep URLs with this as a path segment
const SITE_ORIGIN = new URL(SITEMAP_URL).origin;
const NAV_ENTRY_URL = `${SITE_ORIGIN}${PATH_FILTER}`; // page to crawl the sidebar from
const BOOK_TITLE = 'Serverpod Docs (next)';
const OUTPUT_DIR = './pdf-pages';       // temp folder for per-page PDFs
const OUTPUT_FILE = './serverpod-docs-next.pdf';
const REPORT_FILE = './docs-to-full-pdf-report.json';
const NAV_TIMEOUT_MS = 45000;
const EXTRA_WAIT_MS = 1000;             // pause after load for hydration/JS content
const PAGE_RETRIES = 3;                 // retry a page this many times before giving up on it
const TAB_CLICK_SETTLE_MS = 150;        // pause after clicking a tab for React to re-render

// Page geometry — must match the `margin`/`format` passed to every page.pdf()
// call below, since the table of contents computes exact link-annotation
// positions from these numbers rather than guessing at rendered layout.
const PAGE_FORMAT = 'A4';
const MARGIN_MM = { top: 20, bottom: 20, left: 15, right: 15 };
const MM_TO_PT = 2.834645669;
const PAGE_W_PT = 595.28;
const PAGE_H_PT = 841.89;
const MARGIN_TOP_PT = MARGIN_MM.top * MM_TO_PT;
const MARGIN_BOTTOM_PT = MARGIN_MM.bottom * MM_TO_PT;
const MARGIN_LEFT_PT = MARGIN_MM.left * MM_TO_PT;
const MARGIN_RIGHT_PT = MARGIN_MM.right * MM_TO_PT;
const CONTENT_H_PT = PAGE_H_PT - MARGIN_TOP_PT - MARGIN_BOTTOM_PT;
const TOC_ROW_HEIGHT_PT = 20;
const TOC_HEADING_HEIGHT_PT = 70;
// ------------------------------------------------------

const PDF_MARGIN = {
  top: `${MARGIN_MM.top}mm`,
  bottom: `${MARGIN_MM.bottom}mm`,
  left: `${MARGIN_MM.left}mm`,
  right: `${MARGIN_MM.right}mm`,
};

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

function escapeHtml(str) {
  return String(str).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
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

function safeFilenameFromUrl(url, index) {
  const u = new URL(url);
  const slug = u.pathname.replace(/\//g, '_').replace(/^_|_$/g, '') || 'index';
  return `${String(index).padStart(3, '0')}_${slug}.pdf`;
}

function toRoman(num) {
  const map = [
    [1000, 'm'], [900, 'cm'], [500, 'd'], [400, 'cd'],
    [100, 'c'], [90, 'xc'], [50, 'l'], [40, 'xl'],
    [10, 'x'], [9, 'ix'], [5, 'v'], [4, 'iv'], [1, 'i'],
  ];
  let n = num;
  let out = '';
  for (const [val, sym] of map) {
    while (n >= val) {
      out += sym;
      n -= val;
    }
  }
  return out;
}

// Chapter/section numbers like "1", "1.1", "2", "2.1" from sidebar nesting
// depth. Pages not found in the sidebar (orphans) become "Appendix A/B/C".
function computeNumbering(items) {
  const counters = [];
  let appendixIndex = 0;
  return items.map((item) => {
    if (item.orphan) {
      appendixIndex += 1;
      return { ...item, number: `Appendix ${String.fromCharCode(64 + appendixIndex)}` };
    }
    const depth = Math.max(0, item.depth || 0);
    counters[depth] = (counters[depth] || 0) + 1;
    counters.length = depth + 1;
    return { ...item, number: counters.join('.') };
  });
}

// The sidebar's DOM order (and nesting) is the real table of contents.
// Docusaurus keeps collapsed categories mounted but visually hidden in most
// theme versions — we also proactively click every collapsed category to be
// safe, since that behavior isn't guaranteed across versions.
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

  const rawItems = await page
    .$$eval('.theme-doc-sidebar-container a.menu__link[href]', (as) =>
      as.map((a) => {
        let depth = 0;
        let li = a.closest('.menu__list-item');
        while (li) {
          const parentList = li.parentElement;
          const parentLi = parentList ? parentList.closest('.menu__list-item') : null;
          if (!parentLi) break;
          depth += 1;
          li = parentLi;
        }
        return { href: a.getAttribute('href'), label: (a.textContent || '').trim(), depth };
      })
    )
    .catch(() => []);

  const seen = new Set();
  const out = [];
  for (const raw of rawItems) {
    let url;
    try {
      url = normalizeUrl(new URL(raw.href, origin).toString());
    } catch {
      continue;
    }
    if (!matchesPathFilter(url, pathFilter) || seen.has(url)) continue;
    seen.add(url);
    out.push({ url, label: raw.label, depth: raw.depth });
  }
  return out;
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

async function renderPageToPdf(page, item, outPath) {
  await page.goto(item.url, { waitUntil: 'domcontentloaded', timeout: NAV_TIMEOUT_MS });
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
  const bannerLabel = item.label || title;

  // A running chapter/section banner, like the header of a printed book
  // chapter, so a reader can tell where they are without the sidebar.
  await page.evaluate(
    ({ number, label }) => {
      const article = document.querySelector('article');
      if (!article) return;
      const banner = document.createElement('div');
      banner.className = 'docs-pdf-chapter-banner';
      banner.textContent = number ? `${number}   ${label}` : label;
      banner.style.cssText =
        'font-size:11px;color:#666;text-transform:uppercase;letter-spacing:0.05em;' +
        'border-bottom:1px solid #ddd;padding-bottom:6px;margin-bottom:16px;';
      article.insertBefore(banner, article.firstChild);
    },
    { number: item.number, label: bannerLabel }
  );

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
    format: PAGE_FORMAT,
    margin: PDF_MARGIN,
    printBackground: true,
  });

  return { title };
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

async function countPdfPages(filePath) {
  const bytes = fs.readFileSync(filePath);
  const doc = await PDFDocument.load(bytes);
  return doc.getPageCount();
}

async function buildTitlePage(page, outPath) {
  const html = `
    <html>
      <body style="font-family: sans-serif; margin: 0; padding: 0;">
        <div style="height: 260pt;"></div>
        <div style="text-align: center;">
          <h1 style="font-size: 30pt; margin: 0;">${escapeHtml(BOOK_TITLE)}</h1>
          <p style="color: #666; margin-top: 16pt; font-size: 11pt;">
            Offline reference generated ${new Date().toISOString().slice(0, 10)}
          </p>
          <p style="color: #999; margin-top: 60pt; font-size: 9pt;">
            Source: ${escapeHtml(SITEMAP_URL)}
          </p>
        </div>
      </body>
    </html>`;
  await page.setContent(html, { waitUntil: 'domcontentloaded' });
  await page.pdf({ path: outPath, format: PAGE_FORMAT, margin: PDF_MARGIN });
}

function tocRowRect(hasHeading, rowIndexOnPage) {
  const rowTopFromContentTop = (hasHeading ? TOC_HEADING_HEIGHT_PT : 0) + rowIndexOnPage * TOC_ROW_HEIGHT_PT;
  const yTopFromPageTop = MARGIN_TOP_PT + rowTopFromContentTop;
  const rectBottom = PAGE_H_PT - yTopFromPageTop - TOC_ROW_HEIGHT_PT;
  return [MARGIN_LEFT_PT, rectBottom, PAGE_W_PT - MARGIN_RIGHT_PT, rectBottom + TOC_ROW_HEIGHT_PT];
}

// Builds the table of contents as one or more explicitly page-broken <div>s
// (rather than relying on the browser to reflow-and-guess), so that the
// rect math above exactly matches what gets rendered — required for the
// clickable link annotations added later to land in the right spot.
async function buildTocPages(page, outPath, entries) {
  const rowsPerPageFirst = Math.max(1, Math.floor((CONTENT_H_PT - TOC_HEADING_HEIGHT_PT) / TOC_ROW_HEIGHT_PT));
  const rowsPerPageRest = Math.max(1, Math.floor(CONTENT_H_PT / TOC_ROW_HEIGHT_PT));

  const tocPages = [];
  let idx = 0;
  let first = true;
  while (idx < entries.length) {
    const capacity = first ? rowsPerPageFirst : rowsPerPageRest;
    const rows = entries.slice(idx, idx + capacity);
    tocPages.push({ rows, heading: first });
    idx += rows.length;
    first = false;
  }

  const rowRects = []; // { url, tocPageIndex, rect }
  const pagesHtml = tocPages
    .map((tp, pageIdx) => {
      const rowsHtml = tp.rows
        .map((entry, rowIdx) => {
          rowRects.push({ url: entry.url, tocPageIndex: pageIdx, rect: tocRowRect(tp.heading, rowIdx) });
          const indentPt = Math.min(entry.depth || 0, 4) * 14;
          const numberPrefix = entry.number ? `${entry.number}. ` : '';
          return `
            <div style="display:flex;align-items:baseline;height:${TOC_ROW_HEIGHT_PT}pt;line-height:${TOC_ROW_HEIGHT_PT}pt;overflow:hidden;font-size:10.5pt;">
              <span style="padding-left:${indentPt}pt;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;max-width:340pt;${entry.orphan ? 'font-style:italic;color:#555;' : ''}">${escapeHtml(numberPrefix)}${escapeHtml(entry.label)}</span>
              <span style="flex:1;border-bottom:1px dotted #999;margin:0 6pt;transform:translateY(-3pt);"></span>
              <span style="white-space:nowrap;">${entry.startPage}</span>
            </div>`;
        })
        .join('\n');

      const headingHtml = tp.heading
        ? `<h1 style="font-size:22pt;margin:0 0 ${TOC_HEADING_HEIGHT_PT - 30}pt 0;">Table of Contents</h1>`
        : '';

      return `<div style="${pageIdx > 0 ? 'break-before:page;' : ''}">${headingHtml}${rowsHtml}</div>`;
    })
    .join('\n');

  const html = `<html><body style="font-family: sans-serif; margin: 0;">${pagesHtml}</body></html>`;
  await page.setContent(html, { waitUntil: 'domcontentloaded' });
  await page.pdf({ path: outPath, format: PAGE_FORMAT, margin: PDF_MARGIN, printBackground: true });

  return { tocPageCount: tocPages.length, rowRects };
}

function drawFooterNumber(pdfPage, text, font) {
  const { width } = pdfPage.getSize();
  const size = 9;
  const textWidth = font.widthOfTextAtSize(text, size);
  pdfPage.drawText(text, {
    x: (width - textWidth) / 2,
    y: MARGIN_BOTTOM_PT / 2,
    size,
    font,
    color: rgb(0.35, 0.35, 0.35),
  });
}

function addLinkAnnotation(pdfDoc, fromPage, rect, toPage) {
  const linkDict = pdfDoc.context.obj({
    Type: 'Annot',
    Subtype: 'Link',
    Rect: rect,
    Border: [0, 0, 0],
    Dest: [toPage.ref, PDFName.of('Fit')],
  });
  const linkRef = pdfDoc.context.register(linkDict);
  const annotsKey = PDFName.of('Annots');
  const existingRef = fromPage.node.get(annotsKey);
  const existingArray = existingRef
    ? fromPage.node.context.lookup(existingRef, PDFArray)
    : undefined;
  if (existingArray) {
    existingArray.push(linkRef);
  } else {
    fromPage.node.set(annotsKey, pdfDoc.context.obj([linkRef]));
  }
}

async function assembleFinalPdf({ titlePath, tocPath, tocRowRects, contentPdfPaths, entries, outputFile }) {
  const finalDoc = await PDFDocument.create();
  const font = await finalDoc.embedFont(StandardFonts.Helvetica);

  async function copyAllPages(filePath) {
    const bytes = fs.readFileSync(filePath);
    const src = await PDFDocument.load(bytes);
    const copiedPages = await finalDoc.copyPages(src, src.getPageIndices());
    const indices = [];
    for (const p of copiedPages) {
      finalDoc.addPage(p);
      indices.push(finalDoc.getPageCount() - 1);
    }
    return indices;
  }

  await copyAllPages(titlePath); // title page stays unnumbered
  const tocIndices = await copyAllPages(tocPath);

  const contentIndicesByFile = [];
  for (const filePath of contentPdfPaths) {
    contentIndicesByFile.push(await copyAllPages(filePath));
  }
  const flatContentPages = contentIndicesByFile.flat();

  tocIndices.forEach((pageIdx, i) => {
    drawFooterNumber(finalDoc.getPage(pageIdx), toRoman(i + 1), font);
  });

  flatContentPages.forEach((pageIdx, i) => {
    drawFooterNumber(finalDoc.getPage(pageIdx), String(i + 1), font);
  });

  for (const { url, tocPageIndex, rect } of tocRowRects) {
    const entry = entries.find((e) => e.url === url);
    if (!entry) continue;
    const targetGlobalIndex = flatContentPages[entry.startPage - 1];
    if (targetGlobalIndex == null) continue;
    addLinkAnnotation(
      finalDoc,
      finalDoc.getPage(tocIndices[tocPageIndex]),
      rect,
      finalDoc.getPage(targetGlobalIndex)
    );
  }

  fs.writeFileSync(outputFile, await finalDoc.save());
}

async function main() {
  console.log(`Fetching sitemap: ${SITEMAP_URL}`);
  const xml = await fetchText(SITEMAP_URL);
  const allUrls = extractUrlsFromSitemap(xml);

  const sitemapUrls = [...new Set(allUrls.filter((u) => matchesPathFilter(u, PATH_FILTER)).map(normalizeUrl))];

  if (sitemapUrls.length === 0) {
    console.error('No URLs matched. Check SITEMAP_URL and PATH_FILTER.');
    process.exit(1);
  }

  if (!fs.existsSync(OUTPUT_DIR)) fs.mkdirSync(OUTPUT_DIR, { recursive: true });

  const browser = await chromium.launch();
  const navPage = await browser.newPage();

  console.log(`Crawling sidebar nav from ${NAV_ENTRY_URL} for reading order and hierarchy...`);
  let navItems = [];
  try {
    navItems = await discoverNavOrder(navPage, SITE_ORIGIN, PATH_FILTER);
  } catch (err) {
    console.warn(`  ! Sidebar nav crawl failed (${err.message}); falling back to alphabetical order.`);
  }
  await navPage.close();

  const sitemapSet = new Set(sitemapUrls);
  const navUrlSet = new Set(navItems.map((i) => i.url));

  const orderedItems = navItems.filter((i) => sitemapSet.has(i.url));
  const orphanUrls = sitemapUrls.filter((u) => !navUrlSet.has(u)).sort((a, b) => a.localeCompare(b));
  const orphanItems = orphanUrls.map((u) => ({ url: u, label: null, depth: 0, orphan: true }));

  if (orderedItems.length === 0 && orphanItems.length > 0) {
    // Nav crawl found nothing usable — fall back to plain alphabetical order.
    orphanItems.sort((a, b) => a.url.localeCompare(b.url));
  }

  const finalItems = computeNumbering([...orderedItems, ...orphanItems]);

  if (orphanItems.length > 0) {
    console.log(`Note: ${orphanItems.length} sitemap page(s) were not found in the sidebar nav (appended as an appendix):`);
    orphanItems.forEach((i) => console.log('  -', i.url));
  }

  console.log(`Found ${finalItems.length} pages to include:`);
  finalItems.forEach((i) => console.log(`  - [${i.number}] ${i.url}`));

  const page = await browser.newPage();
  const contentPdfPaths = [];
  const entries = [];
  const skipped = [];
  let runningContentPages = 0;

  for (let i = 0; i < finalItems.length; i++) {
    const item = finalItems[i];
    const outPath = path.join(OUTPUT_DIR, safeFilenameFromUrl(item.url, i));
    console.log(`[${i + 1}/${finalItems.length}] ${item.url}`);

    try {
      const { title } = await withRetries(() => renderPageToPdf(page, item, outPath), PAGE_RETRIES, item.url);
      const pageCount = await countPdfPages(outPath);
      entries.push({
        url: item.url,
        label: item.label || title,
        number: item.number,
        depth: item.depth,
        orphan: !!item.orphan,
        startPage: runningContentPages + 1,
        pageCount,
      });
      runningContentPages += pageCount;
      contentPdfPaths.push(outPath);
    } catch (err) {
      console.error(`  ! Skipped after ${PAGE_RETRIES} attempts: ${err.message}`);
      skipped.push({ url: item.url, error: err.message });
    }
  }

  await browser.close();

  const layoutBrowser = await chromium.launch();
  const layoutPage = await layoutBrowser.newPage();

  const titlePath = path.join(OUTPUT_DIR, '000_title.pdf');
  await buildTitlePage(layoutPage, titlePath);

  const tocPath = path.join(OUTPUT_DIR, '000_toc.pdf');
  const { tocPageCount, rowRects } = await buildTocPages(layoutPage, tocPath, entries);

  await layoutBrowser.close();

  console.log(`Assembling final book: title page + ${tocPageCount} TOC page(s) + ${contentPdfPaths.length} content page(s)...`);
  await assembleFinalPdf({
    titlePath,
    tocPath,
    tocRowRects: rowRects,
    contentPdfPaths,
    entries,
    outputFile: OUTPUT_FILE,
  });

  const report = {
    generatedAt: new Date().toISOString(),
    sitemapUrl: SITEMAP_URL,
    pathFilter: PATH_FILTER,
    sitemapPageCount: sitemapUrls.length,
    includedCount: entries.length,
    orphanCount: orphanItems.length,
    skippedCount: skipped.length,
    skipped,
    entries,
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
