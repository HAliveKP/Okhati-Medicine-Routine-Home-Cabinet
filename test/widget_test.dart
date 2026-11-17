import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:okhati/app.dart';

void main() {
  testWidgets('app shows four tabs', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: OkhatiApp()));
    await tester.pumpAndSettle();
    expect(find.text('Today'), findsWidgets);
    expect(find.text('Cabinet'), findsOneWidget);
    expect(find.text('Family'), findsOneWidget);
    expect(find.text('More'), findsOneWidget);
  });
}
