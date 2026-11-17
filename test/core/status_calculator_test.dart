import 'package:flutter_test/flutter_test.dart';
import 'package:okhati/core/constants/medicine_status.dart';
import 'package:okhati/core/utils/status_calculator.dart';

void main() {
  final now = DateTime(2026, 11, 17);

  test('expired beats everything', () {
    expect(
      computeMedicineStatus(
        quantity: 0,
        lowStockThreshold: 5,
        expiryDate: DateTime(2026, 11, 1),
        now: now,
      ),
      MedicineStatus.expired,
    );
  });

  test('expiring within 30 days', () {
    expect(
      computeMedicineStatus(
        quantity: 50,
        lowStockThreshold: 5,
        expiryDate: DateTime(2026, 12, 1),
        now: now,
      ),
      MedicineStatus.expiring,
    );
  });

  test('low stock at threshold', () {
    expect(
      computeMedicineStatus(quantity: 5, lowStockThreshold: 5, now: now),
      MedicineStatus.lowStock,
    );
  });

  test('good when healthy', () {
    expect(
      computeMedicineStatus(quantity: 30, lowStockThreshold: 5, now: now),
      MedicineStatus.good,
    );
  });
}
