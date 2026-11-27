import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../viewmodels/medicine_entry_view_model.dart';
import '../widgets/medicine_entry_field.dart';

class ScanConfirmView extends ConsumerWidget {
  const ScanConfirmView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final MedicineEntryState state = ref.watch(medicineEntryViewModelProvider);
    final MedicineEntryViewModel model = ref.read(
      medicineEntryViewModelProvider.notifier,
    );
    final String expiry = state.expiryDate == null
        ? ''
        : DateFormat('MM/yyyy', l10n.localeName).format(state.expiryDate!);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.pageInset,
              ),
              child: AppTopBar(
                title: l10n.scanConfirm,
                backLabel: l10n.commonBack,
                onBack: () => context.go(AppRoutes.scan),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.pageInset,
                  AppSpacing.s,
                  AppSpacing.pageInset,
                  AppSpacing.l,
                ),
                children: [
                  _AiNotice(text: l10n.scanConfirmAiNotice),
                  const SizedBox(height: AppSpacing.l),
                  MedicineEntryField(
                    label: l10n.addMedicineMedicineName,
                    value: state.name,
                    onChanged: model.setName,
                    icon: Icons.medication_outlined,
                  ),
                  const SizedBox(height: AppSpacing.l),
                  MedicineEntryField(
                    label: l10n.addMedicineStrength,
                    value: state.strength,
                    onChanged: model.setStrength,
                  ),
                  const SizedBox(height: AppSpacing.l),
                  MedicineEntryField(
                    label: l10n.addMedicineExpiryDate,
                    value: expiry,
                    onChanged: (_) {},
                    onTap: () => _chooseExpiry(context, state, model),
                    error: true,
                    errorText: l10n.scanConfirmLowConfidence,
                  ),
                  const SizedBox(height: AppSpacing.l),
                  MedicineEntryField(
                    label: l10n.addMedicineQuantity,
                    value: state.quantity,
                    onChanged: model.setQuantity,
                    keyboardType: TextInputType.number,
                    error: state.error || state.quantity.isEmpty,
                    errorText: l10n.scanConfirmRequired,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.pageInset,
                AppSpacing.s,
                AppSpacing.pageInset,
                AppSpacing.pageInset,
              ),
              child: Column(
                children: [
                  Text(l10n.scanConfirmAiMistakes, style: AppTypography.body),
                  const SizedBox(height: AppSpacing.s),
                  AppButton(
                    text: l10n.scanConfirmSave,
                    onPressed: state.isSaving
                        ? null
                        : () async {
                            if (await model.save() && context.mounted) {
                              context.go(AppRoutes.cabinet);
                            }
                          },
                  ),
                  const SizedBox(height: AppSpacing.s),
                  AppButton(
                    text: l10n.scanConfirmEditManual,
                    variant: AppButtonVariant.secondary,
                    onPressed: () => context.go(AppRoutes.addMedicine),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _chooseExpiry(
    BuildContext context,
    MedicineEntryState state,
    MedicineEntryViewModel model,
  ) async {
    final DateTime now = DateTime.now();
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: state.expiryDate ?? DateTime(now.year + 1),
      firstDate: DateTime(now.year),
      lastDate: DateTime(now.year + 20),
    );
    if (selected != null) model.setExpiryDate(selected);
  }
}

class _AiNotice extends StatelessWidget {
  const _AiNotice({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(AppSpacing.l),
    decoration: BoxDecoration(
      color: AppColors.insightSurface,
      borderRadius: BorderRadius.circular(AppSizes.cardRadius),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.info_outline, color: AppColors.statusDue),
        const SizedBox(width: AppSpacing.s),
        Expanded(
          child: Text(
            text,
            style: AppTypography.body.copyWith(color: AppColors.textPrimary),
          ),
        ),
      ],
    ),
  );
}
