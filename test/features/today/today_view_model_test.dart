import 'package:flutter_test/flutter_test.dart';
import 'package:okhati/core/utils/clock.dart';
import 'package:okhati/features/medicine/data/mock_medicine_repository.dart';
import 'package:okhati/features/medicine/domain/models/medicine.dart';
import 'package:okhati/features/today/data/mock_today_repository.dart';
import 'package:okhati/features/today/domain/models/dose.dart';
import 'package:okhati/features/today/domain/repositories/today_repository.dart';
import 'package:okhati/features/today/presentation/viewmodels/today_view_model.dart';

void main() {
  late FakeClock clock;
  late MockTodayRepository todayRepository;
  late MockMedicineRepository medicineRepository;
  late TodayViewModel viewModel;

  setUp(() {
    clock = FakeClock(DateTime(2026, 11, 22, 10));
    todayRepository = MockTodayRepository(clock);
    medicineRepository = MockMedicineRepository.withSeed(
      clock,
      seedMedicines,
    );
    viewModel = TodayViewModel(
      todayRepository: todayRepository,
      medicineRepository: medicineRepository,
    );
  });

  test('load exposes doses and cabinet stats', () async {
    await viewModel.load();

    expect(viewModel.state.isLoading, isFalse);
    expect(viewModel.state.hasError, isFalse);
    expect(viewModel.state.doses, hasLength(3));
    expect(viewModel.state.stats.total, 12);
    expect(viewModel.state.stats.good, 8);
    expect(viewModel.state.stats.lowStock, 2);
    expect(viewModel.state.stats.expiring, 1);
    expect(viewModel.state.stats.expired, 1);
  });

  test('markTaken marks the dose and decreases medicine quantity', () async {
    await viewModel.load();

    await viewModel.markTaken('d2');

    final Dose dose = viewModel.state.doses.firstWhere((d) => d.id == 'd2');
    expect(dose.status, DoseStatus.taken);

    final Medicine? medicine = await medicineRepository.getMedicine('m2');
    expect(medicine?.quantity, 5);
  });

  test('markTaken does not decrement twice for an already taken dose', () async {
    await viewModel.load();

    await viewModel.markTaken('d1');

    final Medicine? medicine = await medicineRepository.getMedicine('m1');
    expect(medicine?.quantity, 24);
  });

  test('snooze moves the dose 15 minutes later and keeps it due', () async {
    await viewModel.load();
    final DateTime before =
        viewModel.state.doses.firstWhere((d) => d.id == 'd3').scheduledAt;

    await viewModel.snooze('d3');

    final Dose dose = viewModel.state.doses.firstWhere((d) => d.id == 'd3');
    expect(dose.status, DoseStatus.due);
    expect(dose.scheduledAt, before.add(const Duration(minutes: 15)));
  });

  test('load sets hasError when the repository throws', () async {
    final TodayViewModel failing = TodayViewModel(
      todayRepository: _ThrowingTodayRepository(),
      medicineRepository: medicineRepository,
    );

    await failing.load();

    expect(failing.state.isLoading, isFalse);
    expect(failing.state.hasError, isTrue);
  });
}

class _ThrowingTodayRepository implements TodayRepository {
  @override
  Future<List<Dose>> listDoses() async => throw StateError('offline');

  @override
  Future<void> markTaken(String doseId) async {}

  @override
  Future<void> snooze(String doseId, Duration by) async {}
}
