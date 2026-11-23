import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/providers.dart';
import '../../domain/models/cabinet_filter.dart';
import '../../domain/models/medicine.dart';
import '../../domain/models/medicine_status.dart';
import '../../domain/repositories/medicine_repository.dart';

/// UI state for the Cabinet list.
class CabinetState {
  const CabinetState({
    this.isLoading = true,
    this.hasError = false,
    this.isSearching = false,
    this.query = '',
    this.filter = CabinetFilter.all,
    this.medicines = const <Medicine>[],
  });

  final bool isLoading;
  final bool hasError;
  final bool isSearching;
  final String query;
  final CabinetFilter filter;
  final List<Medicine> medicines;

  /// Medicines after applying the status filter and the search query.
  List<Medicine> get visibleMedicines {
    final String needle = query.trim().toLowerCase();
    return medicines
        .where((Medicine medicine) {
          final bool matchesFilter = switch (filter) {
            CabinetFilter.all => true,
            CabinetFilter.low => medicine.status == MedicineStatus.lowStock,
            CabinetFilter.expiring =>
              medicine.status == MedicineStatus.expiring,
            CabinetFilter.expired => medicine.status == MedicineStatus.expired,
          };
          if (!matchesFilter) return false;
          if (needle.isEmpty) return true;
          return medicine.name.toLowerCase().contains(needle) ||
              (medicine.conditionTag?.toLowerCase().contains(needle) ?? false);
        })
        .toList(growable: false);
  }

  CabinetState copyWith({
    bool? isLoading,
    bool? hasError,
    bool? isSearching,
    String? query,
    CabinetFilter? filter,
    List<Medicine>? medicines,
  }) {
    return CabinetState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      isSearching: isSearching ?? this.isSearching,
      query: query ?? this.query,
      filter: filter ?? this.filter,
      medicines: medicines ?? this.medicines,
    );
  }
}

/// Holds Cabinet state and actions. Never imports widgets.
class CabinetViewModel extends StateNotifier<CabinetState> {
  CabinetViewModel({required this.repository}) : super(const CabinetState());

  final MedicineRepository repository;

  Future<void> load() async {
    state = state.copyWith(isLoading: true, hasError: false);
    try {
      final List<Medicine> medicines = await repository.listMedicines();
      state = state.copyWith(isLoading: false, medicines: medicines);
    } catch (_) {
      state = state.copyWith(isLoading: false, hasError: true);
    }
  }

  void setFilter(CabinetFilter filter) {
    state = state.copyWith(filter: filter);
  }

  void setQuery(String query) {
    state = state.copyWith(query: query);
  }

  void toggleSearch() {
    state = state.copyWith(isSearching: !state.isSearching, query: '');
  }

  void closeSearch() {
    state = state.copyWith(isSearching: false, query: '');
  }
}

final cabinetViewModelProvider =
    StateNotifierProvider<CabinetViewModel, CabinetState>((ref) {
      final CabinetViewModel viewModel = CabinetViewModel(
        repository: ref.watch(medicineRepositoryProvider),
      );
      viewModel.load();
      return viewModel;
    });
