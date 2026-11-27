import 'package:flutter_test/flutter_test.dart';
import 'package:okhati/features/reminders/data/in_memory_dose_action_repository.dart';
import 'package:okhati/features/reminders/domain/models/dose_log_request.dart';
import 'package:okhati/features/reminders/domain/stock_quantity.dart';

void main() {
  const DoseLogRequest request = DoseLogRequest(
    medicineId: 'medicine-1',
    scheduleId: 'schedule-1',
    profileId: 'profile-1',
    scheduledAt: DateTime.utc(2026, 11, 25, 8),
    doseAmount: 2,
    loggedBy: 'profile-1',
  );

  test('stock decrease floors at zero', () {
    expect(quantityAfterDose(currentQuantity: 1, doseAmount: 2), 0);
    expect(quantityAfterDose(currentQuantity: 8, doseAmount: 2), 6);
  });

  test('duplicate scheduled dose does not append or decrease twice', () async {
    final InMemoryDoseActionRepository repository =
        InMemoryDoseActionRepository(quantities: <String, int>{'medicine-1': 5});
    expect(await repository.recordTaken(request), isTrue);
    expect(await repository.recordTaken(request), isFalse);
    expect(repository.quantities['medicine-1'], 3);
    expect(repository.doseLogs, hasLength(1));
  });
}
