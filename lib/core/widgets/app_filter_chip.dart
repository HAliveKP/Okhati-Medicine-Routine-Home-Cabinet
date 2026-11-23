import 'package:material_ui/material_ui.dart';

import '../constants/sizes.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Selectable pill filter with a minimum 48dp target.
class AppFilterChip extends StatelessWidget {
  const AppFilterChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final bool selected;
  final ValueChanged<bool> onSelected;

  @override
  Widget build(BuildContext context) {
    final Color foreground = selected
        ? AppColors.surface
        : AppColors.textPrimary;
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: AppSizes.minTouch),
      child: Material(
        color: selected ? AppColors.primary : AppColors.surface,
        shape: StadiumBorder(
          side: BorderSide(
            color: selected ? AppColors.primary : AppColors.line,
          ),
        ),
        child: InkWell(
          onTap: () => onSelected(!selected),
          customBorder: const StadiumBorder(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.filterChipInset,
            ),
            child: Center(
              widthFactor: 1,
              child: Text(
                label,
                style: AppTypography.title.copyWith(
                  color: foreground,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
