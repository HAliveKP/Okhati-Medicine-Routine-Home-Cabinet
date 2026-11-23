# Open Items

## Inputs and references

- User-supplied logo at `assets/images/logo.*` is missing. User asked us to wait for it; do not produce or crop a substitute. The neutral fallback can keep non-logo screens buildable.
- `docs/design/DESIGN_NOTES.md`, root `AGENTS.md`, `docs/MASTER_PROMPT.md`, and `docs/Okhati_Master_Document.md` are absent. `okhati-codex-kit/okhati-codex-kit/AGENTS.md` is the available Codex rules file.
- The listed custom agent configs and the four named custom skills are absent from `.codex/agents/` and `.agents/skills/`; their expected workflows are followed from the supplied prompt.
- Export images have no prototype links. The screen-name/label route map is provisional; confirm ambiguous links in the navigation review.
- Noto Sans and Noto Sans Devanagari files are absent under `assets/fonts/`. Confirm availability/download source before font-bundling; Android system fallback is not considered a verified font asset.
- The four short section title strips have unknown scale; they are documentation aids and will not be rendered as screens.

## Build and QA

- `flutter emulators` reports no configured AVD. A request to create a local Pixel 4a AVD from the installed API 37 image was rejected at the permission gate; emulator visual QA remains blocked.
- First screen-wave verification: `flutter test --no-pub` passes all 49 tests; `flutter analyze --no-pub` reports no issues after fixing one constructor lint. The first run caught and fixed a stale Cabinet color token.
- Component gallery golden is generated at 390 × 844 dp, but Flutter test rendering uses the Ahem test font; treat it as a geometry/regression artifact, not text-level visual proof.
- No screen has passed visual QA yet. The screenshot references are in `docs/design/screens/`, with one brief per screen in `docs/build/briefs/`.
- Until the logo arrives, Splash and logo placements in onboarding/sign-in remain pending exact visual QA.
- Static entry-flow review (without a runtime screenshot) found the English language picker copy differs from the export, onboarding body text likely undersized, a Nepali title typo, auth ViewModel/data composition coupling, and no auth/onboarding/router interaction tests. Details are in `VISUAL_QA_REPORT.md`.
- Static medicine-flow review found export-state differences, an inert scan-flash action, a hardcoded scan-confidence state, Schedule editor over the view-size limit, and Cabinet refresh/origin-route issues after saving. Details are in `VISUAL_QA_REPORT.md`; these require code follow-up before integration is complete.
- Static reminder/history review found nonfunctional date filters, inconsistent mock totals, stale history after dose actions, incorrect History tab selection, reminder CTAs that only navigate, and Weekly insight over 200 LOC. These remain integration follow-ups; see `VISUAL_QA_REPORT.md`.
- Verify text at 150% and Nepali; supplied screenshots cover Today Nepali, but not a large-text/high-contrast exported variant.
