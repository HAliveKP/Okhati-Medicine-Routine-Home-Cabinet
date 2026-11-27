import '../domain/models/history_entry.dart';
import '../domain/repositories/history_repository.dart';

class MockHistoryRepository implements HistoryRepository {
  static const List<HistoryEntry> _entries = <HistoryEntry>[
    HistoryEntry(
      time: '08:00',
      medicine: 'Cetirizine',
      strength: '10 mg',
      status: HistoryStatus.taken,
      isYesterday: false,
    ),
    HistoryEntry(
      time: '13:00',
      medicine: 'Amoxicillin',
      strength: '500 mg',
      status: HistoryStatus.due,
      isYesterday: false,
    ),
    HistoryEntry(
      time: '20:00',
      medicine: 'Vitamin D3',
      strength: '1000 IU',
      status: HistoryStatus.missed,
      isYesterday: true,
    ),
    HistoryEntry(
      time: '13:00',
      medicine: 'Amoxicillin',
      strength: '500 mg',
      status: HistoryStatus.taken,
      isYesterday: true,
    ),
    HistoryEntry(
      time: '08:00',
      medicine: 'Cetirizine',
      strength: '10 mg',
      status: HistoryStatus.taken,
      isYesterday: true,
    ),
  ];

  @override
  Future<List<HistoryEntry>> listEntries() async =>
      List<HistoryEntry>.unmodifiable(_entries);

  @override
  Future<WeeklyStats> loadWeeklyStats() async => const WeeklyStats(
    takenPercent: 90,
    missedCount: 2,
    lowStockCount: 1,
    dailyTaken: <int>[3, 3, 3, 2, 3, 3, 3],
  );
}
