import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/section_label.dart';
import '../../../../core/widgets/stat_tile.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../medicine/domain/models/medicine_stats.dart';

/// Cabinet summary card on Today: total + four status counts.
class CabinetSummaryCard extends StatelessWidget {
  const CabinetSummaryCard({super.key, required this.stats, this.onTap});

  final MedicineStats stats;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return Material(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.line),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: SectionLabel(l10n.todayCabinetLabel)),
                  Text(
                    l10n.todayCabinetCount(stats.total),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.title.copyWith(
                      fontSize: 14,
                      height: 20 / 14,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: StatTile(
                      count: stats.good,
                      label: l10n.statusGood,
                      color: AppColors.statusGood,
                      onTap: onTap,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: StatTile(
                      count: stats.lowStock,
                      label: l10n.statusLowStock,
                      color: AppColors.statusLowStock,
                      onTap: onTap,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: StatTile(
                      count: stats.expiring,
                      label: l10n.statusExpiring,
                      color: AppColors.statusExpiring,
                      onTap: onTap,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: StatTile(
                      count: stats.expired,
                      label: l10n.statusExpired,
                      color: AppColors.statusExpired,
                      onTap: onTap,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
