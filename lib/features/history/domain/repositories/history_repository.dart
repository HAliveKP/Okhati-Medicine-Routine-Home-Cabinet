import '../models/history_entry.dart';

abstract class HistoryRepository {
  Future<List<HistoryEntry>> listEntries();
  Future<WeeklyStats> loadWeeklyStats();
}
