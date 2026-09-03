# Kingdom Kids — Phase 1 (MVP) Technical Specification

*System design, data model, and API contract for the first buildable slice.*
*Backend: Serverpod (Dart) — see `Kingdom_Kids_Backend_Decision.md` for rationale.*

## 1. Scope (recap)

Phase 1 only: parent accounts, child profiles, a digitized library, interactive reader with bilingual narration, offline download, basic gamification (streaks/badges), daily verse/devotional, parent dashboard, baseline child-data safety. No teacher/Sunday-school roles, no full DRM, no animation — those are Phase 2/3.

## 2. High-Level Architecture

```
Flutter App (iOS/Android/Tablet)
   |
   |  Serverpod generated client (type-safe RPC over HTTPS, JWT auth)
   v
Serverpod (Dart) server, hosted on Serverpod Cloud (temporary, MVP/pilot stage)
   -------------  Content pipeline: Google Sheet --> import script --> same Postgres DB
   |
   +-- PostgreSQL — hosted free-tier on Supabase (connection string only; Serverpod owns
   |     auth/business logic, Supabase used purely as a free managed Postgres host)
   +-- Cloudflare R2 (illustrations, audio files) behind CDN, via Serverpod file storage
   |     (R2's free tier and zero egress fees make it the actual free option here —
   |     Firebase/Supabase Storage were considered and rejected: smaller free tiers,
   |     egress charges, and no native Serverpod integration since they aren't S3-compatible)
   +-- Firebase Cloud Messaging (devotional / streak push notifications)
   +-- Serverpod background tasks (badge evaluation, scheduled devotional push)

Flutter local storage (Hive/SQLite): downloaded book bundles, cached progress
events queued for sync when offline.
```

