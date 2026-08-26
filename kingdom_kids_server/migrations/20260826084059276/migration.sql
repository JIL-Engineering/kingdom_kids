BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "page_content" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "page" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "download_record" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "devotional_translation" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "devotional" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "child_badge" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "book_translation" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "reading_progress" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "book" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "badge" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "badges" (
    "id" bigserial PRIMARY KEY,
    "code" text NOT NULL,
    "name" text NOT NULL,
    "description" text NOT NULL,
    "iconAsset" text NOT NULL,
    "triggerRule" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "badges_code_idx" ON "badges" USING btree ("code");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "book_translations" (
    "id" bigserial PRIMARY KEY,
    "bookId" bigint NOT NULL,
    "language" text NOT NULL,
    "title" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "book_translations_book_language_idx" ON "book_translations" USING btree ("bookId", "language");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "books" (
    "id" bigserial PRIMARY KEY,
    "slug" text NOT NULL,
    "ageBracketMin" text NOT NULL,
    "ageBracketMax" text NOT NULL,
    "category" text NOT NULL,
    "coverImageAsset" text,
    "isPublished" boolean NOT NULL,
    "contentVersion" bigint NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "books_slug_idx" ON "books" USING btree ("slug");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "child_badges" (
    "id" bigserial PRIMARY KEY,
    "childId" bigint NOT NULL,
    "badgeId" bigint NOT NULL,
    "earnedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "child_badges_child_badge_idx" ON "child_badges" USING btree ("childId", "badgeId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "devotional_translations" (
    "id" bigserial PRIMARY KEY,
    "devotionalId" bigint NOT NULL,
    "language" text NOT NULL,
    "verseReference" text NOT NULL,
    "verseText" text NOT NULL,
    "thoughtText" text NOT NULL,
    "prayerPrompt" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "devotional_translations_devotional_language_idx" ON "devotional_translations" USING btree ("devotionalId", "language");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "devotionals" (
    "id" bigserial PRIMARY KEY,
    "date" timestamp without time zone NOT NULL,
    "category" text
);

-- Indexes
CREATE UNIQUE INDEX "devotionals_date_idx" ON "devotionals" USING btree ("date");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "download_records" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "childId" bigint NOT NULL,
    "bookId" bigint NOT NULL,
    "deviceId" text NOT NULL,
    "downloadedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "idx_downloads_child_book" ON "download_records" USING btree ("childId", "bookId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "page_contents" (
    "id" bigserial PRIMARY KEY,
    "pageId" bigint NOT NULL,
    "language" text NOT NULL,
    "text" text NOT NULL,
    "audioAsset" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "page_contents_page_language_idx" ON "page_contents" USING btree ("pageId", "language");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "pages" (
    "id" bigserial PRIMARY KEY,
    "bookId" bigint NOT NULL,
    "pageNumber" bigint NOT NULL,
    "illustrationAsset" text NOT NULL,
    "layoutType" text NOT NULL
);

-- Indexes
CREATE INDEX "idx_pages_book" ON "pages" USING btree ("bookId");
CREATE UNIQUE INDEX "pages_book_number_idx" ON "pages" USING btree ("bookId", "pageNumber");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "reading_progress" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "childId" bigint NOT NULL,
    "bookId" bigint NOT NULL,
    "currentPage" bigint NOT NULL,
    "completed" boolean NOT NULL,
    "startedAt" timestamp without time zone NOT NULL,
    "completedAt" timestamp without time zone,
    "totalTimeSeconds" bigint NOT NULL,
    "syncedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "idx_progress_child_book" ON "reading_progress" USING btree ("childId", "bookId");
CREATE INDEX "idx_progress_child_started" ON "reading_progress" USING btree ("childId", "startedAt");

--
-- ACTION DROP TABLE
--
DROP TABLE "users" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "users" (
    "id" bigserial PRIMARY KEY,
    "authUserId" uuid NOT NULL,
    "country" text,
    "timezone" text NOT NULL,
    "preferredLanguage" text NOT NULL,
    "consentGivenAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "users_auth_user_idx" ON "users" USING btree ("authUserId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "book_translations"
    ADD CONSTRAINT "book_translations_fk_0"
    FOREIGN KEY("bookId")
    REFERENCES "books"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "child_badges"
    ADD CONSTRAINT "child_badges_fk_0"
    FOREIGN KEY("childId")
    REFERENCES "child_profiles"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "child_badges"
    ADD CONSTRAINT "child_badges_fk_1"
    FOREIGN KEY("badgeId")
    REFERENCES "badges"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "devotional_translations"
    ADD CONSTRAINT "devotional_translations_fk_0"
    FOREIGN KEY("devotionalId")
    REFERENCES "devotionals"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "download_records"
    ADD CONSTRAINT "download_records_fk_0"
    FOREIGN KEY("childId")
    REFERENCES "child_profiles"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "download_records"
    ADD CONSTRAINT "download_records_fk_1"
    FOREIGN KEY("bookId")
    REFERENCES "books"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "page_contents"
    ADD CONSTRAINT "page_contents_fk_0"
    FOREIGN KEY("pageId")
    REFERENCES "pages"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "pages"
    ADD CONSTRAINT "pages_fk_0"
    FOREIGN KEY("bookId")
    REFERENCES "books"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "reading_progress"
    ADD CONSTRAINT "reading_progress_fk_0"
    FOREIGN KEY("childId")
    REFERENCES "child_profiles"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "reading_progress"
    ADD CONSTRAINT "reading_progress_fk_1"
    FOREIGN KEY("bookId")
    REFERENCES "books"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "users"
    ADD CONSTRAINT "users_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION RESTORE FOREIGN KEY
--
ALTER TABLE ONLY "child_profiles"
    ADD CONSTRAINT "child_profiles_fk_0"
    FOREIGN KEY("parentId")
    REFERENCES "users"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR kingdom_kids
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('kingdom_kids', '20260826084059276', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260826084059276', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260416151914983-insights-perf', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260416151914983-insights-perf', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260417182309198', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260417182309198', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260417182253191', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260417182253191', "timestamp" = now();


COMMIT;
