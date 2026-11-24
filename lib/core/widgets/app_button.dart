import 'package:material_ui/material_ui.dart';

import '../constants/sizes.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Button variants from the exported design (56dp tall, 16dp radius).
enum AppButtonVariant { primary, secondary, danger, outline }

/// Shared Okhati button.
///
/// Export: height 56, radius 16, horizontal padding 24, label 16/600.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.icon,
    this.fullWidth = true,
  });

  final String text;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final IconData? icon;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final bool enabled = onPressed != null;
    final (
      Color background,
      Color foreground,
      BorderSide border,
    ) = switch (variant) {
      AppButtonVariant.primary => (
        AppColors.primary,
        AppColors.surface,
        BorderSide.none,
      ),
      AppButtonVariant.secondary => (
        AppColors.primaryTint,
        AppColors.primary,
        BorderSide.none,
      ),
      AppButtonVariant.danger => (
        AppColors.statusExpiring,
        AppColors.surface,
        BorderSide.none,
      ),
      AppButtonVariant.outline => (
        Colors.transparent,
        AppColors.primary,
        const BorderSide(color: AppColors.primary, width: 1.5),
      ),
    };

    final Widget label = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 20, color: foreground),
          const SizedBox(width: 8),
        ],
        Flexible(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTypography.button.copyWith(color: foreground),
          ),
        ),
      ],
    );

    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: Material(
        color: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
          side: border,
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
          child: Container(
            height: AppSizes.buttonHeight,
            width: fullWidth ? double.infinity : null,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.center,
            child: label,
          ),
        ),
      ),
    );
  }
}
