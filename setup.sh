#!/usr/bin/env bash
set -e

ORG="JIL-Engineering"          # <-- replace with actual GitHub org name
REPO="kingdom_kids"

# 1. Create the repo
gh repo create "$ORG/$REPO" --private --description "Kingdom Kids — CMFI children's discipleship app"

cd "$(gh repo view "$ORG/$REPO" --json name -q .name)" 2>/dev/null || { git clone "git@github.com:$ORG/$REPO.git" && cd "$REPO"; }

# 2. Branch protection on main — PRs required, at least one review, CI must pass
gh api repos/$ORG/$REPO/branches/main/protection -X PUT \
  -H "Accept: application/vnd.github+json" \
  -f required_status_checks='{"strict":true,"contexts":["ci"]}' \
  -f enforce_admins=true \
  -f required_pull_request_reviews='{"required_approving_review_count":1}' \
  -f restrictions=null

# 3. Labels — track (who), type (what kind of work), priority
gh label create "track:pair-a"   -c "1D76DB" -d "Auth/Profiles → Reader track" -R "$ORG/$REPO"
gh label create "track:pair-b"   -c "0E8A16" -d "Content Pipeline → Devotionals track" -R "$ORG/$REPO"
gh label create "track:joint"    -c "5319E7" -d "Whole-team work" -R "$ORG/$REPO"
gh label create "type:backend"   -c "D93F0B" -R "$ORG/$REPO"
gh label create "type:flutter"   -c "FBCA04" -R "$ORG/$REPO"
gh label create "type:content"   -c "C2E0C6" -R "$ORG/$REPO"
gh label create "type:compliance" -c "B60205" -R "$ORG/$REPO"

# 4. Milestones — one per sprint
for m in "Sprint 0 — Setup" "Sprint 1 — Auth & Profiles" "Sprint 2 — Content Pipeline" \
         "Sprint 3 — The Reader" "Sprint 4 — Library & Offline" "Sprint 5 — Progress & Badges" \
         "Sprint 6 — Devotionals & Notifications" "Sprint 7 — Parent Dashboard" \
         "Sprint 8 — Polish & Pilot Prep"; do
  gh api repos/$ORG/$REPO/milestones -X POST -f title="$m" > /dev/null
done

# 5. Issues — one per deliverable, labeled by track, assigned to its milestone
new_issue () { gh issue create -R "$ORG/$REPO" --title "$1" --label "$2" --milestone "$3"; }

new_issue "Serverpod + Postgres + Flutter project scaffolding"          "track:joint,type:backend"     "Sprint 0 — Setup"
new_issue "Parent signup/login (JWT) + parental consent step"           "track:pair-a,type:backend"    "Sprint 1 — Auth & Profiles"
new_issue "Child profile CRUD + profile picker UI"                      "track:pair-a,type:flutter"    "Sprint 1 — Auth & Profiles"
new_issue "PIN-protected parent settings gate"                          "track:pair-a,type:flutter"    "Sprint 1 — Auth & Profiles"
new_issue "Google Sheet template + import script"                       "track:pair-b,type:content"    "Sprint 2 — Content Pipeline"
new_issue "Digitize and upload 3–5 real books (EN/FR)"                  "track:pair-b,type:content"    "Sprint 2 — Content Pipeline"
new_issue "Book reader screen: page-turn, narration, language switch"   "track:pair-a,type:flutter"    "Sprint 3 — The Reader"
new_issue "Library/shelf browsing UI + recommended row"                 "track:joint,type:flutter"     "Sprint 4 — Library & Offline"
new_issue "Offline download flow + content-version sync check"          "track:joint,type:backend"     "Sprint 4 — Library & Offline"
new_issue "Progress event logging + streak calculation (timezone-aware)" "track:joint,type:backend"    "Sprint 5 — Progress & Badges"
new_issue "Badge trigger evaluation + badge shelf UI"                   "track:joint,type:flutter"     "Sprint 5 — Progress & Badges"
new_issue "Daily devotional model + UI card"                            "track:pair-b,type:flutter"    "Sprint 6 — Devotionals & Notifications"
new_issue "FCM push notifications: daily reminder, streak-at-risk"      "track:pair-b,type:backend"    "Sprint 6 — Devotionals & Notifications"
new_issue "Parent dashboard summary endpoint + screens"                 "track:joint,type:flutter"     "Sprint 7 — Parent Dashboard"
new_issue "App Store/Play Families policy compliance review"            "track:joint,type:compliance"  "Sprint 8 — Polish & Pilot Prep"
new_issue "Backup/restore procedure tested for Postgres + R2"           "track:joint,type:backend"     "Sprint 8 — Polish & Pilot Prep"
new_issue "Onboarding polish, empty states, error handling"             "track:joint,type:flutter"     "Sprint 8 — Polish & Pilot Prep"

# 6. Project board (GitHub Projects v2)
gh project create --owner "$ORG" --title "Kingdom Kids Build"
echo "Now open the project in the browser and add fields: Status (Backlog/In Progress/In Review/Done), Track."