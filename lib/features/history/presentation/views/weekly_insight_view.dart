import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';
import '../viewmodels/history_view_model.dart';
import '../../domain/models/history_entry.dart';

class WeeklyInsightView extends ConsumerWidget {
  const WeeklyInsightView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HistoryState state = ref.watch(historyViewModelProvider);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final WeeklyStats? stats = state.weeklyStats;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: state.isLoading || stats == null
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                padding: const EdgeInsets.all(AppSpacing.pageInset),
                children: [
                  _WeeklyHeading(l10n: l10n),
                  const SizedBox(height: AppSpacing.l),
                  _WeeklyCounts(stats: stats, l10n: l10n),
                  const SizedBox(height: AppSpacing.l),
                  _DoseChart(stats: stats, l10n: l10n),
                  const SizedBox(height: AppSpacing.l),
                  _InsightCard(l10n: l10n),
                  const SizedBox(height: AppSpacing.l),
                  _SuggestionCard(
                    l10n: l10n,
                    onMove: () => context.go(AppRoutes.scheduleEditor),
                  ),
                ],
              ),
      ),
    );
  }
}

class _WeeklyHeading extends StatelessWidget {
  const _WeeklyHeading({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(l10n.weeklyTitle, style: AppTypography.heading),
      Text(l10n.weeklyDateRange, style: AppTypography.body),
    ],
  );
}

class _WeeklyCounts extends StatelessWidget {
  const _WeeklyCounts({required this.stats, required this.l10n});
  final WeeklyStats stats;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      _CountCard(
        value: '${stats.takenPercent}%',
        label: l10n.weeklyTaken,
        color: AppColors.statusGood,
      ),
      const SizedBox(width: AppSpacing.s),
      _CountCard(
        value: '${stats.missedCount}',
        label: l10n.weeklyMissed,
        color: AppColors.statusExpiring,
      ),
      const SizedBox(width: AppSpacing.s),
      _CountCard(
        value: '${stats.lowStockCount}',
        label: l10n.weeklyLowStock,
        color: AppColors.statusLowStock,
      ),
    ],
  );
}

class _CountCard extends StatelessWidget {
  const _CountCard({
    required this.value,
    required this.label,
    required this.color,
  });
  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Expanded(
    child: AppCard(
      padding: const EdgeInsets.all(AppSpacing.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: AppTypography.headingLarge.copyWith(color: color)),
          Text(label, style: AppTypography.body),
        ],
      ),
    ),
  );
}

class _DoseChart extends StatelessWidget {
  const _DoseChart({required this.stats, required this.l10n});
  final WeeklyStats stats;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final List<String> days = <String>[
      l10n.weeklyMon,
      l10n.weeklyTue,
      l10n.weeklyWed,
      l10n.weeklyThu,
      l10n.weeklyFri,
      l10n.weeklySat,
      l10n.weeklySun,
    ];
    final int maximum = stats.dailyTaken.reduce((a, b) => a > b ? a : b);
    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.weeklyDosesPerDay, style: AppTypography.title),
          const SizedBox(height: AppSpacing.l),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List<Widget>.generate(stats.dailyTaken.length, (index) {
              final double barHeight =
                  AppSizes.weeklyChartHeight *
                  stats.dailyTaken[index] /
                  maximum;
              return Expanded(
                child: Column(
                  children: [
                    Container(
                      width: AppSizes.weeklyBarWidth,
                      height: barHeight,
                      decoration: BoxDecoration(
                        color: stats.dailyTaken[index] < maximum
                            ? AppColors.statusLowStock
                            : AppColors.accent,
                        borderRadius: BorderRadius.circular(
                          AppSizes.controlRadius,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.s),
                    Text(days[index], style: AppTypography.body),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _InsightCard extends StatelessWidget {
  const _InsightCard({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) => AppCard(
    color: AppColors.primaryTint,
    borderColor: AppColors.primaryTint,
    padding: const EdgeInsets.all(AppSpacing.l),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.auto_awesome, color: AppColors.primary),
            const SizedBox(width: AppSpacing.s),
            Text(
              l10n.weeklyInsightTitle,
              style: AppTypography.title.copyWith(color: AppColors.primary),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.s),
        Text(
          l10n.weeklyInsightBody,
          style: AppTypography.body.copyWith(color: AppColors.textPrimary),
        ),
        const SizedBox(height: AppSpacing.s),
        Text(l10n.weeklyDisclaimer, style: AppTypography.body),
      ],
    ),
  );
}

class _SuggestionCard extends StatelessWidget {
  const _SuggestionCard({required this.l10n, required this.onMove});
  final AppLocalizations l10n;
  final VoidCallback onMove;

  @override
  Widget build(BuildContext context) => AppCard(
    padding: const EdgeInsets.all(AppSpacing.l),
    borderColor: AppColors.primary,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.weeklySuggestionTitle,
          style: AppTypography.title.copyWith(color: AppColors.primary),
        ),
        const SizedBox(height: AppSpacing.s),
        Text(
          l10n.weeklySuggestionBody,
          style: AppTypography.body.copyWith(color: AppColors.textPrimary),
        ),
        const SizedBox(height: AppSpacing.l),
        Row(
          children: [
            Expanded(
              child: AppButton(
                text: l10n.weeklyMoveReminder,
                onPressed: onMove,
              ),
            ),
            const SizedBox(width: AppSpacing.s),
            Expanded(
              child: AppButton(
                text: l10n.weeklyNotNow,
                variant: AppButtonVariant.secondary,
                onPressed: () => context.go(AppRoutes.today),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
