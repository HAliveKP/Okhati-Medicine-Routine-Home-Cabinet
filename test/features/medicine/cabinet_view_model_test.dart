import 'package:flutter_test/flutter_test.dart';
import 'package:okhati/core/utils/clock.dart';
import 'package:okhati/features/medicine/data/mock_medicine_repository.dart';
import 'package:okhati/features/medicine/domain/models/cabinet_filter.dart';
import 'package:okhati/features/medicine/domain/models/medicine.dart';
import 'package:okhati/features/medicine/domain/repositories/medicine_repository.dart';
import 'package:okhati/features/medicine/presentation/viewmodels/cabinet_view_model.dart';

void main() {
  late FakeClock clock;
  late MockMedicineRepository repository;
  late CabinetViewModel viewModel;

  setUp(() {
    clock = FakeClock(DateTime(2026, 11, 22, 10));
    repository = MockMedicineRepository.withSeed(clock, seedMedicines);
    viewModel = CabinetViewModel(repository: repository);
  });

  test('load exposes every medicine', () async {
    await viewModel.load();

    expect(viewModel.state.isLoading, isFalse);
    expect(viewModel.state.hasError, isFalse);
    expect(viewModel.state.medicines, hasLength(12));
    expect(viewModel.state.visibleMedicines, hasLength(12));
  });

  test('status filters narrow the list', () async {
    await viewModel.load();

    viewModel.setFilter(CabinetFilter.low);
    expect(viewModel.state.visibleMedicines, hasLength(2));

    viewModel.setFilter(CabinetFilter.expiring);
    expect(viewModel.state.visibleMedicines, hasLength(1));

    viewModel.setFilter(CabinetFilter.expired);
    expect(viewModel.state.visibleMedicines, hasLength(1));

    viewModel.setFilter(CabinetFilter.all);
    expect(viewModel.state.visibleMedicines, hasLength(12));
  });

  test('search matches name and condition tag', () async {
    await viewModel.load();

    viewModel.setQuery('cetir');
    expect(viewModel.state.visibleMedicines.single.name, 'Cetirizine');

    viewModel.setQuery('asthma');
    expect(viewModel.state.visibleMedicines.single.name, 'Salbutamol inhaler');

    viewModel.setQuery('zzz');
    expect(viewModel.state.visibleMedicines, isEmpty);
  });

  test('search and filter combine', () async {
    await viewModel.load();

    viewModel.setFilter(CabinetFilter.low);
    viewModel.setQuery('iron');
    expect(viewModel.state.visibleMedicines.single.name, 'Iron tablets');

    viewModel.setQuery('cet');
    expect(viewModel.state.visibleMedicines, isEmpty);
  });

  test('toggleSearch clears the query', () async {
    await viewModel.load();
    viewModel.setQuery('cet');

    viewModel.toggleSearch();

    expect(viewModel.state.isSearching, isTrue);
    expect(viewModel.state.query, isEmpty);
  });

  test('load sets hasError when the repository throws', () async {
    final CabinetViewModel failing =
        CabinetViewModel(repository: _ThrowingMedicineRepository());

    await failing.load();

    expect(failing.state.hasError, isTrue);
  });
}

class _ThrowingMedicineRepository implements MedicineRepository {
  @override
  Future<List<Medicine>> listMedicines({String? filter}) async =>
      throw StateError('offline');

  @override
  Future<Medicine?> getMedicine(String id) async => null;

  @override
  Future<void> markTaken(String id) async {}

  @override
  Future<void> addMedicine(Medicine medicine) async {}

  @override
  Stream<List<Medicine>> watchMedicines() => const Stream.empty();
}
