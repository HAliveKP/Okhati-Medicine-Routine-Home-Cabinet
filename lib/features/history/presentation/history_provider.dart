import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okhati/features/history/data/datasources/history_remote_datasource.dart';
import 'package:okhati/features/history/data/repositories/history_repository_impl.dart';
import 'package:okhati/features/history/domain/models/dose_log.dart';
import 'package:okhati/features/history/domain/repositories/dose_history_repository.dart';

final historyRemoteDatasourceProvider = Provider<HistoryRemoteDatasource>((ref) {
  return HistoryRemoteDatasource();
});

final historyRepositoryProvider = Provider<DoseHistoryRepository>((ref) {
  return HistoryRepositoryImpl(
    datasource: ref.watch(historyRemoteDatasourceProvider),
  );
});

final activeProfileIdProvider = StateProvider<String>((ref) => 'default_profile');

class DateRangeState {
  final DateTime startDate;
  final DateTime endDate;

  DateRangeState({required this.startDate, required this.endDate});
}

final historyDateRangeProvider = StateProvider<DateRangeState>((ref) {
  final now = DateTime.now();
  final start = now.subtract(const Duration(days: 30));
  return DateRangeState(startDate: start, endDate: now);
});

final doseLogsProvider = FutureProvider.autoDispose<List<DoseLog>>((ref) async {
  final repository = ref.watch(historyRepositoryProvider);
  final profileId = ref.watch(activeProfileIdProvider);
  final dateRange = ref.watch(historyDateRangeProvider);

  return repository.getDoseLogs(profileId, dateRange.startDate, dateRange.endDate);
});
