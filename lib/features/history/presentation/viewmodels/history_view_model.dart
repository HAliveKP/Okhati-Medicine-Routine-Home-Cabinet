import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/history_entry.dart';
import '../../domain/repositories/history_repository.dart';

enum HistoryFilter { sevenDays, thirtyDays, all, missed }

class HistoryState {
  const HistoryState({
    this.entries = const <HistoryEntry>[],
    this.weeklyStats,
    this.filter = HistoryFilter.sevenDays,
    this.isLoading = true,
  });

  final List<HistoryEntry> entries;
  final WeeklyStats? weeklyStats;
  final HistoryFilter filter;
  final bool isLoading;

  List<HistoryEntry> get visibleEntries => switch (filter) {
    HistoryFilter.missed =>
      entries
          .where((entry) => entry.status == HistoryStatus.missed)
          .toList(growable: false),
    _ => entries,
  };

  HistoryState copyWith({
    List<HistoryEntry>? entries,
    WeeklyStats? weeklyStats,
    HistoryFilter? filter,
    bool? isLoading,
  }) => HistoryState(
    entries: entries ?? this.entries,
    weeklyStats: weeklyStats ?? this.weeklyStats,
    filter: filter ?? this.filter,
    isLoading: isLoading ?? this.isLoading,
  );
}

class HistoryViewModel extends StateNotifier<HistoryState> {
  HistoryViewModel(this._repository) : super(const HistoryState());

  final HistoryRepository _repository;

  Future<void> load() async {
    final (List<HistoryEntry> entries, WeeklyStats stats) = (
      await _repository.listEntries(),
      await _repository.loadWeeklyStats(),
    );
    state = state.copyWith(
      entries: entries,
      weeklyStats: stats,
      isLoading: false,
    );
  }

  void setFilter(HistoryFilter filter) =>
      state = state.copyWith(filter: filter);
}

final historyRepositoryProvider = Provider<HistoryRepository>(
  (ref) => throw StateError('HistoryRepository must be provided by the app.'),
);

final historyViewModelProvider =
    StateNotifierProvider<HistoryViewModel, HistoryState>((ref) {
      final HistoryViewModel model = HistoryViewModel(
        ref.watch(historyRepositoryProvider),
      );
      model.load();
      return model;
    });
