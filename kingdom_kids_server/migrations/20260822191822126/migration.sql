BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "child_badges" DROP CONSTRAINT IF EXISTS "child_badges_fk_0";
ALTER TABLE "child_badges" DROP CONSTRAINT IF EXISTS "child_badges_fk_1";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "child_profiles" DROP CONSTRAINT IF EXISTS "child_profiles_fk_0";
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
-- MIGRATION VERSION FOR kingdom_kids
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('kingdom_kids', '20260822191822126', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260822191822126', "timestamp" = now();

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
