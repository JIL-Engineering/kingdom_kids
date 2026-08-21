BEGIN;

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

--
-- ACTION CREATE TABLE
--
CREATE TABLE "book_translations" (
    "id" bigserial PRIMARY KEY,
    "bookId" bigint NOT NULL,
    "language" text NOT NULL,
    "title" text NOT NULL
);

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

--
-- ACTION CREATE TABLE
--
CREATE TABLE "child_badges" (
    "id" bigserial PRIMARY KEY,
    "childId" bigint NOT NULL,
    "badgeId" bigint NOT NULL,
    "earnedAt" timestamp without time zone NOT NULL
);

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

--
-- ACTION CREATE TABLE
--
CREATE TABLE "devotionals" (
    "id" bigserial PRIMARY KEY,
    "date" timestamp without time zone NOT NULL,
    "category" text
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "download_records" (
    "id" bigserial PRIMARY KEY,
    "childId" bigint NOT NULL,
    "bookId" bigint NOT NULL,
    "deviceId" text NOT NULL,
    "downloadedAt" timestamp without time zone NOT NULL
);

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

--
-- ACTION CREATE TABLE
--
CREATE TABLE "users" (
    "id" bigserial PRIMARY KEY,
    "email" text NOT NULL,
    "passwordHash" text NOT NULL,
    "country" text,
    "timezone" text NOT NULL,
    "preferredLanguage" text NOT NULL,
    "consentGivenAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR kingdom_kids
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('kingdom_kids', '20260821204304924', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260821204304924', "timestamp" = now();

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
