import 'package:okhati/features/history/data/datasources/history_remote_datasource.dart';
import 'package:okhati/features/history/domain/models/dose_log.dart';
import 'package:okhati/features/history/domain/repositories/dose_history_repository.dart';

class HistoryRepositoryImpl implements DoseHistoryRepository {
  final HistoryRemoteDatasource datasource;

  HistoryRepositoryImpl({required this.datasource});

  @override
  Future<List<DoseLog>> getDoseLogs(String profileId, DateTime startDate, DateTime endDate) {
    return datasource.getDoseLogs(profileId, startDate, endDate);
  }
}
