import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:okhati/features/dashboard/domain/today_dose.dart';
import 'package:okhati/features/dashboard/presentation/today_dashboard.dart';

void main() {
  testWidgets('shows morning noon night and dose status', (tester) async {
    await tester.pumpWidget(ProviderScope(overrides: [
      todayDosesProvider.overrideWith((ref) async => [
            TodayDose(medicineName: 'Vitamin D', strength: '1000 IU', time: DateTime(2026, 11, 26, 8), period: DosePeriod.morning, status: DoseStatus.pending),
            TodayDose(medicineName: 'Calcium', strength: '500 mg', time: DateTime(2026, 11, 26, 13), period: DosePeriod.noon, status: DoseStatus.taken),
            TodayDose(medicineName: 'Iron', strength: '18 mg', time: DateTime(2026, 11, 26, 20), period: DosePeriod.night, status: DoseStatus.pending),
          ]),
    ], child: const MaterialApp(home: TodayDashboard())));
    await tester.pumpAndSettle();
    expect(find.text('Morning'), findsOneWidget);
    expect(find.text('Noon'), findsOneWidget);
    expect(find.text('Night'), findsOneWidget);
    expect(find.text('Vitamin D'), findsOneWidget);
    expect(find.text('Calcium'), findsOneWidget);
    expect(find.text('Iron'), findsOneWidget);
    expect(find.text('Taken'), findsOneWidget);
  });

  testWidgets('shows empty and error states', (tester) async {
    await tester.pumpWidget(ProviderScope(overrides: [
      todayDosesProvider.overrideWith((ref) async => <TodayDose>[]),
    ], child: const MaterialApp(home: TodayDashboard())));
    await tester.pumpAndSettle();
    expect(find.text('No medicines scheduled for today.'), findsOneWidget);

    await tester.pumpWidget(ProviderScope(overrides: [
      todayDosesProvider.overrideWith((ref) async => throw Exception('offline')),
    ], child: const MaterialApp(home: TodayDashboard())));
    await tester.pumpAndSettle();
    expect(find.text('Could not load today’s medicines.'), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);
  });

  testWidgets('shows dashboard in Nepali', (tester) async {
    await tester.pumpWidget(ProviderScope(overrides: [
      todayDosesProvider.overrideWith((ref) async => <TodayDose>[]),
    ], child: const MaterialApp(locale: Locale('ne'), home: TodayDashboard())));
    await tester.pumpAndSettle();
    expect(find.text('आजका लागि औषधि तालिका छैन।'), findsOneWidget);
  });
}
