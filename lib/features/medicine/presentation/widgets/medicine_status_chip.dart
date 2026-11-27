import 'package:material_ui/material_ui.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/status_chip.dart';
import '../../domain/models/medicine_status.dart';

/// Feature presentation mapping from medicine status to its visual treatment.
extension MedicineStatusStyle on MedicineStatus {
  Color get color => switch (this) {
    MedicineStatus.good => AppColors.statusGood,
    MedicineStatus.due => AppColors.statusDue,
    MedicineStatus.lowStock => AppColors.statusLowStock,
    MedicineStatus.expiring => AppColors.statusExpiring,
    MedicineStatus.expired => AppColors.statusExpired,
  };

  Color get backgroundColor => switch (this) {
    MedicineStatus.good => AppColors.statusGoodBackground,
    MedicineStatus.due => AppColors.statusDueBackground,
    MedicineStatus.lowStock => AppColors.statusLowStockBackground,
    MedicineStatus.expiring => AppColors.statusExpiringBackground,
    MedicineStatus.expired => AppColors.statusExpiredBackground,
  };

  IconData get icon => switch (this) {
    MedicineStatus.good => Icons.check,
    MedicineStatus.due => Icons.schedule,
    MedicineStatus.lowStock => Icons.warning_amber_rounded,
    MedicineStatus.expiring => Icons.warning_amber_rounded,
    MedicineStatus.expired => Icons.close,
  };

  String label(AppLocalizations l10n) => switch (this) {
    MedicineStatus.good => l10n.statusGood,
    MedicineStatus.due => l10n.statusDue,
    MedicineStatus.lowStock => l10n.statusLowStock,
    MedicineStatus.expiring => l10n.statusExpiring,
    MedicineStatus.expired => l10n.statusExpired,
  };
}

/// Localized status chip for medicine feature screens.
class MedicineStatusChip extends StatelessWidget {
  const MedicineStatusChip({super.key, required this.status, this.label});

  final MedicineStatus status;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return StatusChip(
      icon: status.icon,
      label: label ?? status.label(l10n),
      color: status.color,
      backgroundColor: status.backgroundColor,
    );
  }
}
