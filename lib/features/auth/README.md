# auth

**Purpose:** Sign in and sign up screens.
**Contains:** domain/ (immutable models + abstract repositories), data/ (mock repositories), presentation/ (views, viewmodels, feature-only widgets).
**Never contains:** Another feature's presentation/ or data/; shared widgets (move to core/widgets).
**Entry points:** presentation/views/sign_in_view.dart
