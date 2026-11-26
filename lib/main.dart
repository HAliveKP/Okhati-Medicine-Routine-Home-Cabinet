import 'package:firebase_core/firebase_core.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './app.dart';
import './firebase_options.dart';
import './features/auth/data/firebase_authentication_repository.dart';
import './features/auth/presentation/viewmodels/auth_view_model.dart';
import './features/history/data/mock_history_repository.dart';
import './features/history/presentation/viewmodels/history_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ProviderScope(
      overrides: [
        authRepositoryProvider.overrideWith(
          (ref) => FirebaseAuthenticationRepository(),
        ),
        historyRepositoryProvider.overrideWith(
          (ref) => MockHistoryRepository(),
        ),
      ],
      child: const OkhatiApp(),
    ),
  );
}
