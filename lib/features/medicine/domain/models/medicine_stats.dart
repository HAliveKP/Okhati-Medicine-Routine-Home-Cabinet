import 'medicine.dart';
import 'medicine_status.dart';

/// Counts of medicines per status, shown in the cabinet summary.
class MedicineStats {
  const MedicineStats({
    required this.total,
    required this.good,
    required this.lowStock,
    required this.expiring,
    required this.expired,
  });

  static const MedicineStats empty = MedicineStats(
    total: 0,
    good: 0,
    lowStock: 0,
    expiring: 0,
    expired: 0,
  );

  final int total;
  final int good;
  final int lowStock;
  final int expiring;
  final int expired;

  factory MedicineStats.fromMedicines(Iterable<Medicine> medicines) {
    var total = 0;
    var good = 0;
    var lowStock = 0;
    var expiring = 0;
    var expired = 0;
    for (final Medicine medicine in medicines) {
      total++;
      switch (medicine.status) {
        case MedicineStatus.good:
          good++;
        case MedicineStatus.due:
          good++;
        case MedicineStatus.lowStock:
          lowStock++;
        case MedicineStatus.expiring:
          expiring++;
        case MedicineStatus.expired:
          expired++;
      }
    }
    return MedicineStats(
      total: total,
      good: good,
      lowStock: lowStock,
      expiring: expiring,
      expired: expired,
    );
  }
}
