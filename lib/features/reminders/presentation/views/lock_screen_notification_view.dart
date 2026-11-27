import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';

class LockScreenNotificationView extends StatelessWidget {
  const LockScreenNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColors.textPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.pageInset),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  l10n.lockDate,
                  style: AppTypography.title.copyWith(color: AppColors.surface),
                ),
              ),
              Text(
                l10n.lockTime,
                style: AppTypography.display.copyWith(
                  color: AppColors.surface,
                  fontSize: AppSizes.alarmTimeFontSize,
                  height: 1,
                ),
              ),
              const Spacer(),
              _NotificationCard(l10n: l10n),
              const SizedBox(height: AppSpacing.m),
              Text(
                l10n.lockOpenHint,
                textAlign: TextAlign.center,
                style: AppTypography.body.copyWith(color: AppColors.line),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) => Material(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(AppSizes.entryCardRadius),
    child: InkWell(
      onTap: () => context.go(AppRoutes.alarmReminder),
      borderRadius: BorderRadius.circular(AppSizes.entryCardRadius),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.medication_outlined, color: AppColors.primary),
                const SizedBox(width: AppSpacing.s),
                Text(l10n.appTitle.toUpperCase(), style: AppTypography.title),
                const Spacer(),
                Text(l10n.lockNow, style: AppTypography.body),
              ],
            ),
            const SizedBox(height: AppSpacing.l),
            Text(l10n.lockNotificationTitle, style: AppTypography.heading),
            const SizedBox(height: AppSpacing.s),
            Text(l10n.lockNotificationDetails, style: AppTypography.body),
            const SizedBox(height: AppSpacing.l),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: l10n.alarmTaken,
                    onPressed: () => context.go(AppRoutes.today),
                  ),
                ),
                const SizedBox(width: AppSpacing.s),
                Expanded(
                  child: AppButton(
                    text: l10n.doseSnooze,
                    variant: AppButtonVariant.secondary,
                    onPressed: () => context.go(AppRoutes.snoozeAt(10)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
