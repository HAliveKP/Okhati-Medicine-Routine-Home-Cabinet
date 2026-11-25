/// Data required to record one scheduled dose action.
class DoseLogRequest {
  const DoseLogRequest({
    required this.medicineId,
    required this.scheduleId,
    required this.profileId,
    required this.scheduledAt,
    required this.doseAmount,
    required this.loggedBy,
  });

  final String medicineId;
  final String scheduleId;
  final String profileId;
  final DateTime scheduledAt;
  final int doseAmount;
  final String loggedBy;
}
