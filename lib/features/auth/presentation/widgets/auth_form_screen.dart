import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/spacing.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_logo.dart';
import '../viewmodels/auth_view_model.dart';
import 'auth_field.dart';

/// Layout composition for the sign-in and sign-up flows.
class AuthFormScreen extends StatelessWidget {
  const AuthFormScreen({
    super.key,
    required this.createAccount,
    required this.state,
    required this.onBack,
    required this.onNameChanged,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.onAcceptedChanged,
    required this.onPasswordVisibilityChanged,
    required this.onSubmit,
    required this.onContinueDemo,
    required this.onSwitchMode,
  });

  final bool createAccount;
  final AuthState state;
  final VoidCallback onBack;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<String> onPasswordChanged;
  final ValueChanged<bool> onAcceptedChanged;
  final VoidCallback onPasswordVisibilityChanged;
  final VoidCallback onSubmit;
  final Future<void> Function() onContinueDemo;
  final VoidCallback onSwitchMode;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: AppSizes.authMaxWidth),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.pageInset,
                AppSpacing.l,
                AppSpacing.pageInset,
                AppSpacing.xl,
              ),
              child: AuthFormContent(
                createAccount: createAccount,
                state: state,
                l10n: l10n,
                onBack: onBack,
                onNameChanged: onNameChanged,
                onEmailChanged: onEmailChanged,
                onPasswordChanged: onPasswordChanged,
                onAcceptedChanged: onAcceptedChanged,
                onPasswordVisibilityChanged: onPasswordVisibilityChanged,
                onSubmit: onSubmit,
                onContinueDemo: onContinueDemo,
                onSwitchMode: onSwitchMode,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AuthFormContent extends StatelessWidget {
  const AuthFormContent({
    super.key,
    required this.createAccount,
    required this.state,
    required this.l10n,
    required this.onBack,
    required this.onNameChanged,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.onAcceptedChanged,
    required this.onPasswordVisibilityChanged,
    required this.onSubmit,
    required this.onContinueDemo,
    required this.onSwitchMode,
  });

  final bool createAccount;
  final AuthState state;
  final AppLocalizations l10n;
  final VoidCallback onBack;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<String> onPasswordChanged;
  final ValueChanged<bool> onAcceptedChanged;
  final VoidCallback onPasswordVisibilityChanged;
  final VoidCallback onSubmit;
  final Future<void> Function() onContinueDemo;
  final VoidCallback onSwitchMode;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AuthFormHeading(
        createAccount: createAccount,
        onBack: onBack,
        title: createAccount ? l10n.signUpTitle : l10n.signInTitle,
        subtitle: createAccount
            ? l10n.authSignUpSubtitle
            : l10n.authSignInSubtitle,
      ),
      const SizedBox(height: AppSpacing.l),
      AuthFormFields(
        createAccount: createAccount,
        state: state,
        onNameChanged: onNameChanged,
        onEmailChanged: onEmailChanged,
        onPasswordChanged: onPasswordChanged,
        onAcceptedChanged: onAcceptedChanged,
        onPasswordVisibilityChanged: onPasswordVisibilityChanged,
      ),
      if (state.error) ...[
        const SizedBox(height: AppSpacing.m),
        Text(
          l10n.authInvalidForm,
          style: AppTypography.body.copyWith(color: AppColors.statusExpiring),
        ),
      ],
      const SizedBox(height: AppSpacing.l),
      AuthFormActions(
        createAccount: createAccount,
        onSubmit: onSubmit,
        onContinueDemo: onContinueDemo,
      ),
      const SizedBox(height: AppSpacing.xxl),
      AuthFormFooter(createAccount: createAccount, onSwitchMode: onSwitchMode),
    ],
  );
}

class AuthFormHeading extends StatelessWidget {
  const AuthFormHeading({
    super.key,
    required this.createAccount,
    required this.onBack,
    required this.title,
    required this.subtitle,
  });

