# Okhati

Okhati is a Flutter Android-first prototype for medicine routines, a home medicine cabinet, reminders, and family sharing. This repository is currently focused on the UI/UX and mock flows, based on the exported screen references in `docs/design/screens/`.

## Project status and scope

- Flutter UI with English and Nepali localizations, Riverpod state, and `go_router` navigation.
- The intended structure is MVVM: views → ViewModels → domain repository interfaces → mock data repositories.
- Data and interactions are demo-only. There is no Firebase, account service, real push notification, camera/OCR, or AI integration.
- Some screens and destinations are still placeholders. Follow `docs/build/PROGRESS.md`, `docs/build/OPEN_ITEMS.md`, and `docs/build/VISUAL_QA_REPORT.md` for implementation and QA status.
- The provided app logo and Noto font files are not in the repository yet. Splash uses the existing neutral logo fallback until the logo is supplied.
- No Android emulator is currently configured. Run on a connected Android device or configure an emulator locally for device-level visual QA.

## Requirements

- Flutter SDK 3.50.1 (or compatible Flutter with Dart 3.14.0; see `pubspec.yaml`).
- Android SDK/toolchain for Android builds, or a supported Flutter target such as Chrome for a local preview.
- Git to clone the repository.

## Run locally

From the repository root:

```sh
flutter pub get
flutter gen-l10n
flutter devices
flutter run -d <device-id>
```

For a local browser preview:

```sh
flutter run -d chrome
```

Use an Android device or emulator when checking Android layouts, system back behavior, and accessibility. The app starts at the Splash route; follow the in-app flow to Language, Onboarding, Permissions, and Sign in. Demo sign-in accepts valid email/password input (password must be at least 8 characters); Google sign-in is a mock shortcut.

## Verify changes

```sh
flutter analyze --no-pub
flutter test --no-pub
```

Localization source files are `lib/core/l10n/app_en.arb` and `lib/core/l10n/app_ne.arb`. After editing them, run `flutter gen-l10n`.

## Repository layout

```text
lib/
  app.dart                 App root, theme, localization, and router host
  core/                    Shared tokens, widgets, localization, routes, providers
  features/                Feature domains, mock data, ViewModels, and views
assets/
  images/                  Brand and mock image locations
  illustrations/           Illustration assets
  icons/                   Custom icon assets
  fonts/                   Bundled font location
docs/
  design/screens/          Copied, offline reference exports (not runtime assets)
  build/                   Screen briefs, decisions, open items, QA, and progress
test/                      Flutter widget and unit tests
```

## Navigation and demo flows

Routes are centralized in `lib/core/router/app_routes.dart` and configured in `lib/core/router/app_router.dart`. Views should navigate through the router (`context.go`/`AppRoutes`), not by pushing routes directly. Mock repositories are bound at the app composition root in `lib/main.dart` and `lib/core/di/providers.dart`.

The component gallery is a debug-only route at `/debug/components`. It is intended for local component inspection, not as a production screen.

## Assets and design references

- Screen PNGs under `docs/design/screens/` are design references only; do not load them as app screens or edit the source exports.
- Add the supplied logo under `assets/images/` when available. Do not substitute a cropped screenshot mark.
- Put future mock photos in `assets/images/mock/`, illustrations in `assets/illustrations/`, custom icons in `assets/icons/`, and licensed font files in `assets/fonts/`.
- Register new asset folders in `pubspec.yaml` and load assets through the shared asset helpers.

## Known limitations

- This is not a production-ready medication or health service. All sample medicines, users, reminders, and history are mock data.
- Several family, settings, privacy, and delete-account destinations remain incomplete; check the build tracker for the current list.
- Visual acceptance against the exported frames is pending mobile-size runtime captures. Passing widget tests and analysis do not certify pixel-level matching.
- Use only sample information in this prototype; no user data is persisted to a backend.
