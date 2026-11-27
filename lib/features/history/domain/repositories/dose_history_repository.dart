import '../models/dose_log.dart';

abstract class DoseHistoryRepository {
  Future<List<DoseLog>> getDoseLogs(
    String profileId,
    DateTime startDate,
    DateTime endDate,
  );
}
