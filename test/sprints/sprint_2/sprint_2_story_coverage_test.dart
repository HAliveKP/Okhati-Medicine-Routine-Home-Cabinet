import 'package:flutter_test/flutter_test.dart';
import 'package:okhati/core/utils/clock.dart';
import 'package:okhati/features/medicine/data/mock_medicine_repository.dart';
import 'package:okhati/features/medicine/domain/models/medicine.dart';
import 'package:okhati/features/medicine/presentation/viewmodels/medicine_details_view_model.dart';
import 'package:okhati/features/medicine/presentation/viewmodels/medicine_entry_view_model.dart';
import 'package:okhati/features/today/data/mock_today_repository.dart';
import 'package:okhati/features/today/presentation/viewmodels/today_view_model.dart';

void main() {
  late FakeClock clock;
  late MockMedicineRepository medicines;

  setUp(() {
    clock = FakeClock(DateTime(2026, 11, 22, 10));
    medicines = MockMedicineRepository.withSeed(clock, seedMedicines);
  });

  test('US07 Today loads dose timeline and cabinet summary', () async {
    final model = TodayViewModel(
      todayRepository: MockTodayRepository(clock),
      medicineRepository: medicines,
    );

    await model.load();

    expect(model.state.doses, hasLength(3));
    expect(model.state.stats.total, 12);
  });

  test('US50 Taken action logs dose and decrements medicine once', () async {
    final model = TodayViewModel(
      todayRepository: MockTodayRepository(clock),
      medicineRepository: medicines,
    );
    await model.load();

    await model.markTaken('d2');

    expect(model.state.doses[1].status.name, 'taken');
    expect((await medicines.getMedicine('m2'))?.quantity, 5);
  });

  test(
    'US03 add medicine rejects missing required fields and accepts valid entry',
    () async {
      final model = MedicineEntryViewModel(medicines, clock);
      expect(await model.save(), isFalse);
      model.setName('Custom medicine');
      model.setStrength('10 mg');
      model.setQuantity('5');
      model.setExpiryDate(DateTime(2027, 2, 1));

      expect(await model.save(), isTrue);
      expect(
        (await medicines.listMedicines()).any(
          (item) => item.name == 'Custom medicine',
        ),
        isTrue,
      );
    },
  );

  test(
    'US34 exact and case-insensitive name/strength duplicates are found',
    () async {
      final model = MedicineEntryViewModel(medicines, clock);
      model.setName('cetirizine');
      model.setStrength('10 mg');

      final Medicine? match = await model.findPotentialDuplicate();

      expect(match?.id, 'm1');
    },
  );

  test('US24 edit and delete update cabinet record state', () async {
    final model = MedicineDetailsViewModel(
      repository: medicines,
      medicineId: 'm2',
    );
    await model.load();
    final Medicine changed = model.state.medicine!.copyWith(quantity: 9);

    expect(await model.updateMedicine(changed), isTrue);
    expect((await medicines.getMedicine('m2'))?.quantity, 9);
    expect(await model.deleteMedicine(), isTrue);
    expect(await medicines.getMedicine('m2'), isNull);
  });
}
