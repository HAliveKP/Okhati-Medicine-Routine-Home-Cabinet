import 'package:material_ui/material_ui.dart';

import '../constants/sizes.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Search field with a 48dp clear target and caller-provided localized labels.
class AppSearchField extends StatelessWidget {
  const AppSearchField({
    super.key,
    required this.controller,
    required this.hint,
    required this.semanticLabel,
    required this.clearLabel,
    this.onChanged,
    this.onCleared,
  });

  final TextEditingController controller;
  final String hint;
  final String semanticLabel;
  final String clearLabel;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onCleared;

  @override
  Widget build(BuildContext context) => Semantics(
    label: semanticLabel,
    textField: true,
    child: TextField(
      controller: controller,
      onChanged: onChanged,
      style: AppTypography.body.copyWith(color: AppColors.textPrimary),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTypography.body,
        prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
        suffixIcon: controller.text.isEmpty
            ? null
            : IconButton(
                tooltip: clearLabel,
                onPressed: () {
                  controller.clear();
                  onCleared?.call();
                  onChanged?.call('');
                },
                icon: const Icon(Icons.close),
                constraints: const BoxConstraints(
                  minWidth: AppSizes.minTouch,
                  minHeight: AppSizes.minTouch,
                ),
              ),
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.controlRadius),
          borderSide: const BorderSide(color: AppColors.line),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.controlRadius),
          borderSide: const BorderSide(color: AppColors.line),
        ),
      ),
    ),
  );
}
