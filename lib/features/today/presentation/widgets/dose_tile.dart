import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/spacing.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/status_chip.dart';

/// Where a dose sits in today's routine.
enum DoseTileStatus { taken, due, upcoming }

/// Today-specific dose card composed from shared controls.
class DoseTile extends StatelessWidget {
  const DoseTile({
    super.key,
    required this.time,
    required this.name,
    required this.detail,
    required this.status,
    this.onTaken,
    this.onSnooze,
    this.onTap,
  });

  final String time;
  final String name;
  final String detail;
  final DoseTileStatus status;
  final VoidCallback? onTaken;
  final VoidCallback? onSnooze;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isDue = status == DoseTileStatus.due;
    final AppLocalizations l10n = AppLocalizations.of(context);
    final BorderRadius borderRadius = BorderRadius.circular(
      AppSizes.cardRadius,
    );

    return Material(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: isDue
            ? const BorderSide(
                color: AppColors.primary,
                width: AppSizes.selectedBorderWidth,
              )
            : const BorderSide(color: AppColors.line),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Padding(
          padding: isDue
              ? const EdgeInsets.all(AppSpacing.l)
              : const EdgeInsets.symmetric(
                  horizontal: AppSpacing.l,
                  vertical: AppSpacing.m,
                ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    time,
                    style: AppTypography.title.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.m),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.title,
                        ),
                        Text(
                          detail,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.body,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpacing.s),
                  _statusPill(l10n),
                ],
              ),
              if (isDue) ...[
                const SizedBox(height: AppSpacing.m),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        text: l10n.doseTaken,
                        onPressed: onTaken,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.m),
                    Expanded(
                      child: AppButton(
                        text: l10n.doseSnooze,
                        onPressed: onSnooze,
                        variant: AppButtonVariant.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _statusPill(AppLocalizations l10n) => switch (status) {
    DoseTileStatus.taken => StatusChip(
      icon: Icons.check,
      label: l10n.doseTaken,
      color: AppColors.statusGood,
      backgroundColor: AppColors.statusGoodBackground,
    ),
    DoseTileStatus.due => StatusChip(
      icon: Icons.schedule,
      label: l10n.statusDue,
      color: AppColors.statusDue,
      backgroundColor: AppColors.statusDueBackground,
    ),
    DoseTileStatus.upcoming => StatusChip(
      icon: Icons.schedule,
      label: l10n.doseUpcoming,
      color: AppColors.textSecondary,
      backgroundColor: AppColors.line,
    ),
  };
}
