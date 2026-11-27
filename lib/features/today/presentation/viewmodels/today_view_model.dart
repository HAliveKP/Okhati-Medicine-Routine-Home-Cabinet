import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/providers.dart';
import '../../../medicine/domain/models/medicine.dart';
import '../../../medicine/domain/models/medicine_stats.dart';
import '../../../medicine/domain/repositories/medicine_repository.dart';
import '../../domain/models/dose.dart';
import '../../domain/repositories/today_repository.dart';

/// UI state for the Today dashboard.
class TodayState {
  const TodayState({
    this.isLoading = true,
    this.hasError = false,
    this.profileName = 'Sita',
    this.doses = const <Dose>[],
    this.stats = MedicineStats.empty,
  });

  final bool isLoading;
  final bool hasError;
  final String profileName;
  final List<Dose> doses;
  final MedicineStats stats;

  TodayState copyWith({
    bool? isLoading,
    bool? hasError,
    String? profileName,
    List<Dose>? doses,
    MedicineStats? stats,
  }) {
    return TodayState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      profileName: profileName ?? this.profileName,
      doses: doses ?? this.doses,
      stats: stats ?? this.stats,
    );
  }
}

/// Holds Today state and actions. Never imports widgets.
class TodayViewModel extends StateNotifier<TodayState> {
  TodayViewModel({
    required this.todayRepository,
    required this.medicineRepository,
  }) : super(const TodayState());

  final TodayRepository todayRepository;
  final MedicineRepository medicineRepository;

  Future<void> load() async {
    state = state.copyWith(isLoading: true, hasError: false);
    try {
      final List<Dose> doses = await todayRepository.listDoses();
      final List<Medicine> medicines = await medicineRepository.listMedicines();
      state = state.copyWith(
        isLoading: false,
        doses: doses,
        stats: MedicineStats.fromMedicines(medicines),
      );
    } catch (_) {
      state = state.copyWith(isLoading: false, hasError: true);
    }
  }

  Future<void> markTaken(String doseId) async {
    final Dose? dose = _doseById(doseId);
    if (dose == null) return;
    await todayRepository.markTaken(doseId);
    if (dose.status != DoseStatus.taken) {
      await medicineRepository.markTaken(dose.medicineId);
    }
    await _reload();
  }

  Future<void> snooze(String doseId) async {
    await todayRepository.snooze(doseId, const Duration(minutes: 15));
    await _reload();
  }

  Dose? _doseById(String doseId) {
    for (final Dose dose in state.doses) {
      if (dose.id == doseId) return dose;
    }
    return null;
  }

  Future<void> _reload() async {
    final List<Dose> doses = await todayRepository.listDoses();
    final List<Medicine> medicines = await medicineRepository.listMedicines();
    state = state.copyWith(
      isLoading: false,
      doses: doses,
      stats: MedicineStats.fromMedicines(medicines),
    );
  }
}

final todayViewModelProvider =
    StateNotifierProvider<TodayViewModel, TodayState>((ref) {
      final TodayViewModel viewModel = TodayViewModel(
        todayRepository: ref.watch(todayRepositoryProvider),
        medicineRepository: ref.watch(medicineRepositoryProvider),
      );
      viewModel.load();
      return viewModel;
    });
