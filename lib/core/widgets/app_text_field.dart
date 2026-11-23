import 'package:material_ui/material_ui.dart';

import '../constants/sizes.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Shared labelled input matching the Figma form fields.
///
/// 56dp tall, 16dp radius, white surface, 1px line border, 22dp leading icon,
/// 16/400 text. Shows a 12dp error line below when [error] is set.
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
    this.icon,
    this.onChanged,
    this.keyboardType,
    this.readOnly = false,
    this.onTap,
    this.error,
    this.trailing,
    this.maxLines = 1,
    this.autofocus = false,
  });

  final String label;
  final TextEditingController controller;
  final String? hint;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? error;
  final Widget? trailing;
  final int maxLines;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTypography.body.copyWith(
            fontSize: 14,
            height: 20 / 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          height: maxLines == 1 ? AppSizes.inputHeight : null,
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            keyboardType: keyboardType,
            readOnly: readOnly,
            onTap: onTap,
            autofocus: autofocus,
            maxLines: maxLines,
            style: AppTypography.body.copyWith(
              fontSize: 16,
              height: 22 / 16,
              color: AppColors.textPrimary,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTypography.body.copyWith(fontSize: 16),
              filled: true,
              fillColor: AppColors.surface,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: maxLines == 1 ? 0 : 14,
              ),
              prefixIcon: icon == null
                  ? null
                  : Icon(icon, size: 22, color: AppColors.textSecondary),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 46,
                minHeight: 22,
              ),
              suffixIcon: trailing,
              suffixIconConstraints: const BoxConstraints(
                minWidth: 46,
                minHeight: 22,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                borderSide: const BorderSide(color: AppColors.line),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                borderSide: BorderSide(
                  color: error == null
                      ? AppColors.line
                      : AppColors.statusExpiring,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                borderSide: BorderSide(
                  color: error == null
                      ? AppColors.primary
                      : AppColors.statusExpiring,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
        if (error != null) ...[
          const SizedBox(height: 4),
          Text(
            error!,
            style: AppTypography.meta.copyWith(
              color: AppColors.statusExpiring,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ],
    );
  }
}
