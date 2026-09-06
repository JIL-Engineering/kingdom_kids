# Lottie animations

Bundled JSON animations for app UI/UX chrome — loading states, celebrations, empty
states, onboarding flourishes. Rendered with the `lottie` package (see pubspec.yaml).

This is **not** where book illustrations go. Per-book art is content, not app UI, and
follows the R2 + CSV import pipeline described in `content/README.md` instead.

## Naming convention

`snake_case`, descriptive of what the animation shows, e.g.:

- `loading_spinner.json`
- `badge_earned.json`
- `confetti_burst.json`
- `empty_library.json`

## Adding a new animation

1. Drop the exported `.json` file in this folder.
2. It's picked up automatically — `assets/lottie/` is declared as a directory asset in
   `pubspec.yaml`, so every file placed here is bundled without editing the pubspec.
3. Use it with `Lottie.asset('assets/lottie/<file_name>.json')`.

## What's here now

`loading_spinner.json`, `badge_earned.json`, `success_check.json` — three original
animations hand-built for this project (not sourced from a third party, so no
license/attribution concerns), using the app's actual brand colors from
`lib/core/theme/app_colors.dart` (navy `#1A1F36`, amber `#F5A623`/`#FCBF1E`, success
green `#10B981`). They're a starter set covering the three most common UI-animation
needs (loading state, celebration/reward, success confirmation) — swap any of them
for a designer-made animation later without changing the naming convention or the
`pubspec.yaml` wiring.

