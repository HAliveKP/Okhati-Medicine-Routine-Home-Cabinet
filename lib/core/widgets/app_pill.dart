import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// A compact rounded pill used for the profile switcher, language switch and
/// similar single-line actions.
class AppPill extends StatelessWidget {
  const AppPill({
    super.key,
    required this.label,
    this.onTap,
    this.trailingIcon,
    this.filled = true,
    this.foregroundColor,
  });

  final String label;
  final VoidCallback? onTap;
  final IconData? trailingIcon;

  /// `true` = primary-tinted; `false` = white with a hairline border.
  final bool filled;

  /// Defaults to primary for both variants.
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final Color background = filled ? AppColors.primaryTint : AppColors.surface;
    final Color foreground = foregroundColor ?? AppColors.primary;
    return Material(
      color: background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
        side: filled
            ? BorderSide.none
            : const BorderSide(color: AppColors.line),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.title.copyWith(
                  fontSize: 14,
                  height: 20 / 14,
                  color: foreground,
                ),
              ),
              if (trailingIcon != null) ...[
                const SizedBox(width: 6),
                Icon(trailingIcon, size: 16, color: foreground),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
