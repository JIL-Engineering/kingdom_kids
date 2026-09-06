# UI sound effects

Bundled short sound effects for app UI/UX chrome — button taps, page turns, achievement
chimes. Played with the `audioplayers` package (see pubspec.yaml).

This is **not** where book narration audio goes. Per-page narration is content, not app
UI, and follows the R2 + CSV import pipeline described in `content/README.md` instead
(`audio_filename_en` / `audio_filename_fr` columns).

## Naming convention

`snake_case`, descriptive of when the sound plays, e.g.:

- `button_tap.mp3`
- `page_turn.mp3`
- `achievement_chime.mp3`

## Adding a new sound

1. Drop the audio file (`.mp3` preferred; keep files short and low-bitrate — these ship
   inside the app bundle) in this folder.
2. It's picked up automatically — `assets/sounds/` is declared as a directory asset in
   `pubspec.yaml`, so every file placed here is bundled without editing the pubspec.
3. Play it with an `AudioPlayer` from `audioplayers`, e.g.
   `AudioPlayer().play(AssetSource('sounds/<file_name>.mp3'))`.

## What's here now

`button_tap.mp3`, `page_turn.mp3`, `achievement_chime.mp3` — a starter set sourced
from Mixkit (free, no attribution required). See `CREDITS.md` for exact sources and
license terms before adding more third-party files.
