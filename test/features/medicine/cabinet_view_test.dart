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
import 'package:okhati/features/medicine/presentation/views/cabinet_view.dart';

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
        home: const Scaffold(body: CabinetView()),
      ),
    );
  }

  testWidgets('Cabinet shows the header, filters and medicine cards', (
    tester,
  ) async {
    await tester.pumpWidget(harness());
    await tester.pumpAndSettle();

    expect(find.text('My medicines'), findsOneWidget);
    expect(find.text('All'), findsOneWidget);
    expect(find.text('Low'), findsOneWidget);
    expect(find.text('Cetirizine'), findsOneWidget);
    expect(find.text('Amoxicillin'), findsOneWidget);
  });

  testWidgets('Low filter shows only low-stock medicines', (tester) async {
    await tester.pumpWidget(harness());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Low'));
    await tester.pumpAndSettle();

    expect(find.text('Amoxicillin'), findsOneWidget);
    expect(find.text('Iron tablets'), findsOneWidget);
    expect(find.text('Cetirizine'), findsNothing);
  });

  testWidgets('search filters by name and shows the empty state', (
    tester,
  ) async {
    await tester.pumpWidget(harness());
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'cet');
    await tester.pumpAndSettle();
    expect(find.text('Cetirizine'), findsOneWidget);
    expect(find.text('Amoxicillin'), findsNothing);

    await tester.enterText(find.byType(TextField), 'zzz');
    await tester.pumpAndSettle();
    expect(find.text('No medicines found'), findsOneWidget);
  });

  testWidgets('Cabinet survives Nepali at 150% text', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      harness(locale: const Locale('ne'), textScale: 1.5),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('मेरा औषधिहरू'), findsOneWidget);
  });
}
