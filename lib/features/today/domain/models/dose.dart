import '../../../../core/utils/date_format.dart';

/// Where a dose sits in today's routine.
enum DoseStatus { taken, due, upcoming }

/// A single scheduled dose. Immutable; changes only through copyWith.
class Dose {
  const Dose({
    required this.id,
    required this.medicineId,
    required this.medicineName,
    required this.strength,
    required this.doseLabel,
    required this.scheduledAt,
    required this.status,
  });

  final String id;
  final String medicineId;
  final String medicineName;
  final String strength;
  final String doseLabel;
  final DateTime scheduledAt;
  final DoseStatus status;

  String get timeLabel => hhmm(scheduledAt);

  Dose copyWith({
    String? id,
    String? medicineId,
    String? medicineName,
    String? strength,
    String? doseLabel,
    DateTime? scheduledAt,
    DoseStatus? status,
  }) {
    return Dose(
      id: id ?? this.id,
      medicineId: medicineId ?? this.medicineId,
      medicineName: medicineName ?? this.medicineName,
      strength: strength ?? this.strength,
      doseLabel: doseLabel ?? this.doseLabel,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      status: status ?? this.status,
    );
  }
}
