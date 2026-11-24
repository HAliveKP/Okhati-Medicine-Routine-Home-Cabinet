import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/spacing.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/date_format.dart';
import '../../../../core/widgets/app_card.dart';
import '../../domain/models/medicine.dart';
import 'medicine_status_chip.dart';

/// Medicine-specific row card, composed from the shared AppCard primitive.
class MedicineCard extends StatelessWidget {
  const MedicineCard({super.key, required this.medicine, this.onTap});

  final Medicine medicine;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final String? condition = medicine.conditionTag;
    final String subtitle = condition == null || condition.isEmpty
        ? l10n.medicineCardSubtitleNoCondition(medicine.strength)
        : l10n.medicineCardSubtitle(medicine.strength, condition);
    final String meta = l10n.medicineCardMeta(
      medicine.quantity,
      dmY(medicine.expiryDate),
    );

    return AppCard(
      onTap: onTap,
      semanticLabel: l10n.medicineCardAccessibility(
        medicine.name,
        subtitle,
        medicine.status.label(l10n),
      ),
      padding: const EdgeInsets.all(AppSpacing.m),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: AppSizes.medicineThumb,
            height: AppSizes.medicineThumb,
            decoration: BoxDecoration(
              color: AppColors.primaryTint,
              borderRadius: BorderRadius.circular(AppSizes.cardRadius),
            ),
            child: const Icon(
              Icons.medication_outlined,
              size: AppSizes.medicineThumbIcon,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: AppSpacing.m),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  medicine.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.title,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.body,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  meta,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.meta,
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.s),
          MedicineStatusChip(status: medicine.status),
        ],
      ),
    );
  }
}
