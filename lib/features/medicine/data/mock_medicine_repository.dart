import 'dart:async';

import '../../../core/utils/clock.dart';
import '../domain/models/medicine.dart';
import '../domain/models/medicine_status.dart';
import '../domain/repositories/medicine_repository.dart';

/// In-memory mock repository. Swap for Firebase later via one provider change.
class MockMedicineRepository implements MedicineRepository {
  MockMedicineRepository(this._clock)
    : _medicines = <String, Medicine>{},
      _controller = StreamController<List<Medicine>>.broadcast();

  MockMedicineRepository.withSeed(this._clock, List<Medicine> seeds)
    : _medicines = {for (final m in seeds) m.id: m},
      _controller = StreamController<List<Medicine>>.broadcast() {
    _controller.add(_medicines.values.toList());
  }

  final Clock _clock;
  final Map<String, Medicine> _medicines;
  final StreamController<List<Medicine>> _controller;

  @override
  Future<List<Medicine>> listMedicines({String? filter}) async {
    var list = _medicines.values.toList();
    if (filter != null && filter.isNotEmpty) {
      list = list
          .where((m) => m.name.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
    list.sort((a, b) => a.name.compareTo(b.name));
    return list;
  }

  @override
  Future<Medicine?> getMedicine(String id) async => _medicines[id];

  @override
  Future<void> markTaken(String id) async {
    final m = _medicines[id];
    if (m == null || m.quantity <= 0) return;
    _medicines[id] = m.takenOne();
    _controller.add(_medicines.values.toList());
  }

  @override
  Future<void> addMedicine(Medicine medicine) async {
    _medicines[medicine.id] = medicine;
    _controller.add(_medicines.values.toList());
  }

  @override
  Stream<List<Medicine>> watchMedicines() => _controller.stream;

  /// The injected clock is available for status recalculation once the
  /// schedule feature lands.
  Clock get clock => _clock;

  void dispose() => _controller.close();
}

/// Demo details so every seed medicine opens a complete details screen.
Medicine _seed({
  required String id,
  required String name,
  required String strength,
  required int quantity,
  required DateTime expiryDate,
  required MedicineStatus status,
  String? conditionTag,
  String form = 'Tablet',
  String? doseInstruction,
  List<String> reminderTimes = const <String>['08:00', '13:00', '20:00'],
  int alertAt = 10,
  int taken = 19,
  int missed = 1,
}) {
  return Medicine(
    id: id,
    name: name,
    strength: strength,
    quantity: quantity,
    expiryDate: expiryDate,
    status: status,
    conditionTag: conditionTag,
    form: form,
    doseInstruction:
        doseInstruction ?? '1 ${form.toLowerCase()}, 3 times a day',
    alertAt: alertAt,
    reminderTimes: reminderTimes,
    takenLast7Days: taken,
    missedLast7Days: missed,
  );
}

/// Seed data for the mock cabinet (label text only — no medical advice).
///
/// 12 medicines: 8 good, 2 low stock, 1 expiring, 1 expired — matching the
/// cabinet summary in the Figma Today frame.
final List<Medicine> seedMedicines = [
  _seed(
    id: 'm1',
    name: 'Cetirizine',
    strength: '10 mg',
    quantity: 24,
    expiryDate: DateTime(2027, 3, 15),
    status: MedicineStatus.good,
    conditionTag: 'Cold',
  ),
  _seed(
    id: 'm2',
    name: 'Amoxicillin',
    strength: '500 mg',
    quantity: 6,
    expiryDate: DateTime(2027, 1, 20),
    status: MedicineStatus.lowStock,
    conditionTag: 'Cold',
    form: 'Capsule',
  ),
  _seed(
    id: 'm3',
    name: 'Vitamin D3',
    strength: '1000 IU',
    quantity: 40,
    expiryDate: DateTime(2026, 11, 30),
    status: MedicineStatus.expiring,
  ),
  _seed(
    id: 'm4',
    name: 'Cough syrup',
    strength: '100 ml',
    quantity: 0,
    expiryDate: DateTime(2026, 8, 15),
    status: MedicineStatus.expired,
    form: 'Syrup',
    doseInstruction: '5 ml, 3 times a day',
  ),
  _seed(
    id: 'm5',
    name: 'Paracetamol',
    strength: '500 mg',
    quantity: 30,
    expiryDate: DateTime(2027, 6, 10),
    status: MedicineStatus.good,
    conditionTag: 'Fever',
  ),
  _seed(
    id: 'm6',
    name: 'Metformin',
    strength: '500 mg',
    quantity: 60,
    expiryDate: DateTime(2027, 9, 1),
    status: MedicineStatus.good,
    conditionTag: 'Diabetes',
  ),
  _seed(
    id: 'm7',
    name: 'Omeprazole',
    strength: '20 mg',
    quantity: 14,
    expiryDate: DateTime(2027, 4, 12),
    status: MedicineStatus.good,
    conditionTag: 'Acidity',
  ),
  _seed(
    id: 'm8',
    name: 'Losartan',
    strength: '50 mg',
    quantity: 28,
    expiryDate: DateTime(2027, 7, 22),
    status: MedicineStatus.good,
    conditionTag: 'Blood pressure',
  ),
  _seed(
    id: 'm9',
    name: 'Salbutamol inhaler',
    strength: '100 mcg',
    quantity: 1,
    expiryDate: DateTime(2027, 2, 28),
    status: MedicineStatus.good,
    conditionTag: 'Asthma',
    form: 'Inhaler',
    doseInstruction: '2 puffs, when needed',
    reminderTimes: <String>['08:00', '20:00'],
  ),
  _seed(
    id: 'm10',
    name: 'Iron tablets',
    strength: '65 mg',
    quantity: 8,
    expiryDate: DateTime(2026, 12, 15),
    status: MedicineStatus.lowStock,
    conditionTag: 'Anaemia',
  ),
  _seed(
    id: 'm11',
    name: 'Ibuprofen',
    strength: '400 mg',
    quantity: 18,
    expiryDate: DateTime(2027, 5, 19),
    status: MedicineStatus.good,
    conditionTag: 'Pain',
  ),
  _seed(
    id: 'm12',
    name: 'Multivitamin',
    strength: '1 tablet',
    quantity: 45,
    expiryDate: DateTime(2028, 1, 10),
    status: MedicineStatus.good,
    conditionTag: 'Daily',
  ),
];
