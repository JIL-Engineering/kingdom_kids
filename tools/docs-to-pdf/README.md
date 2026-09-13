# docs-to-pdf

Standalone script that merges an entire Docusaurus docs section (default:
`docs.serverpod.dev/next`, since this project is built on Serverpod) into a
single offline PDF formatted like an actual book — title page, a clickable
table of contents, chapter/section numbering, and continuous page numbers.
Useful as an internal reference when working without reliable internet
access, or for archiving the version of the docs the app was built against.

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
`docs-to-full-pdf-report.json` summarizing what was included, in what order,
with what page numbers — and (if any) what failed to render. Per-page PDFs
are kept in `pdf-pages/` in case you want to inspect or reorder one manually.

The script exits with a non-zero status if any sitemap page failed to
render after retries — check the report before trusting the output as
complete.

## Book design

- **Title page** — unnumbered, with a title, rule lines, and a chapter/page
  count, like the title page of a printed book.
- **Table of contents** — built directly from the site's sidebar and each
  page's own heading structure, not typed by hand. Chapter/page entries are
  indented to match the sidebar's nesting and numbered hierarchically (`1`,
  `1.1`, `1.1.1`, `2`, ...); each page's own h2 subheadings ("subtitles and
  topics") are listed indented underneath it, unnumbered. Every row has a
  dotted leader, its real page number, and is a clickable link that jumps
  straight there.
- **PDF bookmark panel** — beyond the printed TOC, the file also carries a
  proper PDF outline (the navigation tree every PDF reader shows in its
  sidebar), one level deeper: it includes h3s too, and starts collapsed so
  a large doc set doesn't open to an overwhelming wall of bookmarks.
- **Page numbering** — lowercase roman numerals on the front matter (the TOC:
  `i`, `ii`, ...), then Arabic numerals starting at `1` for the body,
  continuous across every page regardless of how many physical PDF pages
  a single doc page happens to render as.
- **Consistent book typography** — a serif type family for body text and
  headings (overriding the site's own web font, which is right for a
  browser but not for a printed page), sized and spaced like a book rather
  than a website, applied uniformly across every page regardless of that
  page's original styling.
- **Chapter banners** — each content page gets a small running header (its
  chapter/section number and title), so you always know where you are
  without the sidebar.
- **Ordering** — pages linked from the sidebar come first, in the sidebar's
  own order (first page to last, top to bottom). Any sitemap page the
  sidebar doesn't link to is appended afterward under an "Appendix" divider
  as "Appendix A", "Appendix B", etc., clearly marked so it's obvious it's
  outside the site's own structure rather than silently missing or
  misplaced.
- **No silently clipped content** — a browser lets you scroll a wide code
  block or table to see the rest of it; a printed page can't. The script
  forces long code lines and wide tables to wrap instead of overflowing off
  the page, so nothing is cut off without you knowing.

## How it gets "nothing missed" and correct order

- **Completeness**: every URL is taken from the site's `sitemap.xml`, not
  guessed from "next page" links (the approach older tools like
  `docs-to-pdf`/`docusaurus-prince-pdf` use, which silently drops any page
  not linked in a simple chain).
- **Reading order & hierarchy**: rather than sorting URLs alphabetically
  (which doesn't match the docs' actual structure), the script crawls the
  live sidebar navigation — expanding every collapsed category first — and
  uses its DOM order and nesting depth for both the reading order and the
  table of contents.
- **Tabbed content**: Serverpod's docs use OS/language tabs
  (`<Tabs>`/`<TabItem>`) for setup instructions and code snippets. Docusaurus
  only mounts the selected tab in the DOM, so printing the page as-is would
  silently drop every other tab. The script clicks through each tab and
  stacks all of their content into the printed page instead.

## Configuration

Edit the `CONFIG` block at the top of `docs-to-full-pdf.js` to target a
different site or section (`SITEMAP_URL`, `PATH_FILTER`, `BOOK_TITLE`,
output paths, timeouts, retry count). If you change `MARGIN_MM` or
`PAGE_FORMAT`, the table-of-contents link positions are recomputed from
those same constants automatically — just don't change page margins in one
place and not the other.

## Known limitations

- Requires outbound network access to the target docs site. If you're
  running this from an environment with an egress allowlist, make sure the
  docs domain is reachable first (`curl -I https://docs.serverpod.dev/sitemap.xml`).
- Interactive widgets with no static content (e.g. live code playgrounds)
  will render whatever their default/empty state looks like.
- The TOC's clickable links and page numbers depend on every `page.pdf()`
  call in the script using the same page format/margins the TOC's geometry
  constants assume (see Configuration above).
