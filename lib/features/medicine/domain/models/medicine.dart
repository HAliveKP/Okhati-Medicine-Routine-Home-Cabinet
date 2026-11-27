import './medicine_status.dart';

/// Immutable medicine model. Changes only through copyWith.
class Medicine {
  const Medicine({
    required this.id,
    required this.name,
    required this.strength,
    required this.quantity,
    required this.expiryDate,
    required this.status,
    this.conditionTag,
    this.imageAsset,
    this.form,
    this.doseInstruction,
    this.alertAt = 10,
    this.reminderTimes = const <String>[],
    this.takenLast7Days = 0,
    this.missedLast7Days = 0,
  });

  final String id;
  final String name;
  final String strength;
  final int quantity;
  final DateTime expiryDate;
  final MedicineStatus status;
  final String? conditionTag;
  final String? imageAsset;

  /// "Tablet", "Capsule", "Syrup", "Inhaler" — shown on the details screen.
  final String? form;

  /// Label text copied from the package, never generated advice.
  final String? doseInstruction;

  /// Low-stock threshold shown as "Alert at".
  final int alertAt;

  /// Reminder times in HH:mm order.
  final List<String> reminderTimes;

  /// Mock adherence numbers for the "Last 7 days" row.
  final int takenLast7Days;
  final int missedLast7Days;

  Medicine copyWith({
    String? id,
    String? name,
    String? strength,
    int? quantity,
    DateTime? expiryDate,
    MedicineStatus? status,
    String? conditionTag,
    String? imageAsset,
    String? form,
    String? doseInstruction,
    int? alertAt,
    List<String>? reminderTimes,
    int? takenLast7Days,
    int? missedLast7Days,
  }) {
    return Medicine(
      id: id ?? this.id,
      name: name ?? this.name,
      strength: strength ?? this.strength,
      quantity: quantity ?? this.quantity,
      expiryDate: expiryDate ?? this.expiryDate,
      status: status ?? this.status,
      conditionTag: conditionTag ?? this.conditionTag,
      imageAsset: imageAsset ?? this.imageAsset,
      form: form ?? this.form,
      doseInstruction: doseInstruction ?? this.doseInstruction,
      alertAt: alertAt ?? this.alertAt,
      reminderTimes: reminderTimes ?? this.reminderTimes,
      takenLast7Days: takenLast7Days ?? this.takenLast7Days,
      missedLast7Days: missedLast7Days ?? this.missedLast7Days,
    );
  }

  Medicine takenOne() => copyWith(quantity: quantity - 1);

  bool get isLow => quantity <= 10;
  bool get isExpired {
    final today = DateTime.now();
    return expiryDate.isBefore(DateTime(today.year, today.month, today.day));
  }
}
