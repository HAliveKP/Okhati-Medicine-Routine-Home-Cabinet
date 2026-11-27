import '../domain/models/dose_log_request.dart';
import '../domain/repositories/dose_action_repository.dart';

/// Application-side handler shared by the notification callback and UI.
class ReminderActionHandler {
  const ReminderActionHandler(this.repository);

  final DoseActionRepository repository;

  Future<bool> handle({required String action, required String? payload}) async {
    if (payload == null || payload.isEmpty) return false;
    final DoseLogRequest request = decodeDoseRequest(payload);
    if (action == 'taken') return repository.recordTaken(request);
    if (action == 'skip') return repository.recordSkipped(request);
    return false;
  }
}

/// Payload is a URI-like, delimiter-safe representation to avoid an extra JSON
/// dependency in this prototype. Production notification payloads should be
/// versioned JSON and validated before use.
DoseLogRequest decodeDoseRequest(String payload) {
  final List<String> parts = payload.split('|');
  if (parts.length != 6) throw FormatException('Invalid reminder payload');
  return DoseLogRequest(
    medicineId: parts[0],
    scheduleId: parts[1],
    profileId: parts[2],
    scheduledAt: DateTime.parse(parts[3]),
    doseAmount: int.parse(parts[4]),
    loggedBy: parts[5],
  );
}
