import 'package:material_ui/material_ui.dart';
import './app_colors.dart';

/// Typography tokens measured from the 390 dp offline screen exports.
///
/// Body >= 16px, headings 22-28px bold. Never use fixed-height containers
/// around text; let these styles scale with the system text size.
class AppTypography {
  const AppTypography._();

  static const double bodySize = 16.0;
  static const double headingSize = 22.0;
  static const double headingLargeSize = 28.0;
  static const double displaySize = 32.0;

  /// 16 / SemiBold / 22 — card titles, button labels.
  static const TextStyle title = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 22 / 16,
    color: AppColors.textPrimary,
  );

  /// 22 / Bold / 28 — screen titles.
  static const TextStyle heading = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 28 / 22,
    color: AppColors.textPrimary,
  );

  /// 28 / Bold / 34 — prominent totals and onboarding headlines.
  static const TextStyle headingLarge = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 34 / 28,
    color: AppColors.textPrimary,
  );

  /// 32 / Bold / 38 — large timer and splash text.
  static const TextStyle display = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 38 / 32,
    color: AppColors.textPrimary,
  );

  /// 14 / Regular / 20 — card subtitles.
  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
    color: AppColors.textSecondary,
  );

  /// 12 / Medium / 17 — metadata.
  static const TextStyle meta = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 17 / 12,
    color: AppColors.textSecondary,
  );

  /// 12 / SemiBold / 17 — status chips.
  static const TextStyle chip = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 17 / 12,
  );

  /// 12 / Medium / 17 — inactive bottom-nav labels.
  static const TextStyle navLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 17 / 12,
    color: AppColors.textSecondary,
  );

  /// 12 / SemiBold / 17 — active bottom-nav labels.
  static const TextStyle navLabelActive = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 17 / 12,
    color: AppColors.primary,
  );

  /// 16 / SemiBold / 22 — primary buttons.
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 22 / 16,
  );

  static TextTheme of(BuildContext context) {
    final TextTheme base = Theme.of(context).textTheme;
    return base.copyWith(
      bodyLarge: base.bodyLarge?.copyWith(fontSize: bodySize),
      titleLarge: base.titleLarge?.copyWith(
        fontSize: headingSize,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: base.displayMedium?.copyWith(
        fontSize: headingLargeSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
