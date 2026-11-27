/// Import this enum instead of redefining it. Pure Dart — no Flutter import.
enum MedicineStatus { good, due, lowStock, expiring, expired }

/// Display-ready label ARB key for each status. Keep these in sync with ARB.
extension MedicineStatusLabel on MedicineStatus {
  String get arbKey => switch (this) {
    MedicineStatus.good => 'statusGood',
    MedicineStatus.due => 'statusDue',
    MedicineStatus.lowStock => 'statusLowStock',
    MedicineStatus.expiring => 'statusExpiring',
    MedicineStatus.expired => 'statusExpired',
  };
}

/// Derives the cabinet status from the quantity and expiry date.
///
/// Expired wins over expiring, which wins over low stock.
MedicineStatus statusFor({
  required int quantity,
  required DateTime expiryDate,
  required DateTime now,
  int alertAt = 10,
}) {
  final DateTime today = DateTime(now.year, now.month, now.day);
  final DateTime expiryDay = DateTime(
    expiryDate.year,
    expiryDate.month,
    expiryDate.day,
  );
  if (expiryDay.isBefore(today)) return MedicineStatus.expired;
  if (expiryDay.difference(today).inDays <= 30) {
    return MedicineStatus.expiring;
  }
  if (quantity <= alertAt) return MedicineStatus.lowStock;
  return MedicineStatus.good;
}
