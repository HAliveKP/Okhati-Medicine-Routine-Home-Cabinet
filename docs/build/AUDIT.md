# Existing Code Audit

Audit scope: `lib/` and `test/` were reviewed against the available Codex MVVM rules and the supplied offline-export task. The review was static; no source files were changed.

## Keep

- Today and Medicine/Cabinet domain models, abstract repositories, seeded mock repositories, Riverpod ViewModels, and focused tests as a starting point.
- ARB scaffolding, existing theme tokens, shared widgets and tests. Preserve useful behavior while rebuilding feature screens.
- Existing tests; update and extend them for each implemented flow.

## Fix or rewrite

- `lib/core/router/app_router.dart` and `app_routes.dart`: 27 routes are placeholders with hardcoded English copy; route declarations do not use `name:`. Replace with actual screens, named routes, localized labels, and a state-preserving tab shell.
- `lib/features/medicine/presentation/views/medicine_details_view.dart` (431 LOC) and `cabinet_view.dart` (578 LOC after the empty-search implementation) exceed the 200-line view limit; split into composed widgets. `today_view.dart` is 144 LOC, but its `build` method exceeds the 60-line limit.
- `lib/core/widgets/dose_tile.dart` contains a raw private `TextStyle`; move styling to typography tokens.
- `medicine_card.dart`, `dose_tile.dart`, `status_chip.dart`, and `core/theme/status_style.dart` import feature-domain models into `core/`. Move shared contracts to an allowed shared domain or compose feature-specific UI outside `core/`.
- `core/router/app_router.dart` imports feature presentation; keep dependency wiring at the app boundary and use the router only for routes/shells.
- `core/di/providers.dart` imports feature data/domain. Revisit composition so `core/` does not depend on features.
- `Medicine.isExpired` reads `DateTime.now()` instead of an injected clock; collection fields are not deeply immutable; nullable `copyWith` fields cannot be explicitly cleared.
- Today `markTaken` has no failure handling across multiple repository mutations/reload.
- Existing tests now pass 49 cases, including shared component gallery, Today, Cabinet, and medicine details. Router and integration-flow coverage remains missing; Cabinet search-empty actions at Nepali/150% remain untested.

## Delete

- None identified. Replace placeholders as real screens are implemented, then remove obsolete files after references/tests are updated.

## Checks and limitations

- Static inspection found no direct asset loading in feature views and no `Navigator.push`; raw hex is confined to `app_colors.dart`. The shared `AppImage` wrapper is the sole `Image.asset` call.
- Real Today/Medicine views mostly localize copy; placeholder routes violate ARB-only view copy.
- Offline exports are available in `docs/design/screens/`; visual QA has not been accepted. `docs/build/VISUAL_QA_REPORT.md` contains exact-frame static comparisons and pending criteria. The user asked to wait for the missing `assets/images/logo.*` file.
- Flutter 3.50.1/Dart 3.14.0 and Android toolchain pass `flutter doctor -v`; no emulator is configured. The latest `flutter analyze --no-pub` reports no issues and `flutter test --no-pub` passes all 49 tests.
- Root `AGENTS.md`, `docs/MASTER_PROMPT.md`, and `docs/Okhati_Master_Document.md` are absent. The available rules file is `okhati-codex-kit/okhati-codex-kit/AGENTS.md`.
