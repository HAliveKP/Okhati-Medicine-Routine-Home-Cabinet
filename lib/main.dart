import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okhati/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO(A, Sprint 1-2): after running `flutterfire configure`, enable:
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // TODO(C, Sprint 4): initialise local notifications + timezone here.

  runApp(const ProviderScope(child: OkhatiApp()));
}
