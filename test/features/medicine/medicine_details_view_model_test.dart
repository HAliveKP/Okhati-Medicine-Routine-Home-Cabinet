import 'package:flutter_test/flutter_test.dart';
import 'package:okhati/core/utils/clock.dart';
import 'package:okhati/features/medicine/data/mock_medicine_repository.dart';
import 'package:okhati/features/medicine/domain/models/medicine.dart';
import 'package:okhati/features/medicine/domain/repositories/medicine_repository.dart';
import 'package:okhati/features/medicine/presentation/viewmodels/medicine_details_view_model.dart';

void main() {
  late FakeClock clock;
  late MockMedicineRepository repository;

  setUp(() {
    clock = FakeClock(DateTime(2026, 11, 22, 10));
    repository = MockMedicineRepository.withSeed(clock, seedMedicines);
  });

  test('load exposes the medicine', () async {
    final MedicineDetailsViewModel viewModel = MedicineDetailsViewModel(
      repository: repository,
      medicineId: 'm2',
    );

    await viewModel.load();

    expect(viewModel.state.isLoading, isFalse);
    expect(viewModel.state.medicine?.name, 'Amoxicillin');
    expect(viewModel.state.medicine?.quantity, 6);
  });

  test('load of an unknown id finishes without a medicine', () async {
    final MedicineDetailsViewModel viewModel = MedicineDetailsViewModel(
      repository: repository,
      medicineId: 'missing',
    );

    await viewModel.load();

    expect(viewModel.state.isLoading, isFalse);
    expect(viewModel.state.medicine, isNull);
  });

  test('markTaken decreases the quantity once per dose', () async {
    final MedicineDetailsViewModel viewModel = MedicineDetailsViewModel(
      repository: repository,
      medicineId: 'm2',
    );
    await viewModel.load();

    expect(await viewModel.markTaken(), isTrue);
    expect(viewModel.state.medicine?.quantity, 5);

    expect(await viewModel.markTaken(), isTrue);
    expect(viewModel.state.medicine?.quantity, 4);
  });

  test('markTaken stops at zero', () async {
    final MedicineDetailsViewModel viewModel = MedicineDetailsViewModel(
      repository: repository,
      medicineId: 'm4',
    );
    await viewModel.load();

    expect(await viewModel.markTaken(), isFalse);
    expect(viewModel.state.medicine?.quantity, 0);
  });

  test('load sets hasError when the repository throws', () async {
    final MedicineDetailsViewModel viewModel = MedicineDetailsViewModel(
      repository: _ThrowingMedicineRepository(),
      medicineId: 'm1',
    );

    await viewModel.load();

    expect(viewModel.state.hasError, isTrue);
  });
}

class _ThrowingMedicineRepository implements MedicineRepository {
  @override
  Future<List<Medicine>> listMedicines({String? filter}) async =>
      throw StateError('offline');

  @override
  Future<Medicine?> getMedicine(String id) async => throw StateError('offline');

  @override
  Future<void> markTaken(String id) async {}

  @override
  Future<void> addMedicine(Medicine medicine) async {}

  @override
  Stream<List<Medicine>> watchMedicines() => const Stream.empty();
}
