# Build Progress

## Phase status

| Phase | Status | Notes |
|---|---|---|
| 0 Verify, audit, plan | complete | Offline exports copied; 35 screens indexed and briefed, static code audit documented. Logo is pending; no AVD is configured. |
| 1 Foundation | complete | Existing sampled tokens/themes retained; typed asset references and semantic neutral-fallback widgets are in place. Analyzer clean; all 36 tests pass. |
| 2 Component library | built; visual review pending | Shared widgets and gallery are implemented. Browser preview was desktop-sized and does not qualify as mobile visual QA; golden uses Flutter's Ahem font. |
| 3 Screens | building | First wave implemented: Today and Cabinet search-empty state. Remaining frames are pending; builders work sequentially. |
| 4 Navigation/integration | todo | Infer routes from labels and screen names; document guesses. |
| 5 Final verification | todo | Analyze/test, emulator QA at normal/150%/Nepali, reviewer sweep. |
| 6 Hand-off | todo | No git operations.

## Frame progress

| ID | Screen reference | Status |
|---|---|---|
| offline:add-medicine | docs/design/screens/Add medicine.png | built; analysis/test suite pass; screen-specific tests and visual QA pending |
| offline:alarm-reminder | docs/design/screens/Alarm reminder.png | built as mock reminder; analysis/test suite pass; visual QA pending |
| offline:cabinet | docs/design/screens/Cabinet.png | built; analysis/test suite pass; list refresh and visual QA follow-ups pending |
| offline:cabinet-empty | docs/design/screens/Cabinet - No results.png | built; tests pass; visual QA pending |
| offline:condition-tags | docs/design/screens/Condition tags.png | built; analysis/test suite pass; screen-specific tests and visual QA pending |
| offline:delete-account | docs/design/screens/Delete account.png | todo |
| offline:family | docs/design/screens/Family.png | todo |
| offline:family-alerts | docs/design/screens/Family alerts.png | todo |
| offline:history | docs/design/screens/History.png | built with mock repository/ViewModel; analysis/test suite pass; visual QA pending |
| offline:invite | docs/design/screens/Invite.png | todo |
| offline:join-family | docs/design/screens/Join family.png | todo |
| offline:language | docs/design/screens/Language.png | built; test/analysis pass; visual QA pending |
| offline:lock-screen-notification | docs/design/screens/Lock-screen notification.png | built as mock notification; analysis/test suite pass; visual QA pending |
| offline:manage-members | docs/design/screens/Manage members.png | todo |
| offline:medicine-details | docs/design/screens/Medicine details.png | built; view decomposed; analysis/test suite pass; visual QA pending |
| offline:mediguide | docs/design/screens/MediGuide.png | todo |
| offline:member-view | docs/design/screens/Member view.png | todo |
| offline:more | docs/design/screens/More.png | todo |
| offline:notification-settings | docs/design/screens/Notification settings.png | todo |
| offline:onboarding-1 | docs/design/screens/Onboarding 1.png | built in localized 3-step flow; test/analysis pass; visual QA pending |
| offline:onboarding-2 | docs/design/screens/Onboarding 2.png | built in localized 3-step flow; test/analysis pass; visual QA pending |
| offline:onboarding-3 | docs/design/screens/Onboarding 3.png | built in localized 3-step flow; test/analysis pass; visual QA pending |
| offline:permissions | docs/design/screens/Permissions.png | built as mock permission explainer; test/analysis pass; visual QA pending |
| offline:privacy-data | docs/design/screens/Privacy and data.png | todo |
| offline:scan | docs/design/screens/Scan.png | built as mock-only scanner; analysis/test suite pass; screen-specific tests and visual QA pending |
| offline:scan-confirm | docs/design/screens/Scan confirm.png | built as mock confirmation; analysis/test suite pass; screen-specific tests and visual QA pending |
| offline:schedule-editor | docs/design/screens/Schedule editor.png | built; analysis/test suite pass; screen-specific tests and visual QA pending |
| offline:settings | docs/design/screens/Settings.png | todo |
| offline:sign-in | docs/design/screens/Sign in.png | built with mock authentication; test/analysis pass; visual QA pending |
| offline:sign-up | docs/design/screens/Sign up.png | built with mock authentication; test/analysis pass; visual QA pending |
| offline:snooze | docs/design/screens/Snooze.png | built as route-driven mock reminder; analysis/test suite pass; visual QA pending |
| offline:splash | docs/design/screens/Splash.png | built; user logo pending; visual QA pending |
| offline:today | docs/design/screens/Today.png | built; tests pass; visual QA pending |
| offline:today-nepali | docs/design/screens/Today (Nepali).png | todo |
| offline:weekly-insight | docs/design/screens/Weekly insight.png | built from mock weekly stats; analysis/test suite pass; visual QA pending |
| offline:section-assistant-settings-nepali | docs/design/screens/Assistant, settings and Nepali.png | built (flow note) |
| offline:section-entry-onboarding | docs/design/screens/Entry and onboarding.png | built (flow note) |
| offline:section-home-cabinet-add | docs/design/screens/Home, cabinet and add medicine.png | built (flow note) |
| offline:section-reminders-history-family | docs/design/screens/Reminders, history and family.png | built (flow note) |

