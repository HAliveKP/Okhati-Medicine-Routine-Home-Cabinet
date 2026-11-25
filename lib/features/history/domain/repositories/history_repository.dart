import 'package:okhati/features/history/domain/models/dose_log.dart';

abstract class HistoryRepository {
  Future<List<DoseLog>> getDoseLogs(String profileId, DateTime startDate, DateTime endDate);
}
