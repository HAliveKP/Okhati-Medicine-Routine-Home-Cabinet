# family

**Purpose:** Family home, invite, join, member view, manage members and family alerts.
**Contains:** domain/ (immutable models + abstract repositories), data/ (mock repositories), presentation/ (views, viewmodels, feature-only widgets).
**Never contains:** Another feature's presentation/ or data/; shared widgets (move to core/widgets).
**Entry points:** presentation/views/family_view.dart
