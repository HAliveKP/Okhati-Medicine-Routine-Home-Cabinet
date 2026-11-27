import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/spacing.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/status_chip.dart';
import '../../domain/models/history_entry.dart';

class HistoryEntryTile extends StatelessWidget {
  const HistoryEntryTile({super.key, required this.entry, required this.l10n});

  final HistoryEntry entry;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final (String label, IconData icon, Color color, Color fill) = _status();
    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.l),
      child: Row(
        children: [
          Text(
            entry.time,
            style: AppTypography.title.copyWith(color: AppColors.primary),
          ),
          const SizedBox(width: AppSpacing.l),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(entry.medicine, style: AppTypography.title),
                Text(entry.strength, style: AppTypography.body),
              ],
            ),
          ),
          StatusChip(
            icon: icon,
            label: label,
            color: color,
            backgroundColor: fill,
          ),
        ],
      ),
    );
  }

  (String, IconData, Color, Color) _status() => switch (entry.status) {
    HistoryStatus.taken => (
      l10n.historyStatusTaken,
      Icons.check,
      AppColors.statusGood,
      AppColors.statusGoodBackground,
    ),
    HistoryStatus.due => (
      l10n.historyStatusDue,
      Icons.schedule,
      AppColors.statusDue,
      AppColors.statusDueBackground,
    ),
    HistoryStatus.missed => (
      l10n.historyStatusMissed,
      Icons.warning_amber_rounded,
      AppColors.statusExpiring,
      AppColors.statusExpiringBackground,
    ),
    HistoryStatus.skipped => (
      l10n.historyStatusSkipped,
      Icons.remove_circle_outline,
      AppColors.statusExpired,
      AppColors.statusExpiredBackground,
    ),
  };
}
