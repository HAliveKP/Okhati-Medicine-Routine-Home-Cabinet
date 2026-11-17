# Okhati (ओखती)

Smart medicine routine + home medicine cabinet. Flutter (Android first) + Firebase. English + Nepali.

- **Routine:** today's doses, reminders, taken/missed/skipped, history
- **Cabinet:** quantity, low stock, expiry, photo, condition tag
- **Unified status:** Good / Due / Low stock / Expiring / Expired
- **AI (assistive only, never medical advice):** scanner parsing, MediGuide help chatbot, smart reminders, adherence insights

See `docs/` and the Master Document for scope, backlog and sprint plan.

## First-time setup
```bash
# 1. Generate the platform folders (android/ etc.) inside this repo
flutter create . --org com.okhati --project-name okhati --platforms android

# 2. Install deps and generate localisations
flutter pub get
flutter gen-l10n

# 3. Run
flutter run
```

### Firebase (Member A)
```bash
dart pub global activate flutterfire_cli
flutterfire configure          # creates lib/firebase_options.dart (git-ignored)
cd firebase && firebase emulators:start
```
Then uncomment `Firebase.initializeApp(...)` in `lib/main.dart`.

## Structure
```
lib/
  core/        theme, constants, utils, shared widgets, router
  features/    auth, dashboard, medicine, reminder, stock, expiry,
               history, scanner, family, ai, settings
               (each: data / domain / presentation)
  l10n/        app_en.arb, app_ne.arb
firebase/      firestore.rules, functions/ (aiProxy, jobs, invites)
test/          unit + widget tests
```

## Team workflow
Read `CONTRIBUTING.md`. Branch per backlog item, PR + review, CI must pass.
