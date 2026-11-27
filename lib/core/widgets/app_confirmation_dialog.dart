import 'package:material_ui/material_ui.dart';

import '../constants/spacing.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import 'app_button.dart';

/// Reusable confirmation dialog for destructive and routine decisions.
abstract final class AppConfirmationDialog {
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String body,
    required String confirmLabel,
    required String cancelLabel,
    bool destructive = false,
  }) => showDialog<bool>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: AppColors.surface,
      title: Text(title, style: AppTypography.heading),
      content: SingleChildScrollView(child: Text(body)),
      actionsPadding: const EdgeInsets.all(AppSpacing.m),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(cancelLabel),
        ),
        AppButton(
          text: confirmLabel,
          fullWidth: false,
          variant: destructive
              ? AppButtonVariant.danger
              : AppButtonVariant.primary,
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    ),
  );
}
