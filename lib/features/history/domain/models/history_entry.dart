enum HistoryStatus { taken, due, missed, skipped }

class HistoryEntry {
  const HistoryEntry({
    required this.time,
    required this.medicine,
    required this.strength,
    required this.status,
    required this.isYesterday,
  });

  final String time;
  final String medicine;
  final String strength;
  final HistoryStatus status;
  final bool isYesterday;
}

class WeeklyStats {
  const WeeklyStats({
    required this.takenPercent,
    required this.missedCount,
    required this.lowStockCount,
    required this.dailyTaken,
  });

  final int takenPercent;
  final int missedCount;
  final int lowStockCount;
  final List<int> dailyTaken;
}
