import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/async_state_view.dart';
import '../widgets/medicine_details_widgets.dart';
import '../../domain/models/medicine.dart';
import '../viewmodels/medicine_details_view_model.dart';

/// One medicine, its label dose and adherence shortcuts.
class MedicineDetailsView extends ConsumerWidget {
  const MedicineDetailsView({super.key, required this.medicineId});

  final String medicineId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MedicineDetailsState state = ref.watch(
      medicineDetailsViewModelProvider(medicineId),
    );
    final MedicineDetailsViewModel viewModel = ref.read(
      medicineDetailsViewModelProvider(medicineId).notifier,
    );
    final AppLocalizations l10n = AppLocalizations.of(context);
    final Medicine? medicine = state.medicine;

    return ColoredBox(
      color: AppColors.background,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            MedicineDetailsHeader(title: medicine?.name ?? ''),
            Expanded(
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.hasError || medicine == null
                  ? AsyncStateView(
                      state: AsyncState.error,
                      errorTitle: l10n.commonErrorTitle,
                      errorBody: l10n.commonErrorBody,
                      onRetry: viewModel.load,
                      child: const SizedBox.shrink(),
                    )
                  : ListView(
                      padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
                      children: [
                        MedicineDetailsSummaryCard(medicine: medicine),
                        const SizedBox(height: 12),
                        MedicineDetailsStatsRow(medicine: medicine),
                        const SizedBox(height: 12),
                        MedicineDetailsDoseCard(medicine: medicine),
                        const SizedBox(height: 12),
                        MedicineDetailsActionRow(
                          icon: Icons.sell_outlined,
                          title: l10n.medicineDetailsConditionTag,
                          subtitle: l10n.medicineDetailsNotDiagnosis,
                          trailing: medicine.conditionTag,
                          onTap: () => context.push(AppRoutes.conditionTags),
                        ),
                        const SizedBox(height: 12),
                        MedicineDetailsActionRow(
                          icon: Icons.alarm,
                          title: l10n.medicineDetailsReminders,
                          subtitle: _reminderSummary(medicine, l10n),
                          onTap: () => context.push(AppRoutes.scheduleEditor),
                        ),
                        const SizedBox(height: 12),
                        MedicineDetailsActionRow(
                          icon: Icons.history,
                          title: l10n.medicineDetailsLast7Days,
                          subtitle: l10n.medicineDetailsTakenMissed(
                            medicine.takenLast7Days,
                            medicine.missedLast7Days,
                          ),
                          onTap: () => context.push(AppRoutes.history),
                        ),
                        const SizedBox(height: 12),
                        AppButton(
                          text: medicine.quantity <= 0
                              ? l10n.medicineDetailsNoDoses
                              : l10n.medicineDetailsMarkTaken,
                          icon: medicine.quantity <= 0 ? null : Icons.check,
                          onPressed: medicine.quantity <= 0
                              ? null
                              : () async {
                                  final bool taken = await viewModel
                                      .markTaken();
                                  if (taken && context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          l10n.medicineDetailsTakenSnack,
                                        ),
                                      ),
                                    );
                                  }
                                },
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  String _reminderSummary(Medicine medicine, AppLocalizations l10n) {
    if (medicine.reminderTimes.isEmpty) return l10n.medicineDetailsNotSet;
    return '${medicine.reminderTimes.join(' · ')} ${l10n.medicineDetailsDaily}';
  }
}
