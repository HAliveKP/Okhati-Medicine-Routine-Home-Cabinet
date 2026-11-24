import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingState {
  const OnboardingState({this.step = 0});
  final int step;

  OnboardingState copyWith({int? step}) =>
      OnboardingState(step: step ?? this.step);
}

class OnboardingViewModel extends StateNotifier<OnboardingState> {
  OnboardingViewModel() : super(const OnboardingState());

  void next() => state = state.copyWith(step: (state.step + 1).clamp(0, 2));
  void reset() => state = const OnboardingState();
}

final onboardingViewModelProvider =
    StateNotifierProvider<OnboardingViewModel, OnboardingState>(
      (ref) => OnboardingViewModel(),
    );
