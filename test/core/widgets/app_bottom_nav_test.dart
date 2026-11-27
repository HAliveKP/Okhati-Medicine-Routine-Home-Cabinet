import 'package:flutter_test/flutter_test.dart';
import 'package:okhati/core/widgets/app_bottom_nav.dart';

import '../../helpers/pump_widget.dart';

void main() {
  testWidgets('AppBottomNav shows four tabs and reports taps', (tester) async {
    int? tapped;
    await pumpWidgetWithL10n(
      tester,
      AppBottomNav(currentIndex: 0, onTabTapped: (i) => tapped = i),
    );

    expect(find.text('Today'), findsOneWidget);
    expect(find.text('Cabinet'), findsOneWidget);
    expect(find.text('Family'), findsOneWidget);
    expect(find.text('More'), findsOneWidget);

    await tester.tap(find.text('Cabinet'));
    expect(tapped, 1);
  });

  testWidgets('AppBottomNav is 84dp tall', (tester) async {
    await pumpWidgetWithL10n(
      tester,
      AppBottomNav(currentIndex: 0, onTabTapped: (_) {}),
    );
    expect(tester.getSize(find.byType(AppBottomNav)).height, 84);
  });
}
