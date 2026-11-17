import 'package:okhati/core/constants/app_constants.dart';
import 'package:okhati/core/constants/medicine_status.dart';

/// Pure function so it is easy to unit test (no Firebase, no Flutter).
/// Priority: expired > expiring > lowStock > due > good.
MedicineStatus computeMedicineStatus({
  required int quantity,
  required int lowStockThreshold,
  DateTime? expiryDate,
  bool doseDueSoon = false,
  DateTime? now,
}) {
  final today = now ?? DateTime.now();
  if (expiryDate != null) {
    if (expiryDate.isBefore(today)) return MedicineStatus.expired;
    final daysLeft = expiryDate.difference(today).inDays;
    if (daysLeft <= AppConstants.expiryWarningDays) {
      return MedicineStatus.expiring;
    }
  }
  if (quantity <= lowStockThreshold) return MedicineStatus.lowStock;
  if (doseDueSoon) return MedicineStatus.due;
  return MedicineStatus.good;
}
