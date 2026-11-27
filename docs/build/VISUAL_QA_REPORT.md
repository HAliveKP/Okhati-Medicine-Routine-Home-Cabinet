# Visual QA Report

Visual acceptance requires a rendered app capture at the reference's 390 × 844 dp viewport. No Android emulator is configured, and the previous browser preview used a desktop viewport. The tables below distinguish static inspection and automated behavior checks from pixel-level acceptance.

## Today — `docs/design/screens/Today.png`

| Check | Export reference | Current implementation / evidence | Status |
|---|---|---|---|
| Frame | 780 × 1688 px, 390 × 844 dp at 2× | Unit/widget tests exercise the Today view, but no same-size runtime capture is available | Pending visual capture |
| Main content | 3 dose cards (08:00 Taken, 13:00 Due, 20:00 Upcoming), medicine summary (12 total; 8/2/1/1), weekly insight, 4 quick actions | Seeded Today state and tests cover these data and dose actions | Structure reviewed; pixels pending |
| Profile/language/notifications | Me dropdown, Nepali toggle, notification bell | Header renders controls; Me currently routes to a placeholder member page rather than switching profile | Functional gap |
| Typography/layout | Header and cards use larger display text; consistent insets and bottom navigation | TodayView is under 200 LOC; some inline layout values remain and `build` exceeds the 60-line cap | Needs tokenization/extraction |
| Accessibility | English/Nepali and 150% text | Existing Today test covers Nepali at 150%; no screenshot overflow comparison | Partial |

## Cabinet search empty — `docs/design/screens/Cabinet - No results.png`

| Check | Export reference | Current implementation / evidence | Status |
|---|---|---|---|
| Frame and regions | 780 × 1688 px / 390 × 844 dp; search header and field, 160 dp search illustration, title/body, two actions, Cabinet bottom tab | All regions are represented in `_SearchEmptyPage`; shared shell retains the bottom tab | Structure reviewed; pixels pending |
| Typography | Approx. 22 dp title and 16 dp body in export | Uses shared title/body styles that are currently smaller | Needs correction after runtime comparison |
| Search/actions | Query displayed, clear icon, Add medicine and Back to cabinet | Empty state activates for non-empty zero-result query; clear and back callbacks are wired; Add routes to placeholder | Partial; strength/form search not supported |
| Accessibility | 48 dp minimum targets and Nepali/150% | Buttons are 56 dp. Current tests do not exercise the empty state at Nepali/150% or its actions | Partial |
| View size | Reusable UI should be extracted | `cabinet_view.dart` remains over the 200-line cap | Needs decomposition |

## Component gallery

| Check | Evidence | Status |
|---|---|---|
| Golden size | `test/core/widgets/goldens/component_gallery.png`, 390 × 844 dp | Geometry regression artifact only; test font is Ahem |
| Browser preview | Captured at desktop-sized 1280 × 720 viewport | Not an acceptance comparison to mobile exports |

## Entry flow — `docs/design/screens/`

| Screen reference | Implementation evidence | Status |
|---|---|---|
| `Splash.png` | `SplashView` has a neutral `AppLogo` fallback and localized CTA | Not pixel-accepted; user logo pending; no same-size capture |
| `Language.png` | Localized English/Nepali choices and settings locale update | Not pixel-accepted; English copy currently differs from the export's Nepali heading/option name |
| `Onboarding 1.png`, `Onboarding 2.png`, `Onboarding 3.png` | One localized three-step carousel with per-step copy and indicators | Not pixel-accepted; body copy appears undersized; same-size capture pending |
| `Permissions.png` | Mock permission explanation; Continue/Not now route to sign in without platform permission calls | Not pixel-accepted; no same-size capture |
| `Sign in.png`, `Sign up.png` | Shared localized form with mock auth repository | Not pixel-accepted; auth form behavior and copy need review; no same-size capture |

Static reviewer follow-ups: onboarding/auth build methods exceed the 60-line limit; auth repository construction currently lives beside the ViewModel and instantiates the data mock; sign-in/password visibility tooltip is semantically wrong; entry/auth/router interaction tests are absent. The language picker text and Nepali onboarding title also need correction.

## Medicine entry — `docs/design/screens/`

| Screen reference | Implementation evidence | Status |
|---|---|---|
| `Add medicine.png` | Localized form, tag/reminder routes and mock data flow | Not pixel-accepted; same-size capture and screen-specific tests pending |
| `Condition tags.png` | Localized tag selection view and route return | Not pixel-accepted; same-size capture and screen-specific tests pending |
| `Scan.png` | UI-only mock scanner; no camera/OCR service | Not pixel-accepted; same-size capture and screen-specific tests pending |
| `Scan confirm.png` | Confirmation/edit form with mock scan values | Not pixel-accepted; same-size capture and screen-specific tests pending |
| `Schedule editor.png` | Localized days/times/alert-style editor | Not pixel-accepted; same-size capture and screen-specific tests pending |

Static reviewer follow-ups: Add and Condition tags open in states that differ from the exports; custom tags are not persisted into the option list; Scan flash is inert and scanner control sizes differ; Scan confirmation expiry warning is hardcoded; Schedule editor exceeds 200 LOC and its time-removal tooltip says “Add time”. Saving a medicine does not reliably refresh an already-mounted Cabinet, and Add close loses the originating route. These are code/behavior issues, not pixel acceptance results.

## Reminders and history — `docs/design/screens/`

| Screen reference | Implementation evidence | Status |
|---|---|---|
| `Alarm reminder.png` | Mock alarm composition and Taken/Snooze actions | Not pixel-accepted; no same-size capture or screen-specific test |
| `Lock-screen notification.png` | Mock lock-screen and notification card; no OS notification service | Not pixel-accepted; no same-size capture or screen-specific test |
| `Snooze.png` | Route-driven 5/10/15-minute choices | Not pixel-accepted; no same-size capture or screen-specific test |
| `History.png` | Mock history repository/ViewModel with date filters and export demo affordance | Not pixel-accepted; no same-size capture or screen-specific test |
| `Weekly insight.png` | Mock weekly summary/chart/suggestion | Not pixel-accepted; no same-size capture or screen-specific test |

Static reviewer follow-ups: History's 7/30-day filters currently return the same data, seeded History totals disagree with its rows and Weekly stats, and History highlights Today in the shell. Taking a dose does not update History. Weekly insight actions do not update/retain their target schedule. Alarm/lock Taken and snooze choices only navigate; they do not update mock dose/reminder state. Weekly insight is over 200 LOC; History and Alarm build methods exceed 60 lines. Nepali/150% tests are absent.

No screen in this report has passed pixel-level visual QA. Android screenshot QA is blocked until an AVD or device is available.
