# Kingdom Kids — Technical Primer

*A plain-language reference for the JIL Engineering team on how Kingdom Kids works technically, before implementation begins.*

## 1. The Big Picture

Two pieces of software, one shared "brain":

- **The Flutter app** — what a parent or child actually touches, on their phone or tablet.
- **The Serverpod server** — a Dart program running on a server (not the child's phone) that owns the database, decides what content each child sees, tracks progress, and hands out badges.

They talk over the internet. The app asks the server "give me today's devotional in French," the server answers. When there's no internet, the app falls back to whatever it already downloaded.

## 2. Why One Language (Dart) for Both Sides Matters

Normally, a mobile app and its backend are written in two different languages (e.g., Flutter/Dart for the app, Python/Django for the server), and the team has to manually keep both sides agreeing on what a "Book" or "ChildProfile" looks like. Drift happens: a field gets added on one side and forgotten on the other, and the app breaks on a field that doesn't exist.

Serverpod removes that risk: a data model (say, `ChildProfile`) is defined **once**, in one file. Serverpod's code generator then produces matching Dart classes for both the server and the Flutter app, plus the network code to move that data between them. There's no "fetch JSON, hope the keys match" — the Flutter side calls `client.child.createChild(...)` like a local function, fully type-checked at compile time. This is the core practical reason this stack fits the team's existing skill set.

## 3. What "The Database" Actually Holds

PostgreSQL (Postgres) is the one source of truth. Everything in the app is really just a view onto rows in this database: which books exist, what page 4 of "David and Goliath" says in French, which badges a child has earned, what today's devotional is. The full table list is in the technical spec — the concept to hold onto is that **content and app logic are separate**: adding a new book is a data operation (a row in the database), never a code change or app store release.

## 4. Where Images and Audio Actually Live

Illustrations and narration audio are large files — too large and too slow-changing to store directly in the database. They live in **Cloudflare R2**, cloud file storage similar to Amazon S3 but without the same download-cost fees (relevant at ministry budget scale, since every child streaming/downloading audio and images adds up). The database just stores a *reference* (a filename/URL) to where the actual file lives in R2. A CDN sits in front of R2 so a child in, say, Yaoundé or Paris gets the file from a nearby server rather than one round-trip to R2's origin.

## 5. How Content Gets In (No Custom Admin Panel — On Purpose)

Kingdom Kids deliberately does *not* have a custom content-management screen for Phase 1. The content team fills out a Google Sheet (title, page text per language, references to illustration/audio files), and an import script reads that sheet and writes the corresponding rows into Postgres and files into R2. It's unglamorous, but it's fast to build and it's a tool non-technical people already know. This is a deliberate trade-off (see the backend decision doc) — revisit it only if/when the content team's volume outgrows a spreadsheet.

## 6. How Offline Works

When a child taps "download" on a book, the app fetches all of that book's text, images, and audio from R2 and stores them **on the device itself**, using local storage (Hive or SQLite — a small database that lives inside the app, not on the internet). From then on, opening that book reads from the device, not the network — the app checks "is this available locally?" before ever trying to reach the server.

Reading progress, badge triggers, and streaks work the same way in reverse: if a child reads offline, those events queue up locally and push to the server the next time there's a connection. This is why the data model has explicit "logProgress" events rather than a single "current page" number — events survive being queued and replayed; a single overwritten number doesn't.

## 7. Authentication, in Plain Terms

A parent creates an account with an email and password. On login, the server hands back a **session token** (a long random string) — a temporary ID badge. The app stores that token and includes it with every request afterward, so the server knows which parent (and which of their children) is asking. Tokens expire and refresh automatically; the child never has their own login — they're a profile that exists *under* the parent's account, with no independent credentials, which is deliberate: no email, password, or personal login for a child anywhere in the system.

## 8. Content Protection — What Is (and Isn't) Being Done

"DRM" sounds like one big feature; in practice this is three modest, achievable measures for Phase 1, not an anti-piracy fortress:

- Downloaded files are stored encrypted on the device, not as plain files anyone could copy out.
- **The target** is temporary, expiring links to stream or download content (a "signed URL") rather than permanent public links — a link used today won't still work if copied and shared next month. **What's actually live as of Sprint 2** is not that: the pinned Serverpod version (4.0.0-beta.0) has no signed/temporary-download-URL capability at all, so the R2 bucket is public for now and every asset URL is a permanent link. This is a known, deliberate, temporary gap, not an unnoticed one — see `docs/03_technical_spec.md` §4 for the full explanation and what closes it (a Serverpod upgrade, or a private byte-relay endpoint).
- An identifier (which parent account downloaded a file) can be quietly embedded into content, so if something does leak, it's traceable.

Enterprise-grade DRM (the kind that prevents all forms of extraction/screen recording) is explicitly out of scope for Phase 1 — that's expensive and complex, and not justified until piracy is an observed problem rather than a hypothetical one.

## 9. Multilingual Content, Concretely

A book isn't stored once per language — it's stored **once**, with each page having one row of content *per language*. English and French versions of "David and Goliath" share the same `Book` and `Page` records (same illustrations, same page order) but have separate `PageContent` rows for the text and audio. Practically: adding a third language later doesn't touch the book or page structure at all — it just adds new `PageContent` rows. Illustrations don't need to be redone.

## 10. Notifications

Firebase Cloud Messaging (FCM) is the standard way both iOS and Android apps receive push notifications, regardless of backend. The server tells FCM "send this message to this device," and FCM handles delivery through Apple's and Google's own notification systems. This is used for daily devotional reminders and "your streak is about to break" nudges.

## 11. Setup Needed Before Sprint 0

- A Serverpod project (needs Docker for local Postgres — Serverpod's CLI scaffolds this)
- A Flutter project targeting the `com.jilengineering.kingdomkids` package/bundle ID
- A Cloudflare account with an R2 bucket created
- A Firebase project (free tier is fine to start) for FCM
- A GitHub org/repo for JIL Engineering to host the codebase
- Apple Developer Program and Google Play Console accounts, once closer to Sprint 8

## 12. The One-Sentence Version

The app is a thin, offline-capable window into a database of bilingual books and a child's progress through them; Serverpod is the single Dart program that owns that database and enforces the rules (what's visible, what earns a badge, what's today's devotional); everything else in this primer is detail on how those two pieces talk to each other and to the outside world (storage, notifications, content entry).
