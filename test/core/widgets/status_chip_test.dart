import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:okhati/core/theme/app_colors.dart';
import 'package:okhati/core/widgets/status_chip.dart';
import 'package:okhati/features/medicine/presentation/widgets/medicine_status_chip.dart';
import 'package:okhati/features/medicine/domain/models/medicine_status.dart';

import '../../helpers/pump_widget.dart';

void main() {
  testWidgets('MedicineStatusChip shows icon + label for every status', (
    tester,
  ) async {
    for (final status in MedicineStatus.values) {
      await pumpWidgetWithL10n(tester, MedicineStatusChip(status: status));
      expect(find.byType(Icon), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
    }
  });

  testWidgets('StatusChip survives 150% text and Nepali', (tester) async {
    await pumpWidgetWithL10n(
      tester,
      const MedicineStatusChip(status: MedicineStatus.lowStock),
      locale: const Locale('ne'),
      textScale: 1.5,
    );
    expect(tester.takeException(), isNull);
    expect(find.text('कम स्टक'), findsOneWidget);
  });

  testWidgets('generic StatusChip renders its presentation values', (
    tester,
  ) async {
    await pumpWidgetWithL10n(
      tester,
      const StatusChip(
        icon: Icons.check,
        label: 'Ready',
        color: AppColors.statusGood,
        backgroundColor: AppColors.statusGoodBackground,
      ),
    );
    expect(find.byIcon(Icons.check), findsOneWidget);
    expect(find.text('Ready'), findsOneWidget);
  });
}
