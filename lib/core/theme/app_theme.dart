import 'package:material_ui/material_ui.dart';

import '../constants/spacing.dart';
import '../constants/sizes.dart';
import './app_colors.dart';
import './app_typography.dart';

/// Theme definitions shared by the app shell and accessibility settings.
abstract class AppTheme {
  const AppTheme._();

  static final ThemeData light = _build(highContrast: false);
  static final ThemeData highContrast = _build(highContrast: true);

  static ThemeData _build({required bool highContrast}) {
    final Color primary = highContrast
        ? AppColors.textPrimary
        : AppColors.primary;
    final Color outline = highContrast ? AppColors.textPrimary : AppColors.line;
    const TextTheme textTheme = TextTheme(
      titleLarge: AppTypography.heading,
      headlineSmall: AppTypography.headingLarge,
      displayMedium: AppTypography.display,
      bodyLarge: AppTypography.body,
      bodyMedium: AppTypography.body,
      labelLarge: AppTypography.button,
      labelSmall: AppTypography.meta,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: primary,
        surface: AppColors.surface,
        onPrimary: AppColors.surface,
        onSurface: AppColors.textPrimary,
        error: AppColors.statusExpiring,
        outline: outline,
      ),
      scaffoldBackgroundColor: AppColors.background,
      textTheme: textTheme,
      cardTheme: CardThemeData(
        color: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.cardRadius),
          side: BorderSide(color: outline, width: highContrast ? 2 : 1),
        ),
        elevation: 0,
        margin: const EdgeInsets.all(AppSpacing.s),
      ),
      dividerColor: outline,
      focusColor: AppColors.primaryTint,
      visualDensity: VisualDensity.standard,
    );
  }
}

final ThemeData lightTheme = AppTheme.light;
final ThemeData highContrastTheme = AppTheme.highContrast;