**Backup & disaster recovery:** automated daily Postgres backups with a tested restore procedure, and R2 bucket versioning enabled, before any real content is loaded. Donor-funded ministry content and family progress data are not acceptable to lose to a bad deploy or provider outage. Note on the free-tier Supabase Postgres: confirm its backup/point-in-time-recovery behavior at the free tier specifically (it's typically more limited than paid tiers) — if it's insufficient, an independent scheduled `pg_dump` to R2 is a cheap, free-tier-compatible backstop.

**Cost note:** at MVP/pilot scale, this architecture runs at effectively zero infrastructure cost — Supabase's free Postgres tier, R2's free storage tier (10GB, no egress fees), Firebase's free FCM tier, and Serverpod Cloud's entry tier for temporary hosting during the pilot. Revisit paid tiers only once real usage data shows a free tier is actually being approached, not preemptively.

**Analytics configuration:** any analytics/telemetry (Firebase Analytics or equivalent) must be explicitly configured for child-directed treatment before collecting any usage data — this is a Google Play/Apple compliance requirement, not just a privacy nicety, and defaults to non-compliant if left unconfigured.

Rationale recap: Serverpod gives one Dart codebase across app and server, with the `Book`/`Page`/`PageContent`/`ChildProfile` models code-generated and shared between client and server — no hand-kept-in-sync duplicate schemas. Content entry for Phase 1 goes through a spreadsheet + import script rather than a custom admin UI (Serverpod has no built-in admin panel the way Django does) — cheap now, revisit a real internal tool only if content volume outgrows it in Phase 2. R2 avoids S3 egress costs at ministry budget scale. Auth is JWT-based since the mobile client is the only consumer of the API for now.

**Long-term note:** Serverpod's ecosystem and hiring pool are smaller than Django's. This is the right call given the current team's skill set; if JIL Engineering later needs to hire multiple additional backend developers, factor that hiring-pool trade-off back in.

## 3. Core Data Model

**Typed domain values (added after the Sprint 2 architecture review — read before modeling any of the fields below):** `AgeBracket` and `AppLanguage` and `BookCategory` are Serverpod `enum:` types, not free-text `String` fields, anywhere they appear in this spec. This replaces an earlier ambiguity where `ChildProfile.age_bracket` was documented as one of three discrete labels while `Book.age_bracket_min/max` had no format specified at all — an import script and an endpoint each guessed a different shape (bracket label vs. raw integer) for the same conceptual value, and the mismatch made age filtering silently do nothing. One enum, defined once, closes that off at the type-checker level instead of by convention:

- **AgeBracket**: `toddler` / `preschool` / `early_elementary` / `preteen`, compared by declared order (index), never parsed from a string or number. *(Corrected to match the actual implementation in PR #39 — this section originally proposed `threeToFive`/`sixToEight`/`nineToTwelve`, three brackets; what shipped is four, named as above. The names shipped first; this doc was the one that was wrong.)*
- **AppLanguage**: `en` / `fr`.
- **BookCategory**: `bible_story` / `character_building` / `prayer` / `devotional` / `sunday_school`.

**User / AppUser** (parent account)
- id, auth_user_id (FK to `serverpod_auth_idp`'s own user/email/password tables — this app never stores email or password_hash directly), country, timezone, preferred_language (AppLanguage), consent_given_at *(records parental consent acceptance — required before any child profile can be created)*, parent_pin_hash *(bcrypt, gates parent-only Settings actions)*, created_at

**ChildProfile**
- id, parent (FK User), display_name, birth_year *(year only — no full DOB stored)*, age_bracket (AgeBracket, computed server-side from birth_year — never trust a client-supplied value, and never hand-authored per row), preferred_language (AppLanguage), avatar_id, pin_protected (bool), created_at
- *Streaks and "daily" logic (devotionals, streak resets) are computed using the parent's `timezone`, not server time — otherwise a family's streak can reset at the wrong local hour.*

**Book**
- id, slug, title, age_bracket_min (AgeBracket), age_bracket_max (AgeBracket) *(the inclusive range of brackets this book targets — e.g. min=`toddler`, max=`preschool` covers two brackets; a requested bracket matches if it falls within `[min, max]` by enum order)*, category (BookCategory), cover_image_asset *(a storage key/path, not a raw filename — see the note on asset fields under §4)*, is_published, content_version (int), updated_at, created_at
- *`content_version` increments whenever a published book's text, audio, or images change. The app compares its locally cached version against the server's on each sync check and re-downloads only when stale — without this, a family with an offline book never learns a typo fix or re-translation shipped.*

**BookTranslation**
- id, book (FK Book), language (AppLanguage), title_localized

**Page**
- id, book (FK Book), page_number, illustration_asset *(storage key/path, not a URL)*, layout_type

**PageContent**
- id, page (FK Page), language (AppLanguage), text, audio_asset *(storage key/path, not a URL)* — *this row is what makes a book bilingual: same Page, two PageContent rows.*

**ReadingProgress**
- id, child (FK ChildProfile), book (FK Book), current_page, completed (bool), started_at, completed_at, total_time_seconds

**Badge**
- id, code (e.g. `first_book`, `five_stories`, `seven_day_streak`), name, description, icon, trigger_rule (JSON: e.g. `{"type": "books_completed", "count": 5}`)

**ChildBadge**
- id, child (FK ChildProfile), badge (FK Badge), earned_at

**Devotional**
- id, date, category
**DevotionalTranslation**
- id, devotional (FK Devotional), language, verse_reference, verse_text, thought_text, prayer_prompt

**DownloadRecord** (for offline tracking / license validation, not full DRM in Phase 1)
- id, child (FK ChildProfile), book (FK Book), downloaded_at, device_id

This schema is deliberately Phase-2-ready: `Book.category` already includes `sunday_school`, and adding a `Classroom`/`Teacher` layer later is an additive migration, not a rewrite.

## 4. API Contract (Phase 1 endpoints)

Serverpod doesn't use hand-written REST routes — Dart `Endpoint` classes are defined on the server, and Serverpod's code generator produces a matching type-safe client the Flutter app calls like a local method. The contract below is written as endpoint methods, not URLs, to match what will actually be implemented:

```
AppUserEndpoint
     (register/login themselves are handled by serverpod_auth_idp's own
     email endpoint — SignInWidget on the client — not reimplemented here;
     this endpoint only covers the app-specific fields that module doesn't
     know about)
  getMyProfile() -> AppUser?
     (null if the signed-in user hasn't completed their profile yet, i.e.
     no consent given — lets the client skip onboarding/consent for a
     returning user without re-prompting)
  completeProfile(country, timezone, preferredLanguage, consentAccepted) -> AppUser
     (consentAccepted must be true — parental consent is a required, explicit step, not implied by signup;
     calling this again after consent was already given updates country/timezone/language
     but never overwrites the original consent_given_at)
  hasParentPin() -> bool
  setParentPin(pin) -> void (4-6 digits, stored as a bcrypt hash, never plaintext)
  verifyParentPin(pin) -> bool (throws if no PIN has been configured yet)

ChildEndpoint
  listChildren() -> List<ChildProfile>
     (scoped to the signed-in parent only — never returns another parent's children)
  createChild(displayName, birthYear, preferredLanguage, avatarId) -> ChildProfile
  updateChild(childId, ...) -> ChildProfile

LibraryEndpoint
  browseBooks({ageBracket, language, category}) -> List<BookSummary>
  getRecommended(childId) -> List<BookSummary>
     (Phase 1 rule: same category as the child's most recently completed book, matching
     age bracket, not yet read — simple, not ML-driven, but a genuine personalization
     signal rather than plain filtering)
  getBook(bookId, language) -> BookDetail (all pages + content for that language)
  getDownloadBundle(bookId) -> signed R2 asset URLs for offline caching
  checkForUpdates(childId) -> List<{bookId, contentVersion}>
     (compares locally cached versions against current; app re-downloads only stale books)

  Note on asset fields (added after the Sprint 2 architecture review): every field the
  database calls an "asset" (cover_image_asset, illustration_asset, audio_asset) stores a
  storage key/path, never a raw filename with no host. browseBooks, getRecommended, and
  getBook all resolve those keys into full URLs before returning, via AssetUrlService.

  **Sprint 2 reality, revisit before Sprint 4 (getDownloadBundle):** the short-lived
  signed-URL design below is the target, not what's built. Serverpod 4.0.0-beta.0 (the
  version this project is pinned to) has no presigned/temporary-download-URL capability
  at all — `CloudStorage.getPublicUrl` is the only way to get a URL out of R2, and it
  requires the bucket to be public. Confirmed directly against the installed package
  source, not assumed. So for now: the R2 bucket is public, `AssetUrlService` calls
  `getPublicUrl`, and every asset URL is a permanent public link — the opposite of the
  no-permanent-links design this section originally specified. This is a deliberate,
  temporary trade-off, not an unnoticed regression. Revisit once either (a) Serverpod is
  upgraded past the version that adds a temporary/presigned download URL method (exists
  on Serverpod's own main branch already, not yet in a version this project has adopted),
  or (b) assets are relayed through a private server-side endpoint instead of a direct
  URL — see docs/04_technical_primer.md §8 for the traceability/no-permanent-links
  reasoning this trade-off is temporarily setting aside.

ProgressEndpoint
  logProgress(childId, bookId, currentPage, completed) -> ProgressResult
     (triggers server-side badge evaluation as a side effect)
  getChildHistory(childId) -> List<ReadingProgress>

DevotionalEndpoint
  getToday(language) -> DevotionalDetail

BadgeEndpoint
  getChildBadges(childId) -> List<ChildBadge>

DashboardEndpoint
  getChildSummary(childId) -> DashboardSummary (time spent, streak, books completed)
```

Each `Endpoint` is a Dart class on the server; Serverpod generates the matching `client.auth.login(...)`-style calls for Flutter automatically from these method signatures — the method is written once on the server, and the typed client comes for free.

## 5. Screen List (Flutter)

Parent-facing: Onboarding/Sign up, **Parental Consent** (explicit, required before any child profile can be created — not a checkbox buried in terms-of-service), Login, Add Child Profile, Parent Dashboard, Settings (PIN, language).

Child-facing: Profile picker (avatars, no text entry required for pre-readers), Home/Library shelf (filtered by age bracket, includes a "Recommended for you" row), Book Reader (page-turn, tap-to-narrate, auto-narrate toggle, **"Read Together" mode** — a parent-initiated narration flow for shared/bedtime reading, distinct from solo child use), Badge Shelf, Daily Verse card, Downloads/Offline manager.

## 6. Non-Functional Requirements

- App must be usable by a non-reading 4-year-old with zero text input — icon/avatar navigation, audio-first.
- Reader must work fully offline once a book is downloaded.
- Time-to-first-book-open on a low-end Android device: target under 3 seconds from tap.
- All child-facing data flows contain no directly-identifying child data (no email, no full birthdate, no location).
- Streak and "daily" calculations use the family's local timezone, not server time.
- Gamification mechanics (streaks, badges) must be reviewed against Google Play Families policy and Apple's Kids Category guidelines before Sprint 8 — loss-aversion-style pressure in streak design is a known flag point for child-directed app review.
- No child profile may be created until parental consent has been explicitly recorded (`consent_given_at` set).
