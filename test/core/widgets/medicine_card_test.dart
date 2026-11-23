import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:okhati/features/medicine/presentation/widgets/medicine_card.dart';
import 'package:okhati/features/medicine/domain/models/medicine.dart';
import 'package:okhati/features/medicine/domain/models/medicine_status.dart';

import '../../helpers/pump_widget.dart';

void main() {
  final Medicine medicine = Medicine(
    id: 'm1',
    name: 'Cetirizine',
    strength: '10 mg',
    quantity: 24,
    expiryDate: DateTime(2027, 3, 15),
    status: MedicineStatus.good,
    conditionTag: 'Cold',
  );

  testWidgets('MedicineCard shows name, subtitle, meta and status', (
    tester,
  ) async {
    await pumpWidgetWithL10n(tester, MedicineCard(medicine: medicine));

    expect(find.text('Cetirizine'), findsOneWidget);
    expect(find.text('10 mg · Cold'), findsOneWidget);
    expect(find.text('24 left · Exp 15 Mar 2027'), findsOneWidget);
    expect(find.text('Good'), findsOneWidget);
  });

  testWidgets('MedicineCard works in Nepali at 150% text', (tester) async {
    await pumpWidgetWithL10n(
      tester,
      MedicineCard(medicine: medicine),
      locale: const Locale('ne'),
      textScale: 1.5,
    );
    expect(tester.takeException(), isNull);
    expect(find.text('Cetirizine'), findsOneWidget);
  });
}
