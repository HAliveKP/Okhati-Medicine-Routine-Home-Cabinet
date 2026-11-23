import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/di/providers.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/async_state_view.dart';
import '../../../../core/widgets/section_label.dart';
import '../../domain/models/dose.dart';
import '../viewmodels/today_view_model.dart';
import 'cabinet_summary_card.dart';
import 'dose_tile.dart';
import 'insight_card.dart';
import 'quick_action_tile.dart';
import 'today_header.dart';

/// Layout composition for the Today feature.
class TodayDashboard extends StatelessWidget {
  const TodayDashboard({
    super.key,
    required this.state,
    required this.viewModel,
    required this.settings,
  });

  final TodayState state;
  final TodayViewModel viewModel;
  final AppSettingsController settings;

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: AppColors.background,
    child: SafeArea(
      bottom: false,
      child: Column(
        children: [
          TodayHeader(profileName: state.profileName, settings: settings),
          Expanded(
            child: TodayDoseContent(state: state, viewModel: viewModel),
          ),
        ],
      ),
    ),
  );
}

class TodayDoseContent extends StatelessWidget {
  const TodayDoseContent({
    super.key,
    required this.state,
    required this.viewModel,
  });

  final TodayState state;
  final TodayViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.hasError) {
      return AsyncStateView(
        state: AsyncState.error,
        errorTitle: l10n.commonErrorTitle,
        errorBody: l10n.commonErrorBody,
        onRetry: viewModel.load,
        child: const SizedBox.shrink(),
      );
    }
    if (state.doses.isEmpty) {
      return AsyncStateView(
        state: AsyncState.empty,
        emptyTitle: l10n.todayEmptyTitle,
        emptyBody: l10n.todayEmptyBody,
        child: const SizedBox.shrink(),
      );
    }
    return TodayDoseList(state: state, viewModel: viewModel);
  }
}

class TodayDoseList extends StatelessWidget {
  const TodayDoseList({
    super.key,
    required this.state,
    required this.viewModel,
  });

  final TodayState state;
  final TodayViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
      children: [
        SectionLabel(l10n.todayLabel),
        const SizedBox(height: 12),
        for (final Dose dose in state.doses) ...[
          _TodayDoseRow(dose: dose, viewModel: viewModel),
          const SizedBox(height: 12),
        ],
        CabinetSummaryCard(
          stats: state.stats,
          onTap: () => context.go(AppRoutes.cabinet),
        ),
        const SizedBox(height: 12),
        InsightCard(onTap: () => context.go(AppRoutes.weeklyInsight)),
        const SizedBox(height: 12),
        _TodayQuickActions(labels: l10n),
      ],
    );
  }
}

class _TodayDoseRow extends StatelessWidget {
  const _TodayDoseRow({required this.dose, required this.viewModel});

  final Dose dose;
  final TodayViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final DoseTileStatus tileStatus = switch (dose.status) {
      DoseStatus.taken => DoseTileStatus.taken,
      DoseStatus.due => DoseTileStatus.due,
      DoseStatus.upcoming => DoseTileStatus.upcoming,
    };
    return DoseTile(
      time: dose.timeLabel,
      name: dose.medicineName,
      detail: AppLocalizations.of(context)
          .doseDetail(dose.strength, dose.doseLabel),
      status: tileStatus,
      onTaken: dose.status == DoseStatus.due
          ? () => viewModel.markTaken(dose.id)
          : null,
      onSnooze: dose.status == DoseStatus.due
          ? () => viewModel.snooze(dose.id)
          : null,
      onTap: () => context.go(AppRoutes.medicine(dose.medicineId)),
    );
  }
}

class _TodayQuickActions extends StatelessWidget {
  const _TodayQuickActions({required this.labels});

  final AppLocalizations labels;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: QuickActionTile(
          icon: Icons.add,
          label: labels.todayAdd,
          onTap: () => context.go(AppRoutes.addMedicine),
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: QuickActionTile(
          icon: Icons.photo_camera_outlined,
          label: labels.todayScan,
          onTap: () => context.go(AppRoutes.scan),
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: QuickActionTile(
          icon: Icons.history,
          label: labels.todayHistory,
          onTap: () => context.go(AppRoutes.history),
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: QuickActionTile(
          icon: Icons.chat_bubble_outline,
          label: labels.todayMediGuide,
          onTap: () => context.go(AppRoutes.mediGuide),
        ),
      ),
    ],
  );
}
