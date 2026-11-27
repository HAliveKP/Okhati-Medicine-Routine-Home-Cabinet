import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:okhati/app.dart';

/// Pumps the OkhatiApp so widget tests run within Material/Riverpod scope.
Future<void> pumpApp(WidgetTester tester, {Widget? child}) async {
  await tester.pumpWidget(
    ProviderScope(child: child ?? const OkhatiApp()),
  );
}
