# Kingdom Kids — Backend Decision: Serverpod vs Django

An honest trade-off between the two viable backend options, not a rubber stamp of the first pick.

## Can Serverpod build this? Yes.

Serverpod is a real full-stack Dart backend: Postgres-backed, code-generated type-safe models shared between server and Flutter client, built-in auth, file uploads, background tasks, and real-time streams (useful later for live classroom features in Phase 2). Nothing in the Kingdom Kids spec — the Book/Page/PageContent model, progress tracking, badges, devotionals — requires anything Serverpod can't do.

## What actually changes with Serverpod vs Django

**Gain:** one language (Dart) across app and backend. JIL Engineering's existing Flutter/Dart expertise carries directly into the backend with minimal ramp-up, and the Book/Page/ChildProfile models can be defined once and shared between client and server — less duplication, fewer client/server mismatch bugs.

**Lose:** Django Admin. Django's built-in admin panel was the original reason to consider it — Serverpod has no equivalent zero-build admin CMS out of the box. The content team (not developers) needs *some* interface to enter book text, illustrations, and audio without a developer in the loop for every update.

## The actual recommendation: Serverpod + a lightweight content layer

Backend-vs-CMS is really two separate decisions:

- **Serverpod is the app backend** — everything the Flutter app talks to (auth, library, progress, badges, devotionals). Full Dart stack, consistent with the team's core skill set.
- **Content entry is solved separately, and simply.** Given the content team is small and non-technical, the realistic Sprint 2 answer isn't a custom admin panel — it's a Google Sheet (or Airtable) for book/devotional metadata and text, with a small import script that pushes rows into Serverpod's Postgres database via its API or direct DB access. This is faster to build than any admin UI, and it's a tool the content team will already know how to use.
- **If the content team outgrows the spreadsheet** (Phase 2, more books, more languages, more contributors), that's the point to invest in a real internal admin tool — Serverpod's own web-admin capabilities or a small custom Flutter Web admin app, reusing the same Dart models. Not a Phase 1 problem.

This gets stack consistency now and defers the CMS investment to exactly the point where it's actually needed, rather than building it speculatively in Sprint 0.

## Decision

**Backend: Serverpod.** Content entry: spreadsheet-plus-import-script for Phase 1, revisit a real admin tool only if/when the content team's volume justifies it.

## Long-term consideration

Serverpod's ecosystem and hiring pool are smaller than Django's. This is the right call for the current team's skill set; if JIL Engineering later needs to hire multiple additional backend developers, factor that hiring-pool trade-off back into the decision.

## Version & stability risk (added after the Sprint 2 architecture review)

`serverpod`, `serverpod_auth_idp_server`, and the R2 storage integration are all pinned to `4.0.0-beta.0` — every load-bearing server package is pre-1.0. That's an acceptable trade for a team this size right now (Serverpod's Dart-everywhere model is still the right call), but it's a real, live risk that shouldn't sit undocumented: beta releases can carry breaking changes between versions, and the newer integrations (like the R2 storage package) are less battle-tested than the core framework. In practice:

- Treat any `serverpod`/`serverpod_*` version bump as its own reviewed PR with the changelog read first — never a drive-by `pub upgrade` bundled into unrelated work.
- Re-check this decision once Serverpod reaches a stable 1.0, or once JIL Engineering is relying on it for anything handling live donor/church data at meaningfully larger scale than the pilot.
