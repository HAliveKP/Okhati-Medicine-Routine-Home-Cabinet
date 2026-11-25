import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:okhati/features/history/domain/models/dose_log.dart';
import 'package:okhati/features/history/domain/repositories/history_repository.dart';
import 'package:okhati/features/history/presentation/history_provider.dart';
import 'package:okhati/features/history/presentation/history_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:okhati/l10n/app_localizations.dart';

class MockHistoryRepository implements HistoryRepository {
  @override
  Future<List<DoseLog>> getDoseLogs(String profileId, DateTime startDate, DateTime endDate) async {
    return [
      DoseLog(
        id: '1',
        profileId: profileId,
        medicineId: 'm1',
        medicineName: 'Paracetamol',
        scheduledAt: DateTime.now().subtract(const Duration(days: 2)),
        status: DoseStatus.taken,
      ),
    ];
  }
}

void main() {
  testWidgets('History screen shows export button and opens date range picker on tap', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          historyRepositoryProvider.overrideWithValue(MockHistoryRepository()),
        ],
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: const HistoryScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Verify Export PDF action button exists
    expect(find.byIcon(Icons.picture_as_pdf), findsOneWidget);

    // Tap Export PDF button
    await tester.tap(find.byIcon(Icons.picture_as_pdf));
    await tester.pumpAndSettle();

    // Verify Date Range Picker dialog opens
    expect(find.byType(DateRangePickerDialog), findsOneWidget);
  });
}
