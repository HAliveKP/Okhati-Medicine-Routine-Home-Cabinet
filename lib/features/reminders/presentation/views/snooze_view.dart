import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class SnoozeView extends StatelessWidget {
  const SnoozeView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final int selected =
        int.tryParse(
          GoRouterState.of(context).uri.queryParameters['minutes'] ?? '',
        ) ??
        10;
    return Scaffold(
      backgroundColor: AppColors.textPrimary,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            const Icon(
              Icons.schedule,
              color: AppColors.surface,
              size: AppSizes.snoozeIcon,
            ),
            const SizedBox(height: AppSpacing.m),
            Text(
              '${l10n.alarmMedicine} · ${l10n.alarmTime}',
              style: AppTypography.title.copyWith(color: AppColors.surface),
            ),
            const Spacer(),
            _SnoozeChoices(selected: selected, l10n: l10n),
          ],
        ),
      ),
    );
  }
}

class _SnoozeChoices extends StatelessWidget {
  const _SnoozeChoices({required this.selected, required this.l10n});
  final int selected;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.fromLTRB(
      AppSpacing.pageInset,
      AppSpacing.l,
      AppSpacing.pageInset,
      AppSpacing.xl,
    ),
    decoration: const BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppSizes.entryCardRadius),
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: AppSizes.snoozeHandleWidth,
            height: AppSpacing.s,
            decoration: BoxDecoration(
              color: AppColors.line,
              borderRadius: BorderRadius.circular(AppSizes.chipRadius),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.l),
        Text(l10n.snoozeTitle, style: AppTypography.heading),
        const SizedBox(height: AppSpacing.l),
        _SnoozeOption(minutes: 5, label: l10n.snooze5, selected: selected == 5),
        const SizedBox(height: AppSpacing.s),
        _SnoozeOption(
          minutes: 10,
          label: l10n.snooze10,
          selected: selected == 10,
        ),
        const SizedBox(height: AppSpacing.s),
        _SnoozeOption(
          minutes: 15,
          label: l10n.snooze15,
          selected: selected == 15,
        ),
        const SizedBox(height: AppSpacing.l),
        Center(
          child: TextButton(
            onPressed: () => context.go(AppRoutes.alarmReminder),
            child: Text(l10n.snoozeCancel),
          ),
        ),
      ],
    ),
  );
}

class _SnoozeOption extends StatelessWidget {
  const _SnoozeOption({
    required this.minutes,
    required this.label,
    required this.selected,
  });
  final int minutes;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    selected: selected,
    child: Material(
      color: selected ? AppColors.primaryTint : AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.entryCardRadius),
        side: BorderSide(
          color: selected ? AppColors.primary : AppColors.line,
          width: selected ? AppSizes.selectedBorderWidth : 1,
        ),
      ),
      child: InkWell(
        onTap: () => context.go(AppRoutes.snoozeAt(minutes)),
        borderRadius: BorderRadius.circular(AppSizes.entryCardRadius),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: AppSizes.buttonHeight),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: AppTypography.title.copyWith(
                      color: selected
                          ? AppColors.primary
                          : AppColors.textPrimary,
                    ),
                  ),
                ),
                if (selected) const Icon(Icons.check, color: AppColors.primary),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
