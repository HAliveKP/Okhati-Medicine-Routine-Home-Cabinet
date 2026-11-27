import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:okhati/core/l10n/app_localizations.dart';
import 'package:okhati/features/reminders/data/in_memory_dose_action_repository.dart';
import 'package:okhati/features/reminders/presentation/views/reminder_action_demo.dart';

void main() {
  testWidgets('Taken action logs a dose and shows confirmation', (tester) async {
    final InMemoryDoseActionRepository repository =
        InMemoryDoseActionRepository(quantities: <String, int>{'demo-medicine': 3});
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          AppLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: ReminderActionDemo(repository: repository)),
      ),
    );
    await tester.tap(find.text('Taken'));
    await tester.pumpAndSettle();
    expect(repository.doseLogs, hasLength(1));
    expect(repository.quantities['demo-medicine'], 2);
    expect(find.text('Marked as taken'), findsOneWidget);
  });
}
