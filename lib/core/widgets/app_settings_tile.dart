import 'package:material_ui/material_ui.dart';

import '../constants/spacing.dart';
import '../constants/sizes.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Navigation row for settings and secondary actions.
class AppSettingsTile extends StatelessWidget {
  const AppSettingsTile({
    super.key,
    required this.title,
    required this.semanticLabel,
    required this.icon,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.destructive = false,
  });

  final String title;
  final String semanticLabel;
  final IconData icon;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool destructive;

  @override
  Widget build(BuildContext context) {
    final Color foreground = destructive
        ? AppColors.statusExpiring
        : AppColors.textPrimary;
    return Material(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
        side: BorderSide(
          color: destructive ? AppColors.statusExpiring : AppColors.line,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
        child: Semantics(
          button: onTap != null,
          label: semanticLabel,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: AppSizes.minTouch),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.m),
              child: Row(
                children: [
                  Icon(icon, color: foreground),
                  const SizedBox(width: AppSpacing.m),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: AppTypography.title.copyWith(
                            color: foreground,
                          ),
                        ),
                        if (subtitle != null)
                          Text(subtitle!, style: AppTypography.body),
                      ],
                    ),
                  ),
                  trailing ??
                      const Icon(
                        Icons.chevron_right,
                        color: AppColors.textSecondary,
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
