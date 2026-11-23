import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/router/app_routes.dart';
import '../viewmodels/onboarding_view_model.dart';
import '../widgets/onboarding_screen.dart';

class OnboardingView extends ConsumerWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final OnboardingState state = ref.watch(onboardingViewModelProvider);
    final OnboardingViewModel model = ref.read(
      onboardingViewModelProvider.notifier,
    );
    final AppLocalizations l10n = AppLocalizations.of(context);
    final List<String> titles = <String>[
      l10n.onboarding1Title,
      l10n.onboarding2Title,
      l10n.onboarding3Title,
    ];
    final List<String> bodies = <String>[
      l10n.onboarding1Body,
      l10n.onboarding2Body,
      l10n.onboarding3Body,
    ];
    final List<IconData> icons = <IconData>[
      Icons.event_available,
      Icons.medication_outlined,
      Icons.group_outlined,
    ];
    void finish() {
      model.reset();
      context.go(AppRoutes.permissions);
    }

    return OnboardingScreen(
      step: state.step,
      title: titles[state.step],
      body: bodies[state.step],
      illustration: icons[state.step],
      skipLabel: l10n.commonSkip,
      nextLabel: state.step == 2 ? l10n.onboardingGetStarted : l10n.commonNext,
      onSkip: finish,
      onNext: state.step == 2 ? finish : model.next,
    );
  }
}
