# docs-to-pdf

Standalone script that merges an entire Docusaurus docs section (default:
`docs.serverpod.dev/next`, since this project is built on Serverpod) into a
single offline PDF — useful as an internal reference when working without
reliable internet access, or for archiving the version of the docs the app
was built against.

Not wired into the app or CI; run it manually when you want an updated copy.

## Setup

```bash
cd tools/docs-to-pdf
npm install
npx playwright install chromium   # skip if Chromium is already available system-wide
```

## Usage

```bash
node docs-to-full-pdf.js
```

Output: `serverpod-docs-next.pdf` in this directory, plus
`docs-to-full-pdf-report.json` summarizing what was included and (if any)
what failed to render. Per-page PDFs are kept in `pdf-pages/` in case you
want to inspect or reorder one manually.

The script exits with a non-zero status if any sitemap page failed to
render after retries — check the report before trusting the output as
complete.

## How it gets "nothing missed" and correct order

- **Completeness**: every URL is taken from the site's `sitemap.xml`, not
  guessed from "next page" links (the approach older tools like
  `docs-to-pdf`/`docusaurus-prince-pdf` use, which silently drops any page
  not linked in a simple chain).
- **Reading order**: rather than sorting URLs alphabetically (which doesn't
  match the docs' actual structure), the script crawls the live sidebar
  navigation and uses its DOM order — the same order a person reading the
  site top-to-bottom would see. Any sitemap page not found in the sidebar is
  still included, appended at the end and flagged in the report.
- **Tabbed content**: Serverpod's docs use OS/language tabs
  (`<Tabs>`/`<TabItem>`) for setup instructions and code snippets. Docusaurus
  only mounts the selected tab in the DOM, so printing the page as-is would
  silently drop every other tab. The script clicks through each tab and
  stacks all of their content into the printed page instead.

## Configuration

Edit the `CONFIG` block at the top of `docs-to-full-pdf.js` to target a
different site or section (`SITEMAP_URL`, `PATH_FILTER`, output paths,
timeouts, retry count).

## Known limitations

- Requires outbound network access to the target docs site. If you're
  running this from an environment with an egress allowlist, make sure the
  docs domain is reachable first (`curl -I https://docs.serverpod.dev/sitemap.xml`).
- Internal links between pages become dead links once merged into a single
  PDF (each page is printed independently); this only affects in-PDF
  clickability, not the printed content itself.
- Interactive widgets with no static content (e.g. live code playgrounds)
  will render whatever their default/empty state looks like.
