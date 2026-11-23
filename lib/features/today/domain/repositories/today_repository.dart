import '../models/dose.dart';

/// Abstract Today repository. The ViewModel depends only on this.
abstract class TodayRepository {
  Future<List<Dose>> listDoses();
  Future<void> markTaken(String doseId);
  Future<void> snooze(String doseId, Duration by);
}
