import '../../../core/utils/clock.dart';
import '../domain/models/dose.dart';
import '../domain/repositories/today_repository.dart';

/// In-memory Today repository. Swap for Firebase later via one provider change.
class MockTodayRepository implements TodayRepository {
  MockTodayRepository(this._clock) {
    _seed();
  }

  final Clock _clock;
  final List<Dose> _doses = <Dose>[];

  void _seed() {
    final DateTime now = _clock.now();
    DateTime at(int hour) => DateTime(now.year, now.month, now.day, hour);
    _doses
      ..clear()
      ..addAll(<Dose>[
        Dose(
          id: 'd1',
          medicineId: 'm1',
          medicineName: 'Cetirizine',
          strength: '10 mg',
          doseLabel: '1 tablet',
          scheduledAt: at(8),
          status: DoseStatus.taken,
        ),
        Dose(
          id: 'd2',
          medicineId: 'm2',
          medicineName: 'Amoxicillin',
          strength: '500 mg',
          doseLabel: '1 capsule',
          scheduledAt: at(13),
          status: DoseStatus.due,
        ),
        Dose(
          id: 'd3',
          medicineId: 'm3',
          medicineName: 'Vitamin D3',
          strength: '1000 IU',
          doseLabel: '1 softgel',
          scheduledAt: at(20),
          status: DoseStatus.upcoming,
        ),
      ]);
  }

  @override
  Future<List<Dose>> listDoses() async => List<Dose>.unmodifiable(_doses);

  @override
  Future<void> markTaken(String doseId) async {
    final int index = _doses.indexWhere((d) => d.id == doseId);
    if (index < 0) return;
    _doses[index] = _doses[index].copyWith(status: DoseStatus.taken);
  }

  @override
  Future<void> snooze(String doseId, Duration by) async {
    final int index = _doses.indexWhere((d) => d.id == doseId);
    if (index < 0) return;
    final Dose dose = _doses[index];
    _doses[index] = dose.copyWith(
      scheduledAt: dose.scheduledAt.add(by),
      status: DoseStatus.due,
    );
  }
}
