-- Kingdom Kids — Phase 1 (MVP) PostgreSQL Schema
-- Source of truth for the ERD and the target Serverpod .spy.yaml models should match.

CREATE EXTENSION IF NOT EXISTS "pgcrypto";  -- for gen_random_uuid()

-- =========================================================
-- USERS & CHILD PROFILES
-- =========================================================

CREATE TABLE users (
    id                  BIGSERIAL PRIMARY KEY,
    email               TEXT NOT NULL UNIQUE,
    password_hash       TEXT NOT NULL,
    country             TEXT,
    timezone            TEXT NOT NULL,
    preferred_language  TEXT NOT NULL DEFAULT 'en' CHECK (preferred_language IN ('en','fr')),
    consent_given_at    TIMESTAMPTZ,
    created_at          TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE child_profiles (
    id                  BIGSERIAL PRIMARY KEY,
    parent_id           BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    display_name        TEXT NOT NULL,
    birth_year          SMALLINT NOT NULL,
    age_bracket         TEXT NOT NULL CHECK (age_bracket IN ('3-5','6-8','9-12')),
    preferred_language  TEXT NOT NULL DEFAULT 'en' CHECK (preferred_language IN ('en','fr')),
    avatar_id           TEXT NOT NULL,
    pin_protected       BOOLEAN NOT NULL DEFAULT false,
    created_at          TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX idx_child_profiles_parent ON child_profiles(parent_id);

-- =========================================================
-- LIBRARY: BOOKS, PAGES, CONTENT
-- =========================================================

CREATE TABLE books (
    id                  BIGSERIAL PRIMARY KEY,
    slug                TEXT NOT NULL UNIQUE,
    age_bracket_min     TEXT NOT NULL CHECK (age_bracket_min IN ('3-5','6-8','9-12')),
    age_bracket_max     TEXT NOT NULL CHECK (age_bracket_max IN ('3-5','6-8','9-12')),
    category            TEXT NOT NULL CHECK (category IN
                           ('bible_story','character_building','prayer','devotional','sunday_school')),
    cover_image_asset   TEXT,
    is_published        BOOLEAN NOT NULL DEFAULT false,
    content_version     INTEGER NOT NULL DEFAULT 1,
    updated_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_at          TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE book_translations (
    id          BIGSERIAL PRIMARY KEY,
    book_id     BIGINT NOT NULL REFERENCES books(id) ON DELETE CASCADE,
    language    TEXT NOT NULL CHECK (language IN ('en','fr')),
    title       TEXT NOT NULL,
    UNIQUE (book_id, language)
);

CREATE TABLE pages (
    id                  BIGSERIAL PRIMARY KEY,
    book_id             BIGINT NOT NULL REFERENCES books(id) ON DELETE CASCADE,
    page_number         SMALLINT NOT NULL,
    illustration_asset  TEXT NOT NULL,
    layout_type         TEXT NOT NULL DEFAULT 'standard',
    UNIQUE (book_id, page_number)
);
CREATE INDEX idx_pages_book ON pages(book_id);

CREATE TABLE page_contents (
    id           BIGSERIAL PRIMARY KEY,
    page_id      BIGINT NOT NULL REFERENCES pages(id) ON DELETE CASCADE,
    language     TEXT NOT NULL CHECK (language IN ('en','fr')),
    text         TEXT NOT NULL,
    audio_asset  TEXT NOT NULL,
    UNIQUE (page_id, language)
);

-- =========================================================
-- PROGRESS, GAMIFICATION
-- =========================================================

CREATE TABLE reading_progress (
    id                   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    child_id             BIGINT NOT NULL REFERENCES child_profiles(id) ON DELETE CASCADE,
    book_id              BIGINT NOT NULL REFERENCES books(id),
    current_page         SMALLINT NOT NULL,
    completed            BOOLEAN NOT NULL DEFAULT false,
    started_at           TIMESTAMPTZ NOT NULL,
    completed_at         TIMESTAMPTZ,
    total_time_seconds   INTEGER NOT NULL DEFAULT 0,
    synced_at            TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX idx_progress_child_book ON reading_progress(child_id, book_id);
CREATE INDEX idx_progress_child_started ON reading_progress(child_id, started_at);

CREATE TABLE badges (
    id             BIGSERIAL PRIMARY KEY,
    code           TEXT NOT NULL UNIQUE,
    name           TEXT NOT NULL,
    description    TEXT NOT NULL,
    icon_asset     TEXT NOT NULL,
    trigger_rule   JSONB NOT NULL
);

CREATE TABLE child_badges (
    id          BIGSERIAL PRIMARY KEY,
    child_id    BIGINT NOT NULL REFERENCES child_profiles(id) ON DELETE CASCADE,
    badge_id    BIGINT NOT NULL REFERENCES badges(id),
    earned_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (child_id, badge_id)
);

-- =========================================================
-- DEVOTIONALS
-- =========================================================

CREATE TABLE devotionals (
    id        BIGSERIAL PRIMARY KEY,
    date      DATE NOT NULL UNIQUE,
    category  TEXT
);

CREATE TABLE devotional_translations (
    id               BIGSERIAL PRIMARY KEY,
    devotional_id    BIGINT NOT NULL REFERENCES devotionals(id) ON DELETE CASCADE,
    language         TEXT NOT NULL CHECK (language IN ('en','fr')),
    verse_reference  TEXT NOT NULL,
    verse_text       TEXT NOT NULL,
    thought_text     TEXT NOT NULL,
    prayer_prompt    TEXT NOT NULL,
    UNIQUE (devotional_id, language)
);

-- =========================================================
-- DOWNLOADS
-- =========================================================

CREATE TABLE download_records (
    id             UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    child_id       BIGINT NOT NULL REFERENCES child_profiles(id) ON DELETE CASCADE,
    book_id        BIGINT NOT NULL REFERENCES books(id),
    device_id      TEXT NOT NULL,
    downloaded_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX idx_downloads_child_book ON download_records(child_id, book_id);