  final bool createAccount;
  final VoidCallback onBack;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (createAccount)
        IconButton(
          onPressed: onBack,
          tooltip: AppLocalizations.of(context).commonBack,
          icon: const Icon(Icons.arrow_back),
        )
      else ...[
        AppLogo(
          semanticLabel: AppLocalizations.of(context).appTitle,
          size: AppSizes.authLogo,
        ),
        const SizedBox(height: AppSpacing.l),
      ],
      Text(title, style: AppTypography.display),
      const SizedBox(height: AppSpacing.m),
      Text(subtitle, style: AppTypography.body),
    ],
  );
}

class AuthFormFields extends StatelessWidget {
  const AuthFormFields({
    super.key,
    required this.createAccount,
    required this.state,
    required this.onNameChanged,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.onAcceptedChanged,
    required this.onPasswordVisibilityChanged,
  });

  final bool createAccount;
  final AuthState state;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<String> onPasswordChanged;
  final ValueChanged<bool> onAcceptedChanged;
  final VoidCallback onPasswordVisibilityChanged;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (createAccount) ...[
          AuthField(
            label: l10n.authFullName,
            hint: l10n.authNameHint,
            icon: Icons.person_outline,
            onChanged: onNameChanged,
          ),
          const SizedBox(height: AppSpacing.l),
        ],
        AuthField(
          label: l10n.authEmail,
          hint: l10n.authEmailHint,
          icon: Icons.mail_outline,
          keyboardType: TextInputType.emailAddress,
          onChanged: onEmailChanged,
        ),
        const SizedBox(height: AppSpacing.l),
        AuthField(
          label: l10n.authPassword,
          hint: createAccount ? l10n.authPasswordHint : '',
          icon: Icons.lock_outline,
          obscure: !state.passwordVisible,
          trailing: IconButton(
            tooltip: state.passwordVisible
                ? l10n.authHidePassword
                : l10n.authShowPassword,
            onPressed: onPasswordVisibilityChanged,
            icon: Icon(
              state.passwordVisible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
          ),
          onChanged: onPasswordChanged,
        ),
        if (createAccount) ...[
          const SizedBox(height: AppSpacing.l),
          CheckboxListTile(
            value: state.accepted,
            onChanged: (value) => onAcceptedChanged(value ?? false),
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(l10n.authPrivacyConsent, style: AppTypography.body),
          ),
        ],
      ],
    );
  }
}

class AuthFormActions extends StatelessWidget {
  const AuthFormActions({
    super.key,
    required this.createAccount,
    required this.onSubmit,
    required this.onContinueDemo,
  });

  final bool createAccount;
  final VoidCallback onSubmit;
  final Future<void> Function() onContinueDemo;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppButton(
          text: createAccount ? l10n.authCreateAccount : l10n.authSignIn,
          onPressed: onSubmit,
        ),
        if (!createAccount) ...[
          const SizedBox(height: AppSpacing.l),
          Center(child: Text(l10n.authOr, style: AppTypography.body)),
          const SizedBox(height: AppSpacing.l),
          AppButton(
            text: l10n.authContinueGoogle,
            variant: AppButtonVariant.outline,
            onPressed: onContinueDemo,
          ),
        ],
      ],
    );
  }
}

class AuthFormFooter extends StatelessWidget {
  const AuthFormFooter({
    super.key,
    required this.createAccount,
    required this.onSwitchMode,
  });

  final bool createAccount;
  final VoidCallback onSwitchMode;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: AppSpacing.s,
        children: [
          Text(
            createAccount ? l10n.authAlreadyHaveAccount : l10n.authNewToOkhati,
            style: AppTypography.body,
          ),
          TextButton(
            onPressed: onSwitchMode,
            child: Text(
              createAccount ? l10n.authSignIn : l10n.authCreateAccount,
            ),
          ),
        ],
      ),
    );
  }
}
