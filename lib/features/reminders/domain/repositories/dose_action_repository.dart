import '../models/dose_log_request.dart';

/// Records an action against one scheduled dose.
abstract interface class DoseActionRepository {
  /// Returns false when this scheduled dose has already been logged.
  Future<bool> recordTaken(DoseLogRequest request);

  Future<bool> recordSkipped(DoseLogRequest request);
}
