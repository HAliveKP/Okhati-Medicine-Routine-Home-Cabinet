import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:okhati/app.dart';

void main() {
  testWidgets(
    'app starts onboarding and opens language selection',
    (tester) async {
      await tester.pumpWidget(const ProviderScope(child: OkhatiApp()));
      await tester.pumpAndSettle();

      expect(find.text('Okhati'), findsOneWidget);
      expect(find.text('Get started'), findsOneWidget);

      await tester.tap(find.text('Get started'));
      await tester.pumpAndSettle();

      expect(find.text('Choose your language'), findsOneWidget);
    },
  );
}
