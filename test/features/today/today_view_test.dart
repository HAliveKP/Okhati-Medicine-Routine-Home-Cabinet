import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_localizations/flutter_localizations.dart'
    show GlobalWidgetsLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:okhati/core/di/providers.dart';
import 'package:okhati/core/l10n/app_localizations.dart';
import 'package:okhati/core/utils/clock.dart';
import 'package:okhati/core/widgets/app_button.dart';
import 'package:okhati/features/today/domain/models/dose.dart';
import 'package:okhati/features/today/domain/repositories/today_repository.dart';
import 'package:okhati/features/today/presentation/views/today_view.dart';

void main() {
  final FakeClock clock = FakeClock(DateTime(2026, 11, 22, 10));

  Widget harness({
    Locale locale = const Locale('en'),
    double textScale = 1.0,
    List<Override> overrides = const <Override>[],
  }) {
    return ProviderScope(
      overrides: <Override>[
        clockProvider.overrideWithValue(clock),
        ...overrides,
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
        home: const Scaffold(body: TodayView()),
      ),
    );
  }

  testWidgets('Today shows doses, cabinet summary and insight', (tester) async {
    await tester.pumpWidget(harness());
    await tester.pumpAndSettle();

    expect(find.text('Sita'), findsOneWidget);
    expect(find.text('Cetirizine'), findsOneWidget);
    expect(find.text('Amoxicillin'), findsOneWidget);
    expect(find.text('Vitamin D3'), findsOneWidget);
    expect(find.text('MEDICINE CABINET'), findsOneWidget);
    expect(find.text('12 medicines'), findsOneWidget);
    expect(find.textContaining('Weekly insight'), findsOneWidget);
  });

  testWidgets('Taken on the due dose removes the action row', (tester) async {
    await tester.pumpWidget(harness());
    await tester.pumpAndSettle();

    expect(find.text('Snooze'), findsOneWidget);
    await tester.tap(find.widgetWithText(AppButton, 'Taken'));
    await tester.pumpAndSettle();

    expect(find.text('Snooze'), findsNothing);
    expect(find.text('Taken'), findsNWidgets(2));
  });

  testWidgets('Today shows the empty state when nothing is scheduled', (
    tester,
  ) async {
    await tester.pumpWidget(
      harness(
        overrides: <Override>[
          todayRepositoryProvider.overrideWithValue(_EmptyTodayRepository()),
        ],
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Nothing scheduled today'), findsOneWidget);
  });

  testWidgets('Today survives Nepali at 150% text', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      harness(locale: const Locale('ne'), textScale: 1.5),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('सीता'), findsNothing);
    expect(find.text('Sita'), findsOneWidget);
    expect(find.text('आज'), findsOneWidget);
  });
}

class _EmptyTodayRepository implements TodayRepository {
  @override
  Future<List<Dose>> listDoses() async => const <Dose>[];

  @override
  Future<void> markTaken(String doseId) async {}

  @override
  Future<void> snooze(String doseId, Duration by) async {}
}
