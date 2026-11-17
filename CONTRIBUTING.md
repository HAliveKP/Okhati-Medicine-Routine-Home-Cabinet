# Contributing to Okhati

## Branching
- `main` - stable, demo-ready. Protected; merge by PR only.
- `develop` - integration branch.
- `feature/PBxx-short-name` - one branch per backlog item (e.g. `feature/PB14-local-notifications`).

## Commit style
`feat(reminder): schedule exact alarms (PB14)` / `fix(stock): undo restores quantity` / `docs: ...` / `test: ...`

## Rules
1. No direct pushes to `main`. Every PR needs one teammate review.
2. One backlog item per PR; no features outside the backlog.
3. No hard-coded UI strings - use ARB files (en + ne).
4. Never commit secrets (`google-services.json`, `firebase_options.dart`, API keys).
5. AI code must be understood by the author (you will defend it in the viva).

## Ownership
A: Auth/Firebase/Family - B: Medicine/Stock/Expiry - C: Reminders/History - D: UI/Scanner/AI/i18n
