import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Small uppercase section label, e.g. "TODAY" or "MEDICINE CABINET".
class SectionLabel extends StatelessWidget {
  const SectionLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.meta.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.textSecondary,
      ),
    );
  }
}
