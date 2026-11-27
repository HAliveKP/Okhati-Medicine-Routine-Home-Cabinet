# medicine

**Purpose:** Cabinet, medicine details, add/edit medicine, condition tags, scan and scan confirm.
**Contains:** domain/ (immutable models + abstract repositories), data/ (mock repositories), presentation/ (views, viewmodels, feature-only widgets).
**Never contains:** Another feature's presentation/ or data/; shared widgets (move to core/widgets).
**Entry points:** presentation/views/cabinet_view.dart
