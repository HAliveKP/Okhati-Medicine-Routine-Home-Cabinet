enum DosePeriod { morning, noon, night }

enum DoseStatus { pending, taken }

class TodayDose {
  const TodayDose({
    required this.medicineName,
    required this.strength,
    required this.time,
    required this.period,
    required this.status,
  });

  final String medicineName;
  final String strength;
  final DateTime time;
  final DosePeriod period;
  final DoseStatus status;

  factory TodayDose.fromMap(Map<String, dynamic> data) {
    final rawTime = data['scheduledAt'];
    final time = rawTime is DateTime
        ? rawTime
        : rawTime is String
            ? DateTime.tryParse(rawTime)
            : rawTime is Map && rawTime['seconds'] is int
                ? DateTime.fromMillisecondsSinceEpoch(
                    (rawTime['seconds'] as int) * 1000,
                  )
                : null;
    if (time == null) throw const FormatException('Invalid scheduledAt');

    final periodName = (data['period'] as String? ?? '').toLowerCase();
    final period = DosePeriod.values.firstWhere(
      (value) => value.name == periodName,
      orElse: () => time.hour < 11
          ? DosePeriod.morning
          : time.hour < 17
              ? DosePeriod.noon
              : DosePeriod.night,
    );

    return TodayDose(
      medicineName: data['medicineName'] as String? ?? '',
      strength: data['strength'] as String? ?? '',
      time: time,
      period: period,
      status: (data['status'] as String?)?.toLowerCase() == 'taken'
          ? DoseStatus.taken
          : DoseStatus.pending,
    );
  }
}
