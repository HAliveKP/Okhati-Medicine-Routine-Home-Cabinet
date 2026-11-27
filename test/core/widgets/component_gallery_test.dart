import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:okhati/core/constants/app_assets.dart';
import 'package:okhati/core/l10n/app_localizations.dart';
import 'package:okhati/core/theme/app_colors.dart';
import 'package:okhati/core/widgets/app_avatar.dart';
import 'package:okhati/core/widgets/app_bottom_sheet.dart';
import 'package:okhati/core/widgets/app_confirmation_dialog.dart';
import 'package:okhati/core/widgets/app_filter_chip.dart';
import 'package:okhati/core/widgets/app_image.dart';
import 'package:okhati/core/widgets/app_profile_switcher.dart';
import 'package:okhati/core/widgets/app_search_field.dart';
import 'package:okhati/core/widgets/app_toggle.dart';
import 'package:okhati/core/widgets/app_top_bar.dart';
import 'package:okhati/core/widgets/component_gallery.dart';
import 'package:okhati/core/widgets/status_chip.dart';

import '../../helpers/pump_widget.dart';

void main() {
  testWidgets('component gallery renders at 150% in Nepali', (tester) async {
    tester.view.physicalSize = const Size(780, 1688);
    tester.view.devicePixelRatio = 2;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await pumpWidgetWithL10n(
      tester,
      const ComponentGallery(),
      locale: const Locale('ne'),
      textScale: 1.5,
    );

    expect(find.byType(ComponentGallery), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('component gallery golden uses the 390 by 844 dp export size', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(780, 1688);
    tester.view.devicePixelRatio = 2;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await pumpWidgetWithL10n(tester, const ComponentGallery());
    await expectLater(
      find.byType(ComponentGallery),
      matchesGoldenFile('goldens/component_gallery.png'),
    );
  });

  testWidgets('AppSearchField clears its controller and notifies callers', (
    tester,
  ) async {
    final TextEditingController controller = TextEditingController(text: 'x');
    bool cleared = false;
    String? changed;
    await pumpWidgetWithL10n(
      tester,
      AppSearchField(
        controller: controller,
        hint: 'Search',
        semanticLabel: 'Search medicines',
        clearLabel: 'Clear',
        onCleared: () => cleared = true,
        onChanged: (value) => changed = value,
      ),
    );

    await tester.tap(find.byTooltip('Clear'));
    await tester.pump();

    expect(controller.text, isEmpty);
    expect(cleared, isTrue);
    expect(changed, isEmpty);
    controller.dispose();
  });

  testWidgets('AppFilterChip reports selection and keeps a 48dp target', (
    tester,
  ) async {
    bool selected = false;
    await pumpWidgetWithL10n(
      tester,
      AppFilterChip(
        label: 'All',
        selected: false,
        onSelected: (value) => selected = value,
      ),
    );

    expect(
      tester.getSize(find.byType(AppFilterChip)).height,
      greaterThanOrEqualTo(48),
    );
    await tester.tap(find.text('All'));
    expect(selected, isTrue);
  });

  testWidgets('AppToggle exposes and updates its toggled state', (
    tester,
  ) async {
    bool value = false;
    await pumpWidgetWithL10n(
      tester,
      AppToggle(
        title: 'High contrast',
        semanticLabel: 'Increase contrast',
        value: value,
        onChanged: (next) => value = next,
      ),
    );

    await tester.tap(find.byType(Switch));
    expect(value, isTrue);
    expect(find.bySemanticsLabel('Increase contrast'), findsOneWidget);
  });

  testWidgets('AppProfileSwitcher selects a profile from its menu', (
    tester,
  ) async {
    AppProfileOption? selection;
    final List<AppProfileOption> profiles = [
      const AppProfileOption(id: 'one', name: 'One', initials: 'O'),
      const AppProfileOption(id: 'two', name: 'Two', initials: 'T'),
    ];
    await pumpWidgetWithL10n(
      tester,
      AppProfileSwitcher(
        profiles: profiles,
        selectedProfileId: 'one',
        semanticLabel: 'Choose profile',
        onSelected: (profile) => selection = profile,
      ),
    );

    await tester.tap(find.text('One'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Two').last);

    expect(selection?.id, 'two');
  });

  testWidgets('AppTopBar back action calls the supplied callback', (
    tester,
  ) async {
    bool backed = false;
    await pumpWidgetWithL10n(
      tester,
      AppTopBar(
        title: 'Cabinet',
        backLabel: 'Back',
        onBack: () => backed = true,
      ),
    );

    await tester.tap(find.byTooltip('Back'));
    expect(backed, isTrue);
  });

  testWidgets('AppAvatar provides a semantic label', (tester) async {
    await pumpWidgetWithL10n(
      tester,
      const AppAvatar(semanticLabel: 'Member', initials: 'M'),
    );

    expect(find.bySemanticsLabel('Member'), findsOneWidget);
  });

  testWidgets('AppImage shows a neutral fallback for the missing logo', (
    tester,
  ) async {
    await pumpWidgetWithL10n(
      tester,
      const AppImage(
        asset: AppAssets.logo,
        semanticLabel: 'Okhati',
        excludeFromSemantics: false,
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.image_not_supported_outlined), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('shared status chip displays its label', (tester) async {
    await pumpWidgetWithL10n(
      tester,
      const StatusChip(
        icon: Icons.check,
        label: 'Good',
        color: AppColors.statusGood,
        backgroundColor: AppColors.statusGoodBackground,
      ),
    );

    expect(find.text('Good'), findsOneWidget);
  });

  testWidgets('AppBottomSheet displays its child and closes', (tester) async {
    final AppLocalizations labels = await _loadLabels(tester);
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: TextButton(
              onPressed: () => AppBottomSheet.show<void>(
                context: context,
                builder: (sheetContext) => TextButton(
                  onPressed: () => Navigator.of(sheetContext).pop(),
                  child: Text(labels.commonDone),
                ),
              ),
              child: Text(labels.commonAdd),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text(labels.commonAdd));
    await tester.pumpAndSettle();
    expect(find.text(labels.commonDone), findsOneWidget);
    await tester.tap(find.text(labels.commonDone));
    await tester.pumpAndSettle();
    expect(find.text(labels.commonDone), findsNothing);
  });

  testWidgets('confirmation dialog returns the selected result', (
    tester,
  ) async {
    bool? result;
    final AppLocalizations labels = await _loadLabels(tester);
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: TextButton(
              onPressed: () async {
                result = await AppConfirmationDialog.show(
                  context: context,
                  title: labels.deleteAccountTitle,
                  body: labels.deleteAccountDesc,
                  confirmLabel: labels.commonDelete,
                  cancelLabel: labels.commonCancel,
                );
              },
              child: Text(labels.commonDelete),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text(labels.commonDelete).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text(labels.commonCancel));
    await tester.pumpAndSettle();

    expect(result, isFalse);
  });
}

Future<AppLocalizations> _loadLabels(WidgetTester tester) async {
  late AppLocalizations labels;
  await tester.pumpWidget(
    MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
        builder: (context) {
          labels = AppLocalizations.of(context);
          return const SizedBox.shrink();
        },
      ),
    ),
  );
  await tester.pump();
  return labels;
}
