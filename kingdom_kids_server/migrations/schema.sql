DROP TABLE IF EXISTS download_records, devotional_translations, devotionals, child_badges, badges, reading_progress, page_contents, pages, book_translations, books, child_profiles, users CASCADE;
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE "users" (
  "id" BIGSERIAL PRIMARY KEY,
  "email" TEXT UNIQUE NOT NULL,
  "password_hash" TEXT NOT NULL,
  "country" TEXT,
  "timezone" TEXT NOT NULL,
  "preferred_language" TEXT NOT NULL CHECK (preferred_language IN ('en','fr')) DEFAULT 'en',
  "consent_given_at" TIMESTAMPTZ,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE "child_profiles" (
  "id" BIGSERIAL PRIMARY KEY,
  "parent_id" BIGINT NOT NULL,
  "display_name" TEXT NOT NULL,
  "birth_year" SMALLINT NOT NULL,
  "age_bracket" TEXT NOT NULL CHECK (age_bracket IN ('3-5','6-8','9-12')),
  "preferred_language" TEXT NOT NULL CHECK (preferred_language IN ('en','fr')) DEFAULT 'en',
  "avatar_id" TEXT NOT NULL,
  "pin_protected" BOOLEAN NOT NULL DEFAULT false,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE "books" (
  "id" BIGSERIAL PRIMARY KEY,
  "slug" TEXT UNIQUE NOT NULL,
  "age_bracket_min" TEXT NOT NULL CHECK (age_bracket_min IN ('3-5','6-8','9-12')),
  "age_bracket_max" TEXT NOT NULL CHECK (age_bracket_max IN ('3-5','6-8','9-12')),
  "category" TEXT NOT NULL CHECK (category IN ('bible_story','character_building','prayer','devotional','sunday_school')),
  "cover_image_asset" TEXT,
  "is_published" BOOLEAN NOT NULL DEFAULT false,
  "content_version" INTEGER NOT NULL DEFAULT 1,
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT now(),
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE "book_translations" (
  "id" BIGSERIAL PRIMARY KEY,
  "book_id" BIGINT NOT NULL,
  "language" TEXT NOT NULL CHECK (language IN ('en','fr')),
  "title" TEXT NOT NULL
);

CREATE TABLE "pages" (
  "id" BIGSERIAL PRIMARY KEY,
  "book_id" BIGINT NOT NULL,
  "page_number" SMALLINT NOT NULL,
  "illustration_asset" TEXT NOT NULL,
  "layout_type" TEXT NOT NULL DEFAULT 'standard'
);

CREATE TABLE "page_contents" (
  "id" BIGSERIAL PRIMARY KEY,
  "page_id" BIGINT NOT NULL,
  "language" TEXT NOT NULL CHECK (language IN ('en','fr')),
  "text" TEXT NOT NULL,
  "audio_asset" TEXT NOT NULL
);

CREATE TABLE "reading_progress" (
  "id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  "child_id" BIGINT NOT NULL,
  "book_id" BIGINT NOT NULL,
  "current_page" SMALLINT NOT NULL,
  "completed" BOOLEAN NOT NULL DEFAULT false,
  "started_at" TIMESTAMPTZ NOT NULL,
  "completed_at" TIMESTAMPTZ,
  "total_time_seconds" INTEGER NOT NULL DEFAULT 0,
  "synced_at" TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE "badges" (
  "id" BIGSERIAL PRIMARY KEY,
  "code" TEXT UNIQUE NOT NULL,
  "name" TEXT NOT NULL,
  "description" TEXT NOT NULL,
  "icon_asset" TEXT NOT NULL,
  "trigger_rule" JSONB NOT NULL
);

CREATE TABLE "child_badges" (
  "id" BIGSERIAL PRIMARY KEY,
  "child_id" BIGINT NOT NULL,
  "badge_id" BIGINT NOT NULL,
  "earned_at" TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE "devotionals" (
  "id" BIGSERIAL PRIMARY KEY,
  "date" DATE UNIQUE NOT NULL,
  "category" TEXT
);

CREATE TABLE "devotional_translations" (
  "id" BIGSERIAL PRIMARY KEY,
  "devotional_id" BIGINT NOT NULL,
  "language" TEXT NOT NULL CHECK (language IN ('en','fr')),
  "verse_reference" TEXT NOT NULL,
  "verse_text" TEXT NOT NULL,
  "thought_text" TEXT NOT NULL,
  "prayer_prompt" TEXT NOT NULL
);

CREATE TABLE "download_records" (
  "id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  "child_id" BIGINT NOT NULL,
  "book_id" BIGINT NOT NULL,
  "device_id" TEXT NOT NULL,
  "downloaded_at" TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Index
CREATE INDEX "idx_child_profiles_parent" ON "child_profiles" ("parent_id");
CREATE UNIQUE INDEX ON "book_translations" ("book_id", "language");
CREATE UNIQUE INDEX ON "pages" ("book_id", "page_number");
CREATE INDEX "idx_pages_book" ON "pages" ("book_id");
CREATE UNIQUE INDEX ON "page_contents" ("page_id", "language");
CREATE INDEX "idx_progress_child_book" ON "reading_progress" ("child_id", "book_id");
CREATE INDEX "idx_progress_child_started" ON "reading_progress" ("child_id", "started_at");
CREATE UNIQUE INDEX ON "child_badges" ("child_id", "badge_id");
CREATE UNIQUE INDEX ON "devotional_translations" ("devotional_id", "language");
CREATE INDEX "idx_downloads_child_book" ON "download_records" ("child_id", "book_id");

-- Foreign Keys
ALTER TABLE "child_profiles" ADD FOREIGN KEY ("parent_id") REFERENCES "users" ("id") ON DELETE CASCADE;
ALTER TABLE "book_translations" ADD FOREIGN KEY ("book_id") REFERENCES "books" ("id") ON DELETE CASCADE;
ALTER TABLE "pages" ADD FOREIGN KEY ("book_id") REFERENCES "books" ("id") ON DELETE CASCADE;
ALTER TABLE "page_contents" ADD FOREIGN KEY ("page_id") REFERENCES "pages" ("id") ON DELETE CASCADE;
ALTER TABLE "reading_progress" ADD FOREIGN KEY ("child_id") REFERENCES "child_profiles" ("id") ON DELETE CASCADE;
ALTER TABLE "reading_progress" ADD FOREIGN KEY ("book_id") REFERENCES "books" ("id");
ALTER TABLE "child_badges" ADD FOREIGN KEY ("child_id") REFERENCES "child_profiles" ("id") ON DELETE CASCADE;
ALTER TABLE "child_badges" ADD FOREIGN KEY ("badge_id") REFERENCES "badges" ("id");
ALTER TABLE "devotional_translations" ADD FOREIGN KEY ("devotional_id") REFERENCES "devotionals" ("id") ON DELETE CASCADE;
ALTER TABLE "download_records" ADD FOREIGN KEY ("child_id") REFERENCES "child_profiles" ("id") ON DELETE CASCADE;
ALTER TABLE "download_records" ADD FOREIGN KEY ("book_id") REFERENCES "books" ("id");