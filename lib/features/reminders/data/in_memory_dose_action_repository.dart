import '../domain/models/dose_log_request.dart';
import '../domain/repositories/dose_action_repository.dart';
import '../domain/stock_quantity.dart';

/// Prototype implementation of the atomic log-and-stock operation.
/// Replace with a Firestore transaction adapter when Firebase is configured.
class InMemoryDoseActionRepository implements DoseActionRepository {
  InMemoryDoseActionRepository({Map<String, int>? quantities})
    : quantities = quantities ?? <String, int>{};

  final Map<String, int> quantities;
  final Map<String, Map<String, Object?>> doseLogs =
      <String, Map<String, Object?>>{};

  @override
  Future<bool> recordTaken(DoseLogRequest request) async {
    final String key = _key(request);
    if (doseLogs.containsKey(key)) return false;
    final int current = quantities[request.medicineId] ?? 0;
    final int next = quantityAfterDose(
      currentQuantity: current,
      doseAmount: request.doseAmount,
    );
    // Both mutations happen only after all validation/computation succeeded.
    doseLogs[key] = _entry(request, 'taken');
    quantities[request.medicineId] = next;
    return true;
  }

  @override
  Future<bool> recordSkipped(DoseLogRequest request) async {
    final String key = _key(request);
    if (doseLogs.containsKey(key)) return false;
    doseLogs[key] = _entry(request, 'skipped');
    return true;
  }

  String _key(DoseLogRequest request) =>
      '${request.profileId}_${request.scheduleId}_${request.scheduledAt.toUtc().microsecondsSinceEpoch}';

  Map<String, Object?> _entry(DoseLogRequest request, String status) =>
      <String, Object?>{
        'medicineId': request.medicineId,
        'scheduleId': request.scheduleId,
        'profileId': request.profileId,
        'scheduledAt': request.scheduledAt,
        'status': status,
        'loggedAt': DateTime.now(),
        'loggedBy': request.loggedBy,
      };
}
