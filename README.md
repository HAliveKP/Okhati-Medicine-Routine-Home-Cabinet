# Okhati (ओखती)

Smart medicine routine and home medicine manager. Okhati shows what to take today, what is left in the cabinet, and what needs attention (low stock, expiring, expired) on one simple dashboard.

> Status: early setup. Scope and decisions live in `Okhati_Master_Document.docx`.

## Core Features

- **Routine:** today's doses, reminders, taken / missed / skipped, history
- **Cabinet:** quantity, low-stock alert, expiry, photo, condition tag, search and filter
- **Family sharing:** groups, invites, roles (owner / editor / viewer)
- **Scanner:** barcode and OCR to draft a medicine entry (user confirms before saving)
- **AI assistance:** MediGuide chatbot (app help only), smart reminders, weekly insights
- **Languages:** English and Nepali

The app never gives medical advice (no diagnosis, dosage or interaction guidance).

## Tech Stack

- Flutter (Android first), Riverpod, Material 3
- Firebase: Auth, Firestore, Storage, FCM, Cloud Functions
- `flutter_local_notifications`, `mobile_scanner`, `google_mlkit_text_recognition`
- Localisation via ARB files (en, ne)

## Initial Project Structure

```
okhati/
├── README.md
├── docs/
│   └── Okhati_Master_Document.docx
├── lib/
│   ├── main.dart
│   ├── core/                 # theme, routing, l10n, utils
│   ├── l10n/                 # app_en.arb, app_ne.arb
│   └── features/
│       ├── auth/
│       ├── dashboard/
│       ├── medicine/         # cabinet, stock, expiry
│       ├── reminder/         # schedules, notifications
│       ├── history/
│       ├── scanner/
│       ├── family/
│       ├── assistant/        # MediGuide, insights
│       └── settings/
│           └── {data, domain, presentation}
├── functions/                # Cloud Functions (aiProxy, jobs, invites)
├── test/
├── firestore.rules
└── pubspec.yaml
```

Each feature follows `data / domain / presentation`.

## Getting Started

```bash
git clone <repo-url>
cd okhati
flutter pub get
flutter run
```

Firebase setup (`flutterfire configure`) is required before the first run.

## Team

4 members, 9 sprints. See the master document for roles and the sprint plan.
