import 'package:material_ui/material_ui.dart';

import '../theme/app_typography.dart';

/// A single cabinet status statistic (number + label) tinted with the status
/// colour. Used on Today and Cabinet.
class StatTile extends StatelessWidget {
  const StatTile({
    super.key,
    required this.count,
    required this.label,
    required this.color,
    this.onTap,
  });

  final int count;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$count',
                style: AppTypography.title.copyWith(
                  fontSize: 22,
                  height: 31 / 22,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppTypography.meta.copyWith(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
