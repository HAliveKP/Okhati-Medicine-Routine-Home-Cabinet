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

  test('updateMedicine persists changed cabinet fields', () async {
    final MedicineDetailsViewModel viewModel = MedicineDetailsViewModel(
      repository: repository,
      medicineId: 'm2',
    );
    await viewModel.load();
    final Medicine updated = viewModel.state.medicine!.copyWith(
      name: 'Amoxicillin updated',
      quantity: 12,
    );

    expect(await viewModel.updateMedicine(updated), isTrue);
    expect((await repository.getMedicine('m2'))?.name, 'Amoxicillin updated');
    expect((await repository.getMedicine('m2'))?.quantity, 12);
  });

  test('updateMedicine rejects another medicine id', () async {
    final MedicineDetailsViewModel viewModel = MedicineDetailsViewModel(
      repository: repository,
      medicineId: 'm2',
    );
    await viewModel.load();

    expect(
      await viewModel.updateMedicine(
        viewModel.state.medicine!.copyWith(id: 'm1'),
      ),
      isFalse,
    );
    expect((await repository.getMedicine('m2'))?.name, 'Amoxicillin');
  });

  test('deleteMedicine removes the record and updates the state', () async {
    final MedicineDetailsViewModel viewModel = MedicineDetailsViewModel(
      repository: repository,
      medicineId: 'm2',
    );
    await viewModel.load();

    expect(await viewModel.deleteMedicine(), isTrue);
    expect(viewModel.state.medicine, isNull);
    expect(await repository.getMedicine('m2'), isNull);
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
  Future<void> updateMedicine(Medicine medicine) async {}

  @override
  Future<void> deleteMedicine(String id) async {}

  @override
  Stream<List<Medicine>> watchMedicines() => const Stream.empty();
}
