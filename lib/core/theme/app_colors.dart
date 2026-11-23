import 'package:material_ui/material_ui.dart';

/// Raw Okhati design tokens (colors only).
///
/// Hex is allowed here and nowhere else. Widgets must read colors through
/// [Theme.of] / [AppColors], never via literal hex.
class AppColors {
  const AppColors._();

  /// Brand
  static const Color primary = Color(0xFF1F6F5C);
  static const Color primaryTint = Color(0xFFE6F2EE);
  static const Color accent = Color(0xFF2E9E6B);

  /// Surfaces
  static const Color background = Color(0xFFF7FAF9);
  static const Color surface = Color(0xFFFFFFFF);

  /// Text
  static const Color textPrimary = Color(0xFF1B1F1E);
  static const Color textSecondary = Color(0xFF5B6663);
  static const Color textTertiary = Color(0xFF4A4F4E);

  /// Lines
  static const Color line = Color(0xFFE3EAE7);
  static const Color insightSurface = Color(0xFFF3EEDA);

  /// Status
  static const Color statusGood = Color(0xFF2E9E6B);
  static const Color statusDue = Color(0xFFE0A21A);
  static const Color statusLowStock = Color(0xFFE8731A);
  static const Color statusExpiring = Color(0xFFD64545);
  static const Color statusExpired = Color(0xFF4A4F4E);
  static const Color statusGoodBackground = Color(0xFFE2F1EA);
  static const Color statusDueBackground = Color(0xFFFBF2DF);
  static const Color statusLowStockBackground = Color(0xFFFCEEE3);
  static const Color statusExpiringBackground = Color(0xFFFAE8E8);
  static const Color statusExpiredBackground = Color(0xFFE9E9E9);
  static const Color shadow = Color(0x141B1F1E);
}
