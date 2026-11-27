import 'package:flutter_test/flutter_test.dart';
import 'package:okhati/features/history/domain/models/dose_log.dart';

void main() {
  group('History Domain Logic - Filter and Adherence', () {
    final logs = [
      DoseLog(
        id: '1',
        profileId: 'p1',
        medicineId: 'm1',
        medicineName: 'Paracetamol',
        scheduledAt: DateTime(2026, 5, 10, 8, 0),
        status: DoseStatus.taken,
      ),
      DoseLog(
        id: '2',
        profileId: 'p1',
        medicineId: 'm1',
        medicineName: 'Paracetamol',
        scheduledAt: DateTime(2026, 5, 12, 8, 0),
        status: DoseStatus.missed,
      ),
      DoseLog(
        id: '3',
        profileId: 'p1',
        medicineId: 'm2',
        medicineName: 'Amoxicillin',
        scheduledAt: DateTime(2026, 5, 20, 8, 0), // outside range
        status: DoseStatus.taken,
      ),
    ];

    test('calculateAdherence computes correct percentage', () {
      final adherenceAll = calculateAdherence(logs);
      // 2 taken out of 3 total = 66.666...%
      expect(adherenceAll, closeTo(66.67, 0.1));

      final emptyAdherence = calculateAdherence([]);
      expect(emptyAdherence, 0.0);
    });

    test('filterDoseLogsByRange filters logs within date range inclusive', () {
      final startDate = DateTime(2026, 5, 1);
      final endDate = DateTime(2026, 5, 15);

      final filtered = filterDoseLogsByRange(logs, startDate, endDate);
      expect(filtered.length, 2);
      expect(filtered.any((l) => l.id == '3'), false);
      expect(filtered.any((l) => l.id == '1'), true);
      expect(filtered.any((l) => l.id == '2'), true);
    });
  });
}