## Wave plan

1. Entry and onboarding: Splash, Language, Onboarding 1–3, Permissions, Sign in, Sign up.
2. Home, cabinet and add: Today, Cabinet, empty search, Medicine details, Add medicine, Condition tags, Scan, Scan confirm, Schedule editor.
3. Reminders, history and family: Alarm reminder, Lock-screen notification, Snooze, History, Weekly insight, Family, Invite, Join family, Member view, Manage members, Family alerts.
4. Assistant, settings and Nepali: MediGuide, More, Settings, Notification settings, Privacy and data, Delete account, Today (Nepali).

## Completed

- Copied all 39 supported PNG references from Okhati_desgn into docs/design/screens; original files were not modified.
- Confirmed 35 portrait screenshots are 780 × 1688 px / 390 × 844 dp at 2×; cataloged 4 title strips as flow notes.
- Wrote one screen brief for each screen, plus frame index, asset manifest and decision/open-item logs.
- Static audit in AUDIT.md retains useful Today/Medicine foundations and identifies routing, layering, view-size, typography, and ViewModel fixes.
- Flutter 3.50.1/Dart 3.14.0 confirmed; `flutter doctor -v` passed Android tooling. `flutter analyze --no-pub --verbose` returned `No issues found!`.
- Baseline `flutter test` passed all 36 tests.
- Foundation gate: `flutter analyze --no-pub` reports no issues; `flutter test` passes all 36 existing tests after asset-widget changes.
- First screen-wave gate: `Today.png`, `Cabinet.png`, and `Cabinet - No results.png` structure and interactions are implemented; full suite passes 49 tests and analysis is clean. Pixel comparison is not accepted; see `VISUAL_QA_REPORT.md`.
- Entry wave implemented: Splash, Language, three-step Onboarding, Permissions, Sign in and Sign up use localized ARB copy and mock auth. `flutter analyze --no-pub` is clean; `flutter test --no-pub` passes 49 tests after updating the splash boot assertion. Per-screen interaction coverage is still limited.
- Medicine-entry wave implemented: Add medicine, Condition tags, mock Scan, Scan confirmation and Schedule editor routes/screens. Added English/Nepali strings and generated localizations. Latest analysis is clean and full suite passes 49 existing tests; screen-specific interaction tests remain outstanding.
- Compliance refactor gate: Cabinet, Medicine details, Today, Auth, Onboarding, and Schedule views delegate to composed widgets; auth mock creation is at app composition root. After formatting and mechanical lint fixes, `flutter analyze --no-pub` reports no issues and `flutter test --no-pub` passes all 49 tests. Read-only review is pending for hard method limits and layering.
- Reminder/history wave implemented: Alarm, Lock-screen notification, Snooze, History, Weekly insight are routed; English/Nepali strings generated. Full test suite passes 49 tests and analysis is clean after routes/localizations. These screens still lack screen-specific tests and mobile screenshot comparison.
- User stories US02 and US34 implemented from `Okhati.xlsx`: English/Nepali selection is available on first run and in More → Settings; adding a medicine now checks mock repository name/strength similarity and asks whether to continue. Static analysis passes; no new tests were run for these two stories.
- Read-only wave review found Today profile selection routes to a placeholder, Cabinet empty-state typography is likely too small, `cabinet_view.dart` exceeds the view-size limit, and empty-search Nepali/150% action coverage is missing.
