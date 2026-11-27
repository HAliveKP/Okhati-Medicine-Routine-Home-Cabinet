import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/spacing.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.onChanged,
    this.obscure = false,
    this.keyboardType,
    this.trailing,
  });

  final String label;
  final String hint;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool obscure;
  final TextInputType? keyboardType;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: AppTypography.body),
      const SizedBox(height: AppSpacing.s),
      TextField(
        onChanged: onChanged,
        obscureText: obscure,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon),
          suffixIcon: trailing,
          filled: true,
          fillColor: AppColors.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.entryCardRadius),
            borderSide: const BorderSide(color: AppColors.line),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.entryCardRadius),
            borderSide: const BorderSide(color: AppColors.line),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.entryCardRadius),
            borderSide: const BorderSide(
              color: AppColors.primary,
              width: AppSizes.selectedBorderWidth,
            ),
          ),
        ),
      ),
    ],
  );
}
