import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/providers.dart';
import '../../../../core/utils/clock.dart';
import '../../domain/models/medicine.dart';
import '../../domain/models/medicine_status.dart';
import '../../domain/repositories/medicine_repository.dart';

class MedicineEntryState {
  const MedicineEntryState({
    this.name = '',
    this.strength = '',
    this.quantity = '30',
    this.expiryDate,
    this.conditionTag,
    this.reminderTimes = const <String>['08:00', '13:00', '20:00'],
    this.days = const <int>{0, 1, 2, 3, 4, 5, 6},
    this.doseAmount = 1,
    this.alarmEnabled = true,
    this.isSaving = false,
    this.error = false,
  });

  final String name;
  final String strength;
  final String quantity;
  final DateTime? expiryDate;
  final String? conditionTag;
  final List<String> reminderTimes;
  final Set<int> days;
  final int doseAmount;
  final bool alarmEnabled;
  final bool isSaving;
  final bool error;

  MedicineEntryState copyWith({
    String? name,
    String? strength,
    String? quantity,
    DateTime? expiryDate,
    String? conditionTag,
    List<String>? reminderTimes,
    Set<int>? days,
    int? doseAmount,
    bool? alarmEnabled,
    bool? isSaving,
    bool? error,
  }) => MedicineEntryState(
    name: name ?? this.name,
    strength: strength ?? this.strength,
    quantity: quantity ?? this.quantity,
    expiryDate: expiryDate ?? this.expiryDate,
    conditionTag: conditionTag ?? this.conditionTag,
    reminderTimes: reminderTimes ?? this.reminderTimes,
    days: days ?? this.days,
    doseAmount: doseAmount ?? this.doseAmount,
    alarmEnabled: alarmEnabled ?? this.alarmEnabled,
    isSaving: isSaving ?? this.isSaving,
    error: error ?? this.error,
  );
}

class MedicineEntryViewModel extends StateNotifier<MedicineEntryState> {
  MedicineEntryViewModel(this._repository, this._clock)
    : super(const MedicineEntryState());

  final MedicineRepository _repository;
  final Clock _clock;

  void setName(String value) =>
      state = state.copyWith(name: value, error: false);
  void setStrength(String value) => state = state.copyWith(strength: value);
  void setQuantity(String value) => state = state.copyWith(quantity: value);
  void setConditionTag(String? value) =>
      state = state.copyWith(conditionTag: value);

  void prepareScanDraft() => state = state.copyWith(
    name: 'Amoxicillin',
    strength: '500 mg',
    quantity: '',
    expiryDate: DateTime(2027, 1),
    error: false,
  );

  void setExpiryDate(DateTime value) =>
      state = state.copyWith(expiryDate: value);

  void toggleDay(int day) {
    final Set<int> days = Set<int>.of(state.days);
    if (!days.add(day)) days.remove(day);
    state = state.copyWith(days: days);
  }

  void setDoseAmount(int value) =>
      state = state.copyWith(doseAmount: value.clamp(1, 20));

  void setAlarmEnabled(bool value) =>
      state = state.copyWith(alarmEnabled: value);

  void addReminderTime(String time) {
    if (state.reminderTimes.length >= 6) return;
    if (state.reminderTimes.contains(time)) return;
    state = state.copyWith(
      reminderTimes: <String>[...state.reminderTimes, time]..sort(),
    );
  }

  void removeReminderTime(String time) => state = state.copyWith(
    reminderTimes: state.reminderTimes.where((item) => item != time).toList(),
  );

  void setReminderTimes(List<String> times) =>
      state = state.copyWith(reminderTimes: List<String>.of(times)..sort());

  Future<Medicine?> findPotentialDuplicate() async {
    if (state.name.trim().isEmpty) return null;
    final List<Medicine> matches =
        _repository is SimilarMedicineSearchRepository
        ? await (_repository as SimilarMedicineSearchRepository)
              .findSimilarMedicines(
                name: state.name.trim(),
                strength: state.strength.trim(),
              )
        : await _repository.listMedicines(filter: state.name.trim());
    for (final Medicine match in matches) {
      return match;
    }
    return null;
  }

  Future<bool> save() async {
    final int? quantity = int.tryParse(state.quantity.trim());
    final DateTime? expiry = state.expiryDate;
    if (state.name.trim().isEmpty ||
        state.strength.trim().isEmpty ||
        quantity == null ||
        quantity < 0 ||
        expiry == null ||
        state.isSaving) {
      state = state.copyWith(error: true);
      return false;
    }
    state = state.copyWith(isSaving: true, error: false);
    try {
      final DateTime now = _clock.now();
      final Medicine medicine = Medicine(
        id: 'medicine-${now.microsecondsSinceEpoch}',
        name: state.name.trim(),
        strength: state.strength.trim(),
        quantity: quantity,
        expiryDate: expiry,
        status: statusFor(quantity: quantity, expiryDate: expiry, now: now),
        conditionTag: state.conditionTag,
        reminderTimes: state.reminderTimes,
      );
      await _repository.addMedicine(medicine);
      state = const MedicineEntryState();
      return true;
    } catch (_) {
      state = state.copyWith(isSaving: false, error: true);
      return false;
    }
  }
}

final medicineEntryViewModelProvider =
    StateNotifierProvider<MedicineEntryViewModel, MedicineEntryState>(
      (ref) => MedicineEntryViewModel(
        ref.watch(medicineRepositoryProvider),
        ref.watch(clockProvider),
      ),
    );
