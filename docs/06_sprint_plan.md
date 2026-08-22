# Kingdom Kids — Phase 1 Sprint Plan

Eight two-week sprints from empty repo to a pilot-ready MVP (~4 months, matches the earlier timeline estimate).

**Sprint 0 (setup, ~3-5 days, not counted in the 8):** repos created, CI skeleton, Serverpod project + Postgres running locally, Flutter project running on emulator, R2 bucket provisioned, Serverpod models generated from the schema above.

**Sprint 1 — Auth & Profiles:** parent signup/login (JWT), explicit parental consent step, child profile CRUD, profile picker UI, PIN-protected parent settings gate. *Deliverable: a parent can create an account, give consent, and add a child profile.*

**Sprint 2 — Content Pipeline & First Books:** Google Sheet template + import script pushing Book/Page/PageContent rows into Postgres, digitize and upload 3-5 real CMFI books (both languages), R2 asset pipeline working. *Deliverable: real Kingdom Kids content exists in the database.*

**Sprint 3 — The Reader:** Flutter book reader screen — page-turn animation, illustration rendering, tap-to-narrate + auto-narrate audio playback, language switch. *Deliverable: a child can open and read/listen to a real book end-to-end.*

**Sprint 4 — Library & Offline:** library/shelf browsing UI filtered by age bracket, "Recommended for you" row, download-for-offline flow, local storage of book bundles, offline reader playback, content-version sync check. *Deliverable: the core loop works with no internet, and stays fresh when content updates.*

**Sprint 5 — Progress, Streaks & Badges:** progress event logging, streak calculation, badge trigger evaluation, badge shelf UI. *Deliverable: reading is tracked and rewarded.*

**Sprint 6 — Devotionals & Notifications:** daily verse/devotional model + UI card, Firebase push notification for daily reminder and streak-at-risk nudges. *Deliverable: the app has a reason to open every day.*

**Sprint 7 — Parent Dashboard:** dashboard summary endpoint + Flutter screens (time spent, books completed, streaks, favorite books). *Deliverable: parents can see their child's spiritual/reading growth.*

**Sprint 8 — Polish & Pilot Prep:** onboarding flow polish, empty states, error handling, child-directed-treatment analytics configuration, App Store/Play Families policy compliance review (gamification mechanics, consent flow, SDK audit), app store listing assets, TestFlight/Play internal testing setup, digitize remaining titles up to 15-25, tested Postgres/R2 backup and restore procedure confirmed working. *Deliverable: ready to hand to the pilot church(es) from Section 8 of the strategy doc.*

**Pilot success metrics (defined before the pilot starts, not after):** target day-7 return rate, minimum average reading time per child per week, and a qualitative feedback score from pilot teachers/parents — these are proposed starting points for JIL Engineering and CMFI to set real numbers against before Sprint 8 ends.

**After Sprint 8:** pilot with 1-2 partner churches/Sunday schools (2-4 weeks), measured against the metrics above, gather feedback, fix, then public launch. Phase 2 (Sunday school tools, memorization games) planning begins based on real pilot feedback rather than assumptions.

Each sprint gets its own working session — progress is tracked against this plan, with Sprint 0 starting once setup decisions are confirmed.
