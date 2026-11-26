import 'package:flutter_test/flutter_test.dart';
import 'package:okhati/features/dashboard/domain/today_dose.dart';

void main() {
  test('parses a dose and infers period from scheduled time', () {
    final dose = TodayDose.fromMap({
      'medicineName': 'Vitamin D',
      'strength': '1000 IU',
      'scheduledAt': '2026-11-26T08:00:00',
      'status': 'pending',
    });

    expect(dose.medicineName, 'Vitamin D');
    expect(dose.period, DosePeriod.morning);
    expect(dose.status, DoseStatus.pending);
  });

  test('rejects a dose without a scheduled time', () {
    expect(() => TodayDose.fromMap({}), throwsFormatException);
  });
}
