BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "book_translations" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "book_translations" (
    "id" bigserial PRIMARY KEY,
    "bookId" bigint NOT NULL,
    "language" bigint NOT NULL,
    "title" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "book_translations_book_language_idx" ON "book_translations" USING btree ("bookId", "language");

--
-- ACTION DROP TABLE
--
DROP TABLE "books" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "books" (
    "id" bigserial PRIMARY KEY,
    "slug" text NOT NULL,
    "ageBracketMin" bigint NOT NULL,
    "ageBracketMax" bigint NOT NULL,
    "category" bigint NOT NULL,
    "coverImageAsset" text,
    "isPublished" boolean NOT NULL,
    "contentVersion" bigint NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "books_slug_idx" ON "books" USING btree ("slug");

--
-- ACTION DROP TABLE
--
DROP TABLE "child_profiles" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "child_profiles" (
    "id" bigserial PRIMARY KEY,
    "parentId" bigint NOT NULL,
    "displayName" text NOT NULL,
    "birthYear" bigint NOT NULL,
    "ageBracket" bigint NOT NULL,
    "preferredLanguage" text NOT NULL,
    "avatarId" text NOT NULL,
    "pinProtected" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "idx_child_profiles_parent" ON "child_profiles" USING btree ("parentId");

--
-- ACTION DROP TABLE
--
DROP TABLE "page_contents" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "page_contents" (
    "id" bigserial PRIMARY KEY,
    "pageId" bigint NOT NULL,
    "language" bigint NOT NULL,
    "text" text NOT NULL,
    "audioAsset" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "page_contents_page_language_idx" ON "page_contents" USING btree ("pageId", "language");

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
ALTER TABLE ONLY "child_profiles"
    ADD CONSTRAINT "child_profiles_fk_0"
    FOREIGN KEY("parentId")
    REFERENCES "users"("id")
    ON DELETE CASCADE
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
-- MIGRATION VERSION FOR kingdom_kids
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('kingdom_kids', '20260909081725846', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260909081725846', "timestamp" = now();

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
