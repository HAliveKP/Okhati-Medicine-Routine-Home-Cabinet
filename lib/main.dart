import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './app.dart';
import './features/auth/data/mock_authentication_repository.dart';
import './features/auth/presentation/viewmodels/auth_view_model.dart';
import './features/history/data/mock_history_repository.dart';
import './features/history/presentation/viewmodels/history_view_model.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        authRepositoryProvider.overrideWith(
          (ref) => MockAuthenticationRepository(),
        ),
        historyRepositoryProvider.overrideWith(
          (ref) => MockHistoryRepository(),
        ),
      ],
      child: const OkhatiApp(),
    ),
  );
}
