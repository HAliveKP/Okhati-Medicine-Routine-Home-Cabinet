import 'package:cloud_firestore/cloud_firestore.dart';

enum DoseStatus { taken, missed, skipped }

class DoseLog {
  final String id;
  final String profileId;
  final String medicineId;
  final String medicineName;
  final DateTime scheduledAt;
  final DoseStatus status;
  final DateTime? loggedAt;

  const DoseLog({
    required this.id,
    required this.profileId,
    required this.medicineId,
    required this.medicineName,
    required this.scheduledAt,
    required this.status,
    this.loggedAt,
  });

  factory DoseLog.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? {};
    return DoseLog(
      id: doc.id,
      profileId: data['profileId'] as String? ?? '',
      medicineId: data['medicineId'] as String? ?? '',
      medicineName: data['medicineName'] as String? ?? 'Unknown Medicine',
      scheduledAt: (data['scheduledAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      status: _parseStatus(data['status'] as String? ?? 'missed'),
      loggedAt: (data['loggedAt'] as Timestamp?)?.toDate(),
    );
  }

  factory DoseLog.fromMap(Map<String, dynamic> map, String id) {
    return DoseLog(
      id: id,
      profileId: map['profileId'] as String? ?? '',
      medicineId: map['medicineId'] as String? ?? '',
      medicineName: map['medicineName'] as String? ?? 'Unknown Medicine',
      scheduledAt: map['scheduledAt'] is Timestamp
          ? (map['scheduledAt'] as Timestamp).toDate()
          : (map['scheduledAt'] is DateTime ? map['scheduledAt'] as DateTime : DateTime.now()),
      status: _parseStatus(map['status'] as String? ?? 'missed'),
      loggedAt: map['loggedAt'] is Timestamp
          ? (map['loggedAt'] as Timestamp).toDate()
          : (map['loggedAt'] is DateTime ? map['loggedAt'] as DateTime : null),
    );
  }

  static DoseStatus _parseStatus(String statusStr) {
    switch (statusStr.toLowerCase()) {
      case 'taken':
        return DoseStatus.taken;
      case 'skipped':
        return DoseStatus.skipped;
      case 'missed':
      default:
        return DoseStatus.missed;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'profileId': profileId,
      'medicineId': medicineId,
      'medicineName': medicineName,
      'scheduledAt': Timestamp.fromDate(scheduledAt),
      'status': status.name,
      'loggedAt': loggedAt != null ? Timestamp.fromDate(loggedAt!) : null,
    };
  }
}

double calculateAdherence(List<DoseLog> logs) {
  if (logs.isEmpty) return 0.0;
  final takenCount = logs.where((log) => log.status == DoseStatus.taken).length;
  return (takenCount / logs.length) * 100;
}

List<DoseLog> filterDoseLogsByRange(List<DoseLog> logs, DateTime startDate, DateTime endDate) {
  final start = DateTime(startDate.year, startDate.month, startDate.day);
  final end = DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59);
  return logs.where((log) {
    return log.scheduledAt.isAfter(start.subtract(const Duration(seconds: 1))) &&
           log.scheduledAt.isBefore(end.add(const Duration(seconds: 1)));
  }).toList();
}
