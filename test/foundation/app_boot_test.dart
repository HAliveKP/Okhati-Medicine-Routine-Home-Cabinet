import 'package:flutter_test/flutter_test.dart';

import '../helpers/pump_app.dart';

void main() {
  testWidgets('app boots and shows the splash screen', (tester) async {
    await pumpApp(tester);
    await tester.pumpAndSettle();

    expect(find.text('Okhati'), findsOneWidget);
    expect(find.text('Get started'), findsOneWidget);
  });
}
