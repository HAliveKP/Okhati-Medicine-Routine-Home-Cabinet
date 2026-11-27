import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_localizations/flutter_localizations.dart'
    show GlobalWidgetsLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:okhati/core/di/providers.dart';
import 'package:okhati/core/l10n/app_localizations.dart';
import 'package:okhati/core/utils/clock.dart';
import 'package:okhati/features/medicine/data/mock_medicine_repository.dart';
import 'package:okhati/features/medicine/presentation/views/medicine_details_view.dart';

void main() {
  late FakeClock clock;
  late MockMedicineRepository repository;

  setUp(() {
    clock = FakeClock(DateTime(2026, 11, 22, 10));
    repository = MockMedicineRepository.withSeed(clock, seedMedicines);
  });

  Widget harness({
    Locale locale = const Locale('en'),
    double textScale = 1.0,
  }) {
    return ProviderScope(
      overrides: <Override>[
        medicineRepositoryProvider.overrideWithValue(repository),
      ],
      child: MaterialApp(
        locale: locale,
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.linear(textScale),
            ),
            child: child ?? const SizedBox.shrink(),
          );
        },
        home: const Scaffold(
          body: MedicineDetailsView(medicineId: 'm2'),
        ),
      ),
    );
  }

  testWidgets('Details shows summary, stats, dose and shortcuts', (
    tester,
  ) async {
    await tester.pumpWidget(harness());
    await tester.pumpAndSettle();

    expect(find.text('Amoxicillin'), findsOneWidget);
    expect(find.text('Amoxicillin 500 mg'), findsOneWidget);
    expect(find.text('Capsule · Tag: Cold'), findsOneWidget);
    expect(find.text('Low stock'), findsOneWidget);
    expect(find.text('Left'), findsOneWidget);
    expect(find.text('6'), findsOneWidget);
    expect(find.text('Expires'), findsOneWidget);
    expect(find.text('Jan 2027'), findsOneWidget);
    expect(find.text('Alert at'), findsOneWidget);
    expect(find.text('1 capsule, 3 times a day'), findsOneWidget);
    expect(find.text('Condition tag'), findsOneWidget);
    expect(find.text('Reminders'), findsOneWidget);
    expect(find.text('08:00 · 13:00 · 20:00 daily'), findsOneWidget);
    expect(find.text('19 taken · 1 missed'), findsOneWidget);
    expect(find.text('Mark dose as taken'), findsOneWidget);
  });

  testWidgets('Mark taken decreases the quantity and shows a snackbar', (
    tester,
  ) async {
    await tester.pumpWidget(harness());
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('Mark dose as taken'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Mark dose as taken'));
    await tester.pumpAndSettle();

    expect(find.text('5'), findsOneWidget);
    expect(find.text('Dose marked as taken'), findsOneWidget);
  });

  testWidgets('Details survives Nepali at 150% text', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      harness(locale: const Locale('ne'), textScale: 1.5),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('बाँकी'), findsOneWidget);
    expect(find.text('म्याद सकिने'), findsOneWidget);
  });
}
