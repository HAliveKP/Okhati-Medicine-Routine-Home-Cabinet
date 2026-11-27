import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okhati/features/dashboard/domain/today_dose.dart';

final todayDoseRepositoryProvider = Provider<TodayDoseRepository>(
  (ref) => TodayDoseRepository(FirebaseFirestore.instance),
);

class TodayDoseRepository {
  TodayDoseRepository(this.firestore);

  final FirebaseFirestore firestore;

  Future<List<TodayDose>> fetchToday({DateTime? now}) async {
    final today = now ?? DateTime.now();
    final start = DateTime(today.year, today.month, today.day);
    final end = start.add(const Duration(days: 1));
    final snapshot = await firestore
        .collection('users')
        .doc('current')
        .collection('doseLogs')
        .where('scheduledAt', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
        .where('scheduledAt', isLessThan: Timestamp.fromDate(end))
        .get();

    if (snapshot.docs.isEmpty) return _sampleDoses(start);
    return snapshot.docs
        .map((doc) => TodayDose.fromMap(doc.data()))
        .toList()
      ..sort((a, b) => a.time.compareTo(b.time));
  }

  List<TodayDose> _sampleDoses(DateTime day) => [
        TodayDose(
          medicineName: 'Vitamin D',
          strength: '1000 IU',
          time: DateTime(day.year, day.month, day.day, 8),
          period: DosePeriod.morning,
          status: DoseStatus.pending,
        ),
        TodayDose(
          medicineName: 'Calcium',
          strength: '500 mg',
          time: DateTime(day.year, day.month, day.day, 13),
          period: DosePeriod.noon,
          status: DoseStatus.taken,
        ),
        TodayDose(
          medicineName: 'Iron',
          strength: '18 mg',
          time: DateTime(day.year, day.month, day.day, 20),
          period: DosePeriod.night,
          status: DoseStatus.pending,
        ),
      ];
}
