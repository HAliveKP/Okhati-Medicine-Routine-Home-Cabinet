import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';

class AlarmReminderView extends StatelessWidget {
  const AlarmReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.pageInset),
          child: Column(
            children: [
              const Spacer(),
              Text(
                l10n.alarmTitle,
                style: AppTypography.title.copyWith(
                  color: AppColors.primaryTint,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                l10n.alarmTime,
                style: AppTypography.display.copyWith(
                  color: AppColors.surface,
                  fontSize: AppSizes.alarmTimeFontSize,
                  height: 1,
                ),
              ),
              const Spacer(),
              Container(
                width: AppSizes.onboardingIllustrationInner,
                height: AppSizes.onboardingIllustrationInner,
                decoration: const BoxDecoration(
                  color: AppColors.surface,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.medication_outlined,
                  color: AppColors.primary,
                  size: AppSizes.onboardingIllustrationIcon,
                ),
              ),
              const SizedBox(height: AppSpacing.l),
              Text(
                l10n.alarmMedicine,
                style: AppTypography.headingLarge.copyWith(
                  color: AppColors.surface,
                ),
              ),
              const SizedBox(height: AppSpacing.s),
              Text(
                l10n.alarmDose,
                style: AppTypography.body.copyWith(
                  color: AppColors.primaryTint,
                ),
              ),
              const Spacer(),
              AppButton(
                text: l10n.alarmTaken,
                variant: AppButtonVariant.secondary,
                onPressed: () => context.go(AppRoutes.today),
              ),
              const SizedBox(height: AppSpacing.s),
              _AlarmSnoozeButton(
                label: l10n.alarmSnoozeTen,
                onPressed: () => context.go(AppRoutes.snoozeAt(10)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AlarmSnoozeButton extends StatelessWidget {
  const _AlarmSnoozeButton({required this.label, required this.onPressed});
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    height: AppSizes.buttonHeight,
    child: OutlinedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.schedule),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.surface,
        side: const BorderSide(color: AppColors.surface),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
        ),
      ),
    ),
  );
}
