import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:okhati/core/di/providers.dart';
import 'package:okhati/features/auth/data/mock_authentication_repository.dart';
import 'package:okhati/features/auth/presentation/viewmodels/auth_view_model.dart';
import 'package:okhati/core/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

void main() {
  test(
    'US01 email sign-in accepts valid credentials through repository',
    () async {
      final repository = MockAuthenticationRepository();
      final container = ProviderContainer(
        overrides: [authRepositoryProvider.overrideWithValue(repository)],
      );
      addTearDown(container.dispose);
      final model = container.read(authViewModelProvider.notifier);
      model.setEmail('person@example.com');
      model.setPassword('valid-pass-123');

      expect(await model.submit(createAccount: false), isTrue);
      expect(container.read(authViewModelProvider).error, isFalse);
    },
  );

  test('US01 rejects malformed email and short password', () async {
    final container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(
          MockAuthenticationRepository(),
        ),
      ],
    );
    addTearDown(container.dispose);
    final model = container.read(authViewModelProvider.notifier);
    model.setEmail('not-an-email');
    model.setPassword('short');

    expect(await model.submit(createAccount: false), isFalse);
    expect(container.read(authViewModelProvider).error, isTrue);
  });

  test('US02 English and Nepali localizations expose core language labels', () {
    expect(AppLocalizations.supportedLocales, contains(const Locale('en')));
    expect(AppLocalizations.supportedLocales, contains(const Locale('ne')));
  });
}
