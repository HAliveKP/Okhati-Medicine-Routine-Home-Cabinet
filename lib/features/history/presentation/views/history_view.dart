import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/spacing.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_filter_chip.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../domain/models/history_entry.dart';
import '../viewmodels/history_view_model.dart';
import '../widgets/history_entry_tile.dart';

class HistoryView extends ConsumerWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HistoryState state = ref.watch(historyViewModelProvider);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final HistoryViewModel model = ref.read(historyViewModelProvider.notifier);
    return ColoredBox(
      color: AppColors.background,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.pageInset,
              ),
              child: AppTopBar(
                title: l10n.historyTitle,
                backLabel: l10n.commonBack,
                onBack: () => context.go(AppRoutes.today),
                actions: [
                  IconButton(
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.historyExportDemo)),
                    ),
                    tooltip: l10n.historyDownload,
                    icon: const Icon(Icons.download_outlined),
                  ),
                ],
              ),
            ),
            Expanded(
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView(
                      padding: const EdgeInsets.fromLTRB(
                        AppSpacing.pageInset,
                        AppSpacing.m,
                        AppSpacing.pageInset,
                        AppSpacing.l,
                      ),
                      children: [
                        _WeeklySummary(l10n: l10n, stats: state.weeklyStats!),
                        const SizedBox(height: AppSpacing.l),
                        _HistoryFilters(state: state, model: model, l10n: l10n),
                        const SizedBox(height: AppSpacing.l),
                        _HistoryGroup(
                          title: l10n.historyToday,
                          entries: state.visibleEntries
                              .where((entry) => !entry.isYesterday)
                              .toList(growable: false),
                          l10n: l10n,
                        ),
                        const SizedBox(height: AppSpacing.l),
                        _HistoryGroup(
                          title: l10n.historyYesterday,
                          entries: state.visibleEntries
                              .where((entry) => entry.isYesterday)
                              .toList(growable: false),
                          l10n: l10n,
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeeklySummary extends StatelessWidget {
  const _WeeklySummary({required this.l10n, required this.stats});
  final AppLocalizations l10n;
  final WeeklyStats stats;

  @override
  Widget build(BuildContext context) => AppCard(
    color: AppColors.primaryTint,
    borderColor: AppColors.primaryTint,
    padding: const EdgeInsets.all(AppSpacing.l),
    child: Row(
      children: [
        Text(
          '${stats.takenPercent}%',
          style: AppTypography.headingLarge.copyWith(color: AppColors.primary),
        ),
        const SizedBox(width: AppSpacing.l),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.historyTakenThisWeek, style: AppTypography.title),
              Text(
                '${l10n.historyTakenCount} · ${l10n.historyMissedCount} · ${l10n.historySkippedCount}',
                style: AppTypography.body,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _HistoryFilters extends StatelessWidget {
  const _HistoryFilters({
    required this.state,
    required this.model,
    required this.l10n,
  });
  final HistoryState state;
  final HistoryViewModel model;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        for (final (HistoryFilter filter, String label)
            in <(HistoryFilter, String)>[
              (HistoryFilter.sevenDays, l10n.historyFilter7Days),
              (HistoryFilter.thirtyDays, l10n.historyFilter30Days),
              (HistoryFilter.all, l10n.historyFilterAll),
              (HistoryFilter.missed, l10n.historyFilterMissed),
            ]) ...[
          AppFilterChip(
            label: label,
            selected: state.filter == filter,
            onSelected: (_) => model.setFilter(filter),
          ),
          const SizedBox(width: AppSpacing.s),
        ],
      ],
    ),
  );
}

class _HistoryGroup extends StatelessWidget {
  const _HistoryGroup({
    required this.title,
    required this.entries,
    required this.l10n,
  });
  final String title;
  final List<HistoryEntry> entries;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: AppTypography.title.copyWith(color: AppColors.textSecondary),
      ),
      const SizedBox(height: AppSpacing.s),
      for (final entry in entries) ...[
        HistoryEntryTile(entry: entry, l10n: l10n),
        const SizedBox(height: AppSpacing.s),
      ],
    ],
  );
}
