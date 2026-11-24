import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/providers.dart';
import '../../domain/models/medicine.dart';
import '../../domain/repositories/medicine_repository.dart';

/// UI state for one medicine's details.
class MedicineDetailsState {
  const MedicineDetailsState({
    this.isLoading = true,
    this.hasError = false,
    this.isSaving = false,
    this.medicine,
  });

  final bool isLoading;
  final bool hasError;
  final bool isSaving;
  final Medicine? medicine;

  MedicineDetailsState copyWith({
    bool? isLoading,
    bool? hasError,
    bool? isSaving,
    Medicine? medicine,
  }) {
    return MedicineDetailsState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      isSaving: isSaving ?? this.isSaving,
      medicine: medicine ?? this.medicine,
    );
  }
}

/// Holds one medicine and the mark-taken action. Never imports widgets.
class MedicineDetailsViewModel extends StateNotifier<MedicineDetailsState> {
  MedicineDetailsViewModel({required this.repository, required this.medicineId})
    : super(const MedicineDetailsState());

  final MedicineRepository repository;
  final String medicineId;

  Future<void> load() async {
    state = state.copyWith(isLoading: true, hasError: false);
    try {
      final Medicine? medicine = await repository.getMedicine(medicineId);
      state = state.copyWith(isLoading: false, medicine: medicine);
    } catch (_) {
      state = state.copyWith(isLoading: false, hasError: true);
    }
  }

  /// Decrements the quantity by one. Does nothing when no dose is left.
  Future<bool> markTaken() async {
    final Medicine? medicine = state.medicine;
    if (medicine == null || medicine.quantity <= 0 || state.isSaving) {
      return false;
    }
    state = state.copyWith(isSaving: true);
    try {
      await repository.markTaken(medicineId);
      final Medicine? updated = await repository.getMedicine(medicineId);
      state = state.copyWith(isSaving: false, medicine: updated);
      return true;
    } catch (_) {
      state = state.copyWith(isSaving: false, hasError: true);
      return false;
    }
  }
}

final medicineDetailsViewModelProvider =
    StateNotifierProvider.family<
      MedicineDetailsViewModel,
      MedicineDetailsState,
      String
    >((ref, id) {
      final MedicineDetailsViewModel viewModel = MedicineDetailsViewModel(
        repository: ref.watch(medicineRepositoryProvider),
        medicineId: id,
      );
      viewModel.load();
      return viewModel;
    });
