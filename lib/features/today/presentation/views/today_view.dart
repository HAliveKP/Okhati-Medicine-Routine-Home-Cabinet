import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/di/providers.dart';
import '../viewmodels/today_view_model.dart';
import '../widgets/today_dashboard.dart';

/// Today dashboard. State and actions live in [TodayViewModel].
class TodayView extends ConsumerWidget {
  const TodayView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => TodayDashboard(
    state: ref.watch(todayViewModelProvider),
    viewModel: ref.read(todayViewModelProvider.notifier),
    settings: ref.read(appSettingsControllerProvider),
  );
}
