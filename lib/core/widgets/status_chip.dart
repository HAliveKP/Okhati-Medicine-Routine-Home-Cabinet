import 'package:material_ui/material_ui.dart';

import '../constants/sizes.dart';
import '../theme/app_typography.dart';

/// Generic status chip with redundant icon, text, and color cues.
///
/// Feature code is responsible for mapping domain states to these presentation
/// values so this shared widget stays independent of feature models.
class StatusChip extends StatelessWidget {
  const StatusChip({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.backgroundColor,
  });

  final IconData icon;
  final String label;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) => ConstrainedBox(
    constraints: const BoxConstraints(minHeight: AppSizes.statusChipHeight),
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.statusChipHorizontalPadding,
        vertical: AppSizes.statusChipVerticalPadding,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.chipRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: AppSizes.statusChipIcon, color: color),
          const SizedBox(width: AppSizes.statusChipGap),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.chip.copyWith(color: color),
          ),
        ],
      ),
    ),
  );
}
