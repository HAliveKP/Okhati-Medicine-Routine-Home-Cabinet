import 'package:flutter/material.dart';

/// Design tokens from the Okhati master document (section 11).
class AppColors {
  const AppColors._();

  static const primary = Color(0xFF1F6F5C);
  static const primaryTint = Color(0xFFE6F2EE);
  static const background = Color(0xFFF7FAF9);
  static const surface = Colors.white;
  static const textPrimary = Color(0xFF1B1F1E);
  static const textSecondary = Color(0xFF5B6663);

  // Status colours: always pair with icon + label (never colour alone).
  static const good = Color(0xFF2E9E6B);
  static const due = Color(0xFFE0A21A);
  static const lowStock = Color(0xFFE8731A);
  static const expiring = Color(0xFFD64545);
  static const expired = Color(0xFF4A4F4E);
}
