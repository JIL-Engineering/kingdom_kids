BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "badge" (
    "id" bigserial PRIMARY KEY,
    "code" text NOT NULL,
    "name" text NOT NULL,
    "description" text NOT NULL,
    "iconAsset" text NOT NULL,
    "triggerRule" json NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "badge__code__unique_idx" ON "badge" USING btree ("code");
CREATE UNIQUE INDEX "badges_code_idx" ON "badge" USING btree ("code");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "book" (
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
CREATE UNIQUE INDEX "book__slug__unique_idx" ON "book" USING btree ("slug");
CREATE UNIQUE INDEX "books_slug_idx" ON "book" USING btree ("slug");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "book_translation" (
    "id" bigserial PRIMARY KEY,
    "bookId" bigint NOT NULL,
    "language" text NOT NULL,
    "title" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "idx_book_translations_book_lang" ON "book_translation" USING btree ("bookId", "language");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "child_badge" (
    "id" bigserial PRIMARY KEY,
    "childId" bigint NOT NULL,
    "badgeId" bigint NOT NULL,
    "earnedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "idx_child_badges_child_badge" ON "child_badge" USING btree ("childId", "badgeId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "child_profiles" (
    "id" bigserial PRIMARY KEY,
    "parentId" bigint NOT NULL,
    "displayName" text NOT NULL,
    "birthYear" bigint NOT NULL,
    "ageBracket" text NOT NULL,
    "preferredLanguage" text NOT NULL,
    "avatarId" text NOT NULL,
    "pinProtected" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "idx_child_profiles_parent" ON "child_profiles" USING btree ("parentId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "devotional" (
    "id" bigserial PRIMARY KEY,
    "date" timestamp without time zone NOT NULL,
    "category" text
);

-- Indexes
CREATE UNIQUE INDEX "devotional__date__unique_idx" ON "devotional" USING btree ("date");
CREATE UNIQUE INDEX "devotionals_date_idx" ON "devotional" USING btree ("date");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "devotional_translation" (
    "id" bigserial PRIMARY KEY,
    "devotionalId" bigint NOT NULL,
    "language" text NOT NULL,
    "verseReference" text NOT NULL,
    "verseText" text NOT NULL,
    "thoughtText" text NOT NULL,
    "prayerPrompt" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "idx_devotional_translations_dev_lang" ON "devotional_translation" USING btree ("devotionalId", "language");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "download_record" (
    "id" bigserial PRIMARY KEY,
    "childId" bigint NOT NULL,
    "bookId" bigint NOT NULL,
    "deviceId" text NOT NULL,
    "downloadedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "idx_downloads_child_book" ON "download_record" USING btree ("childId", "bookId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "page" (
    "id" bigserial PRIMARY KEY,
    "bookId" bigint NOT NULL,
    "pageNumber" bigint NOT NULL,
    "illustrationAsset" text NOT NULL,
    "layoutType" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "idx_pages_book_number" ON "page" USING btree ("bookId", "pageNumber");
CREATE INDEX "idx_pages_book" ON "page" USING btree ("bookId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "page_content" (
    "id" bigserial PRIMARY KEY,
    "pageId" bigint NOT NULL,
    "language" text NOT NULL,
    "text" text NOT NULL,
    "audioAsset" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "idx_page_contents_page_lang" ON "page_content" USING btree ("pageId", "language");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "reading_progress" (
    "id" bigserial PRIMARY KEY,
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
-- ACTION CREATE TABLE
--
CREATE TABLE "users" (
    "id" bigserial PRIMARY KEY,
    "email" text NOT NULL,
    "authUserId" bigint NOT NULL,
    "country" text,
    "timezone" text NOT NULL,
    "preferredLanguage" text NOT NULL,
    "consentGivenAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "users_email_idx" ON "users" USING btree ("email");
CREATE UNIQUE INDEX "users_auth_user_id_idx" ON "users" USING btree ("authUserId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "book_translation"
    ADD CONSTRAINT "book_translation_fk_0"
    FOREIGN KEY("bookId")
    REFERENCES "book"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "child_badge"
    ADD CONSTRAINT "child_badge_fk_0"
    FOREIGN KEY("childId")
    REFERENCES "child_profiles"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "child_badge"
    ADD CONSTRAINT "child_badge_fk_1"
    FOREIGN KEY("badgeId")
    REFERENCES "badge"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "child_profiles"
    ADD CONSTRAINT "child_profiles_fk_0"
    FOREIGN KEY("parentId")
    REFERENCES "users"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "devotional_translation"
    ADD CONSTRAINT "devotional_translation_fk_0"
    FOREIGN KEY("devotionalId")
    REFERENCES "devotional"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "download_record"
    ADD CONSTRAINT "download_record_fk_0"
    FOREIGN KEY("childId")
    REFERENCES "child_profiles"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "download_record"
    ADD CONSTRAINT "download_record_fk_1"
    FOREIGN KEY("bookId")
    REFERENCES "book"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "page"
    ADD CONSTRAINT "page_fk_0"
    FOREIGN KEY("bookId")
    REFERENCES "book"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "page_content"
    ADD CONSTRAINT "page_content_fk_0"
    FOREIGN KEY("pageId")
    REFERENCES "page"("id")
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
    REFERENCES "book"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR kingdom_kids
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('kingdom_kids', '20260825155353858', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260825155353858', "timestamp" = now();

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
