import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class MedicineEntryField extends StatelessWidget {
  const MedicineEntryField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.icon,
    this.keyboardType,
    this.onTap,
    this.error = false,
    this.errorText,
  });

  final String label;
  final String value;
  final ValueChanged<String> onChanged;
  final IconData? icon;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final bool error;
  final String? errorText;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: AppTypography.body),
      const SizedBox(height: AppSpacing.s),
      SizedBox(
        height: AppSizes.inputHeight,
        child: TextFormField(
          initialValue: value,
          onChanged: onChanged,
          onTap: onTap,
          readOnly: onTap != null,
          keyboardType: keyboardType,
          style: AppTypography.body.copyWith(color: AppColors.textPrimary),
          decoration: InputDecoration(
            prefixIcon: icon == null ? null : Icon(icon),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.controlRadius),
              borderSide: const BorderSide(color: AppColors.statusExpiring),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.controlRadius),
              borderSide: BorderSide(
                color: error ? AppColors.statusExpiring : AppColors.line,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.controlRadius),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            filled: true,
            fillColor: AppColors.surface,
          ),
        ),
      ),
      if (error && errorText != null) ...[
        const SizedBox(height: AppSpacing.xs),
        Text(
          errorText!,
          style: AppTypography.body.copyWith(color: AppColors.statusExpiring),
        ),
      ],
    ],
  );
}

class MedicineEntryTile extends StatelessWidget {
  const MedicineEntryTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Material(
    color: AppColors.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.cardRadius),
      side: const BorderSide(color: AppColors.line),
    ),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.cardRadius),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.l),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary),
            const SizedBox(width: AppSpacing.l),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTypography.title),
                  Text(subtitle, style: AppTypography.body),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.textSecondary),
          ],
        ),
      ),
    ),
  );
}
