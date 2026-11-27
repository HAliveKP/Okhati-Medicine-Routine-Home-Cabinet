# schedule

**Purpose:** Schedule editor, full-screen alarm reminder, lock-screen preview and snooze sheet.
**Contains:** domain/ (immutable models + abstract repositories), data/ (mock repositories), presentation/ (views, viewmodels, feature-only widgets).
**Never contains:** Another feature's presentation/ or data/; shared widgets (move to core/widgets).
**Entry points:** presentation/views/schedule_editor_view.dart
