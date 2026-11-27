import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/router/app_routes.dart';
import '../viewmodels/auth_view_model.dart';
import '../widgets/auth_form_screen.dart';

/// Sign-in and sign-up view. State and validation live in [AuthViewModel].
class AuthView extends ConsumerWidget {
  const AuthView({super.key, required this.createAccount});

  final bool createAccount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthState state = ref.watch(authViewModelProvider);
    final AuthViewModel model = ref.read(authViewModelProvider.notifier);
    return AuthFormScreen(
      createAccount: createAccount,
      state: state,
      onBack: () => context.go(AppRoutes.signIn),
      onNameChanged: model.setName,
      onEmailChanged: model.setEmail,
      onPasswordChanged: model.setPassword,
      onAcceptedChanged: model.setAccepted,
      onPasswordVisibilityChanged: model.togglePasswordVisibility,
      onSubmit: () async {
        final bool succeeded = await model.submit(createAccount: createAccount);
        if (succeeded && context.mounted) context.go(AppRoutes.today);
      },
      onContinueDemo: () async {
        if (await model.signInWithGoogle() && context.mounted) {
          context.go(AppRoutes.today);
        }
      },
      onSwitchMode: () =>
          context.go(createAccount ? AppRoutes.signIn : AppRoutes.signUp),
    );
  }
}
