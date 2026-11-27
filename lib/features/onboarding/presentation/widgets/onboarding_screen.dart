import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/spacing.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';

/// Presentation-only composition for the three onboarding pages.
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    super.key,
    required this.step,
    required this.title,
    required this.body,
    required this.illustration,
    required this.skipLabel,
    required this.nextLabel,
    required this.onSkip,
    required this.onNext,
  });

  final int step;
  final String title;
  final String body;
  final IconData illustration;
  final String skipLabel;
  final String nextLabel;
  final VoidCallback onSkip;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.background,
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.xxl,
          AppSpacing.s,
          AppSpacing.xxl,
          AppSpacing.l,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: onSkip,
                child: Text(
                  skipLabel,
                  style: AppTypography.title.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: _OnboardingHero(
                  illustration: illustration,
                  title: title,
                  body: body,
                ),
              ),
            ),
            _OnboardingPageIndicator(step: step),
            const SizedBox(height: AppSpacing.l),
            AppButton(text: nextLabel, onPressed: onNext),
          ],
        ),
      ),
    ),
  );
}

class _OnboardingHero extends StatelessWidget {
  const _OnboardingHero({
    required this.illustration,
    required this.title,
    required this.body,
  });

  final IconData illustration;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const SizedBox(height: AppSpacing.xl),
      _FeatureIllustration(icon: illustration),
      const SizedBox(height: AppSpacing.xl),
      Text(
        title,
        textAlign: TextAlign.center,
        style: AppTypography.headingLarge,
      ),
      const SizedBox(height: AppSpacing.l),
      Text(body, textAlign: TextAlign.center, style: AppTypography.body),
    ],
  );
}

class _FeatureIllustration extends StatelessWidget {
  const _FeatureIllustration({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) => Container(
    width: AppSizes.onboardingIllustration,
    height: AppSizes.onboardingIllustration,
    decoration: const BoxDecoration(
      color: AppColors.primaryTint,
      shape: BoxShape.circle,
    ),
    alignment: Alignment.center,
    child: Container(
      width: AppSizes.onboardingIllustrationInner,
      height: AppSizes.onboardingIllustrationInner,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Icon(
        icon,
        size: AppSizes.onboardingIllustrationIcon,
        color: AppColors.primary,
      ),
    ),
  );
}

class _OnboardingPageIndicator extends StatelessWidget {
  const _OnboardingPageIndicator({required this.step});

  final int step;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List<Widget>.generate(
      3,
      (index) => Container(
        width: index == step ? AppSpacing.xl : AppSpacing.s,
        height: AppSpacing.s,
        margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
        decoration: BoxDecoration(
          color: index == step ? AppColors.primary : AppColors.line,
          borderRadius: BorderRadius.circular(AppSizes.onboardingDotRadius),
        ),
      ),
    ),
  );
}
