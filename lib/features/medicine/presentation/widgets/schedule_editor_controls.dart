import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class ScheduleDayPicker extends StatelessWidget {
  const ScheduleDayPicker({
    super.key,
    required this.selected,
    required this.labels,
    required this.onToggle,
  });
  final Set<int> selected;
  final List<String> labels;
  final ValueChanged<int> onToggle;

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: AppSpacing.xs,
    runSpacing: AppSpacing.xs,
    children: List<Widget>.generate(
      labels.length,
      (index) => Semantics(
        label: labels[index],
        selected: selected.contains(index),
        child: FilterChip(
          label: Text(labels[index]),
          selected: selected.contains(index),
          onSelected: (_) => onToggle(index),
          showCheckmark: false,
          selectedColor: AppColors.primary,
          backgroundColor: AppColors.surface,
          labelStyle: AppTypography.title.copyWith(
            color: selected.contains(index)
                ? AppColors.surface
                : AppColors.textPrimary,
          ),
          side: BorderSide(
            color: selected.contains(index)
                ? AppColors.primary
                : AppColors.line,
          ),
          materialTapTargetSize: MaterialTapTargetSize.padded,
        ),
      ),
    ),
  );
}

class ScheduleDoseStepper extends StatelessWidget {
  const ScheduleDoseStepper({
    super.key,
    required this.amount,
    required this.label,
    required this.onChanged,
  });
  final int amount;
  final String label;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(AppSpacing.s),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppSizes.cardRadius),
      border: const Border.fromBorderSide(BorderSide(color: AppColors.line)),
    ),
    child: Row(
      children: [
        ScheduleStepButton(
          icon: Icons.remove,
          label: label,
          onTap: amount > 1 ? () => onChanged(amount - 1) : null,
        ),
        Expanded(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: AppTypography.heading,
          ),
        ),
        ScheduleStepButton(
          icon: Icons.add,
          label: label,
          onTap: amount < 20 ? () => onChanged(amount + 1) : null,
        ),
      ],
    ),
  );
}

class ScheduleStepButton extends StatelessWidget {
  const ScheduleStepButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => IconButton(
    tooltip: label,
    onPressed: onTap,
    icon: Icon(icon),
    color: AppColors.primary,
    style: IconButton.styleFrom(
      backgroundColor: AppColors.primaryTint,
      minimumSize: const Size(AppSizes.avatar, AppSizes.avatar),
    ),
  );
}

class ScheduleAlertStylePicker extends StatelessWidget {
  const ScheduleAlertStylePicker({
    super.key,
    required this.alarmEnabled,
    required this.alarmLabel,
    required this.notificationLabel,
    required this.onChanged,
  });
  final bool alarmEnabled;
  final String alarmLabel;
  final String notificationLabel;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) => SegmentedButton<bool>(
    segments: <ButtonSegment<bool>>[
      ButtonSegment(
        value: false,
        label: Text(notificationLabel),
        icon: const Icon(Icons.notifications_none),
      ),
      ButtonSegment(
        value: true,
        label: Text(alarmLabel),
        icon: const Icon(Icons.alarm_outlined),
      ),
    ],
    selected: <bool>{alarmEnabled},
    onSelectionChanged: (values) => onChanged(values.first),
    showSelectedIcon: false,
  );
}
