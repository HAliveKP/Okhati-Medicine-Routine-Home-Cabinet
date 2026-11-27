import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:okhati/features/history/domain/models/dose_log.dart';

class HistoryRemoteDatasource {
  final FirebaseFirestore firestore;

  HistoryRemoteDatasource({FirebaseFirestore? firestore})
      : firestore = firestore ?? FirebaseFirestore.instance;

  Future<List<DoseLog>> getDoseLogs(String profileId, DateTime startDate, DateTime endDate) async {
    try {
      final snapshot = await firestore
          .collection('doseLogs')
          .where('profileId', isEqualTo: profileId)
          .where('scheduledAt', isGreaterThanOrEqualTo: Timestamp.fromDate(startDate))
          .where('scheduledAt', isLessThanOrEqualTo: Timestamp.fromDate(endDate))
          .get();

      return snapshot.docs.map((doc) => DoseLog.fromFirestore(doc)).toList();
    } catch (e) {
      // Fallback or handle offline cache when offline query fails or cache is used
      try {
        final cacheSnapshot = await firestore
            .collection('doseLogs')
            .where('profileId', isEqualTo: profileId)
            .get(const GetOptions(source: Source.cache));

        final logs = cacheSnapshot.docs.map((doc) => DoseLog.fromFirestore(doc)).toList();
        return logs.where((log) {
          return log.scheduledAt.isAfter(startDate.subtract(const Duration(seconds: 1))) &&
                 log.scheduledAt.isBefore(endDate.add(const Duration(seconds: 1)));
        }).toList();
      } catch (_) {
        return [];
      }
    }
  }
}
