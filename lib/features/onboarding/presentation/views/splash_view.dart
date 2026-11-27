import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_logo.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xxl),
          child: Column(
            children: [
              const Spacer(flex: 3),
              AppLogo(semanticLabel: l10n.appTitle, size: AppSizes.splashLogo),
              const SizedBox(height: AppSpacing.l),
              Text(
                l10n.appTitle,
                style: AppTypography.display.copyWith(color: AppColors.surface),
              ),
              const SizedBox(height: AppSpacing.m),
              Text(
                l10n.splashBrandNepali,
                style: AppTypography.heading.copyWith(
                  color: AppColors.primaryTint,
                ),
              ),
              const SizedBox(height: AppSpacing.l),
              Text(
                l10n.splashTagline,
                textAlign: TextAlign.center,
                style: AppTypography.body.copyWith(
                  color: AppColors.primaryTint,
                ),
              ),
              const Spacer(flex: 4),
              AppButton(
                text: l10n.onboardingGetStarted,
                variant: AppButtonVariant.secondary,
                onPressed: () => context.go(AppRoutes.language),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
