class AppConstants {
  const AppConstants._();

  /// Expiry warning window (days). User-configurable later.
  static const expiryWarningDays = 30;

  /// Grace period before a dose is flagged Missed (minutes).
  static const missedGraceMinutes = 60;

  /// Minimum touch targets (dp).
  static const minTouchTarget = 48.0;
  static const takenButtonHeight = 56.0;
}
