import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';

/// Circular language switch in the top bar.
///
/// Figma draws a 40dp outlined circle with a translation glyph; the tap target
/// is kept at 48dp per the accessibility rule.
class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key, required this.onTap, required this.tooltip});

  final VoidCallback onTap;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      tooltip: tooltip,
      icon: const Icon(Icons.translate, size: 20),
      color: AppColors.textPrimary,
      style: IconButton.styleFrom(
        minimumSize: const Size(48, 48),
        backgroundColor: AppColors.surface,
        side: const BorderSide(color: AppColors.line),
      ),
    );
  }
}
