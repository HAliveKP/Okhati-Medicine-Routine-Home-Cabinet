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
import '../../domain/models/medicine.dart';
import '../viewmodels/medicine_entry_view_model.dart';
import '../widgets/medicine_entry_field.dart';

class AddMedicineView extends ConsumerWidget {
  const AddMedicineView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MedicineEntryState state = ref.watch(medicineEntryViewModelProvider);
    final MedicineEntryViewModel model = ref.read(
      medicineEntryViewModelProvider.notifier,
    );
    final AppLocalizations l10n = AppLocalizations.of(context);
    final String expiry = state.expiryDate == null
        ? ''
        : DateFormat.yMMMd(l10n.localeName).format(state.expiryDate!);
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
                title: l10n.addMedicineTitle,
                backLabel: l10n.commonClose,
                onBack: () => context.go(AppRoutes.cabinet),
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
                  _ScanCallout(onTap: () => context.go(AppRoutes.scan)),
                  const SizedBox(height: AppSpacing.l),
                  MedicineEntryField(
                    label: l10n.addMedicineMedicineName,
                    value: state.name,
                    icon: Icons.medication_outlined,
                    onChanged: model.setName,
                    error: state.error && state.name.trim().isEmpty,
                    errorText: l10n.scanConfirmRequired,
                  ),
                  const SizedBox(height: AppSpacing.l),
                  Row(
                    children: [
                      Expanded(
                        child: MedicineEntryField(
                          label: l10n.addMedicineStrength,
                          value: state.strength,
                          onChanged: model.setStrength,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.m),
                      Expanded(
                        child: MedicineEntryField(
                          label: l10n.addMedicineQuantity,
                          value: state.quantity,
                          onChanged: model.setQuantity,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.l),
                  MedicineEntryField(
                    label: l10n.addMedicineExpiryDate,
                    value: expiry,
                    icon: Icons.event_available,
                    onChanged: (_) {},
                    onTap: () => _chooseExpiry(context, model),
                    error: state.error && state.expiryDate == null,
                    errorText: l10n.scanConfirmRequired,
                  ),
                  const SizedBox(height: AppSpacing.l),
                  MedicineEntryTile(
                    icon: Icons.sell_outlined,
                    title: state.conditionTag ?? l10n.addMedicineConditionTag,
                    subtitle: l10n.conditionTagsTitle,
                    onTap: () => context.go(AppRoutes.conditionTags),
                  ),
                  const SizedBox(height: AppSpacing.l),
                  MedicineEntryTile(
                    icon: Icons.alarm_outlined,
                    title: l10n.addMedicineSetReminder,
                    subtitle: state.reminderTimes.isEmpty
                        ? l10n.scheduleEditorTitle
                        : state.reminderTimes.join(' · '),
                    onTap: () => context.go(AppRoutes.scheduleEditor),
                  ),
                  if (state.error)
                    Padding(
                      padding: const EdgeInsets.only(top: AppSpacing.m),
                      child: Text(
                        l10n.commonErrorBody,
                        style: AppTypography.body.copyWith(
                          color: AppColors.statusExpiring,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.pageInset),
              child: AppButton(
                text: l10n.addMedicineSave,
                onPressed: state.isSaving
                    ? null
                    : () => _saveMedicine(context, model, l10n),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveMedicine(
    BuildContext context,
    MedicineEntryViewModel model,
    AppLocalizations l10n,
  ) async {
    final Medicine? duplicate = await model.findPotentialDuplicate();
    if (duplicate != null && context.mounted) {
      final bool? continueSaving = await showDialog<bool>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: Text(l10n.duplicateMedicineTitle),
          content: Text(l10n.duplicateMedicineMessage(duplicate.name)),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(l10n.commonCancel),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text(l10n.duplicateMedicineContinue),
            ),
          ],
        ),
      );
      if (continueSaving != true) return;
    }
    if (await model.save() && context.mounted) context.go(AppRoutes.cabinet);
  }

  Future<void> _chooseExpiry(
    BuildContext context,
    MedicineEntryViewModel model,
  ) async {
    final DateTime now = DateTime.now();
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year + 1, now.month, now.day),
      firstDate: DateTime(now.year),
      lastDate: DateTime(now.year + 20),
    );
    if (date != null) model.setExpiryDate(date);
  }
}

class _ScanCallout extends StatelessWidget {
  const _ScanCallout({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return Material(
      color: AppColors.primaryTint,
      borderRadius: BorderRadius.circular(AppSizes.cardRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.l),
          child: Row(
            children: [
              const Icon(Icons.photo_camera_outlined, color: AppColors.primary),
              const SizedBox(width: AppSpacing.l),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.addMedicineScanPackage,
                      style: AppTypography.title,
                    ),
                    Text(
                      l10n.addMedicineScanSubtitle,
                      style: AppTypography.body,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.primary),
            ],
          ),
        ),
      ),
    );
  }
}
