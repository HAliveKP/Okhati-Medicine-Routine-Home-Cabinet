import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../viewmodels/medicine_entry_view_model.dart';
import 'schedule_editor_controls.dart';

class ScheduleEditorPage extends StatelessWidget {
  const ScheduleEditorPage({
    super.key,
    required this.state,
    required this.model,
    required this.onBack,
    required this.onSave,
  });

  final MedicineEntryState state;
  final MedicineEntryViewModel model;
  final VoidCallback onBack;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
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
                title: l10n.scheduleEditorTitle,
                backLabel: l10n.commonBack,
                onBack: onBack,
              ),
            ),
            Expanded(
              child: ScheduleEditorList(state: state, model: model),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.pageInset),
              child: AppButton(text: l10n.commonSave, onPressed: onSave),
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleEditorList extends StatelessWidget {
  const ScheduleEditorList({
    super.key,
    required this.state,
    required this.model,
  });

  final MedicineEntryState state;
  final MedicineEntryViewModel model;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.pageInset,
        AppSpacing.s,
        AppSpacing.pageInset,
        AppSpacing.l,
      ),
      children: [
        _SectionTitle(text: l10n.scheduleEditorTimes),
        const SizedBox(height: AppSpacing.s),
        _TimeEditor(
          times: state.reminderTimes,
          addLabel: l10n.scheduleEditorAddTime,
          onAdd: model.addReminderTime,
          onRemove: model.removeReminderTime,
        ),
        const SizedBox(height: AppSpacing.l),
        _SectionTitle(text: l10n.scheduleEditorDays),
        const SizedBox(height: AppSpacing.s),
        ScheduleDayPicker(
          selected: state.days,
          labels: <String>[
            l10n.scheduleWeekdayMonday,
            l10n.scheduleWeekdayTuesday,
            l10n.scheduleWeekdayWednesday,
            l10n.scheduleWeekdayThursday,
            l10n.scheduleWeekdayFriday,
            l10n.scheduleWeekdaySaturday,
            l10n.scheduleWeekdaySunday,
          ],
          onToggle: model.toggleDay,
        ),
        const SizedBox(height: AppSpacing.l),
        _SectionTitle(text: l10n.scheduleEditorDoseAmount),
        const SizedBox(height: AppSpacing.s),
        ScheduleDoseStepper(
          amount: state.doseAmount,
          label: l10n.scheduleDoseUnit(state.doseAmount),
          onChanged: model.setDoseAmount,
        ),
        const SizedBox(height: AppSpacing.m),
        Text(l10n.scheduleEditorNeverSuggests, style: AppTypography.body),
        const SizedBox(height: AppSpacing.l),
        _SectionTitle(text: l10n.scheduleEditorAlertStyle),
        const SizedBox(height: AppSpacing.s),
        ScheduleAlertStylePicker(
          alarmEnabled: state.alarmEnabled,
          alarmLabel: l10n.scheduleAlarm,
          notificationLabel: l10n.scheduleNotification,
          onChanged: model.setAlarmEnabled,
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: AppTypography.title.copyWith(color: AppColors.textSecondary),
  );
}

class _TimeEditor extends StatelessWidget {
  const _TimeEditor({
    required this.times,
    required this.addLabel,
    required this.onAdd,
    required this.onRemove,
  });
  final List<String> times;
  final String addLabel;
  final ValueChanged<String> onAdd;
  final ValueChanged<String> onRemove;

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: AppSpacing.s,
    runSpacing: AppSpacing.s,
    crossAxisAlignment: WrapCrossAlignment.center,
    children: [
      for (final String time in times)
        InputChip(
          label: Text(
            time,
            style: AppTypography.title.copyWith(color: AppColors.primary),
          ),
          backgroundColor: AppColors.primaryTint,
          onDeleted: () => onRemove(time),
          deleteButtonTooltipMessage: addLabel,
          side: BorderSide.none,
          materialTapTargetSize: MaterialTapTargetSize.padded,
        ),
      IconButton(
        tooltip: addLabel,
        onPressed: () => _chooseTime(context),
        icon: const Icon(Icons.add),
        color: AppColors.primary,
        constraints: const BoxConstraints(
          minWidth: AppSizes.minTouch,
          minHeight: AppSizes.minTouch,
        ),
      ),
    ],
  );

  Future<void> _chooseTime(BuildContext context) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 8, minute: 0),
    );
    if (selected == null) return;
    final String time =
        '${selected.hour.toString().padLeft(2, '0')}:'
        '${selected.minute.toString().padLeft(2, '0')}';
    onAdd(time);
  }
}
