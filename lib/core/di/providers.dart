import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import '../utils/clock.dart';
import '../../features/medicine/data/mock_medicine_repository.dart';
import '../../features/medicine/domain/repositories/medicine_repository.dart';
import '../../features/today/data/mock_today_repository.dart';
import '../../features/today/domain/repositories/today_repository.dart';

/// Provides the app clock. Tests override with [FakeClock] via
/// `container.overrides` so status logic stays deterministic.
final clockProvider = Provider<Clock>((ref) => const RealClock());

/// App language. Settings writes to this provider.
final localeProvider = StateProvider<Locale>((ref) => const Locale('en'));

/// Text scale factor (1.0 = normal, 1.5 = 150%). Settings writes to this.
final textScaleProvider = StateProvider<double>((ref) => 1.0);

/// App-wide settings actions. Views call these; no view writes provider state.
class AppSettingsController {
  AppSettingsController(this._ref);

  final Ref _ref;

  void setLocale(Locale locale) => _ref.read(localeProvider.notifier).state = locale;

  void toggleLocale() {
    final Locale current = _ref.read(localeProvider);
    setLocale(current.languageCode == 'ne' ? const Locale('en') : const Locale('ne'));
  }

  void setTextScale(double scale) =>
      _ref.read(textScaleProvider.notifier).state = scale;
}

final appSettingsControllerProvider = Provider<AppSettingsController>(
  (ref) => AppSettingsController(ref),
);

/// Medicine repository binding. Swap the mock for a Firebase implementation
/// here and every ViewModel keeps working.
final medicineRepositoryProvider = Provider<MedicineRepository>((ref) {
  final MockMedicineRepository repository = MockMedicineRepository.withSeed(
    ref.watch(clockProvider),
    seedMedicines,
  );
  ref.onDispose(repository.dispose);
  return repository;
});

/// Today repository binding.
final todayRepositoryProvider = Provider<TodayRepository>((ref) {
  return MockTodayRepository(ref.watch(clockProvider));
});
