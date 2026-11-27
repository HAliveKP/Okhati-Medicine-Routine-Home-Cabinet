import 'package:material_ui/material_ui.dart';

import '../constants/spacing.dart';
import '../constants/sizes.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Accessible switch row with caller-provided localized title and description.
class AppToggle extends StatelessWidget {
  const AppToggle({
    super.key,
    required this.title,
    required this.semanticLabel,
    required this.value,
    required this.onChanged,
    this.subtitle,
    this.icon,
  });

  final String title;
  final String semanticLabel;
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? subtitle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) => Semantics(
    label: semanticLabel,
    toggled: value,
    onTap: () => onChanged(!value),
    child: ExcludeSemantics(
      child: Material(
        color: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.cardRadius),
          side: const BorderSide(color: AppColors.line),
        ),
        child: InkWell(
          onTap: () => onChanged(!value),
          borderRadius: BorderRadius.circular(AppSizes.cardRadius),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: AppSizes.minTouch),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.m,
                vertical: AppSpacing.s,
              ),
              child: Row(
                children: [
                  if (icon != null) ...[
                    Icon(icon, color: AppColors.primary),
                    const SizedBox(width: AppSpacing.m),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(title, style: AppTypography.title),
                        if (subtitle != null)
                          Text(subtitle!, style: AppTypography.body),
                      ],
                    ),
                  ),
                  Switch(value: value, onChanged: onChanged),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
