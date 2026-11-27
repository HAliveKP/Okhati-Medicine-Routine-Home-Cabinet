import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:okhati/core/widgets/app_button.dart';

import '../../helpers/pump_widget.dart';

void main() {
  testWidgets('AppButton is 56dp tall and calls onPressed', (tester) async {
    var taps = 0;
    await pumpWidgetWithL10n(
      tester,
      AppButton(text: 'Save', onPressed: () => taps++),
    );

    final Size size = tester.getSize(find.byType(AppButton));
    expect(size.height, 56);
    await tester.tap(find.text('Save'));
    expect(taps, 1);
  });

  testWidgets('AppButton variants render their labels', (tester) async {
    for (final variant in AppButtonVariant.values) {
      await pumpWidgetWithL10n(
        tester,
        AppButton(text: 'Button', onPressed: () {}, variant: variant),
      );
      expect(find.text('Button'), findsOneWidget);
    }
  });
}
