import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../features/medicine/presentation/views/cabinet_view.dart';
import '../../features/medicine/presentation/views/add_medicine_view.dart';
import '../../features/medicine/presentation/views/condition_tags_view.dart';
import '../../features/medicine/presentation/views/medicine_details_view.dart';
import '../../features/medicine/presentation/views/scan_confirm_view.dart';
import '../../features/medicine/presentation/views/scan_view.dart';
import '../../features/medicine/presentation/views/schedule_editor_view.dart';
import '../../features/auth/presentation/views/auth_view.dart';
import '../../features/onboarding/presentation/views/language_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/onboarding/presentation/views/permissions_view.dart';
import '../../features/onboarding/presentation/views/splash_view.dart';
import '../../features/today/presentation/views/today_view.dart';
import '../../features/history/presentation/views/history_view.dart';
import '../../features/history/presentation/views/weekly_insight_view.dart';
import '../../features/reminders/presentation/views/alarm_reminder_view.dart';
import '../../features/reminders/presentation/views/lock_screen_notification_view.dart';
import '../../features/reminders/presentation/views/snooze_view.dart';
import '../../features/settings/presentation/views/more_view.dart';
import '../../features/settings/presentation/views/settings_view.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/component_gallery.dart';
import './app_routes.dart';

/// The router is exposed through Riverpod so tests can override it and
/// `MaterialApp.router` can rebuild when the configuration changes.
final appRouterProvider = Provider<GoRouter>((ref) => AppRouter.router);

/// go_router configuration. Named routes map 1:1 to Figma prototype flows.
///
/// Navigation happens only through these named routes — views never call
/// Navigator.push directly.
class AppRouter {
  AppRouter._();
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRoutes.language,
        builder: (context, state) => const LanguageView(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: AppRoutes.permissions,
        builder: (context, state) => const PermissionsView(),
      ),
      GoRoute(
        path: AppRoutes.signIn,
        builder: (context, state) => const AuthView(createAccount: false),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (context, state) => const AuthView(createAccount: true),
      ),
      if (kDebugMode)
        GoRoute(
          path: AppRoutes.componentGallery,
          name: AppRoutes.componentGalleryName,
          builder: (context, state) => const ComponentGallery(),
        ),
      // Shell with 4-tab bottom navigation (Today, Cabinet, Family, More).
      ShellRoute(
        builder: (context, state, child) => _Shell(child: child),
        routes: <RouteBase>[
          GoRoute(
            path: AppRoutes.today,
            builder: (context, state) => const TodayView(),
          ),
          GoRoute(
            path: AppRoutes.cabinet,
            builder: (context, state) => const CabinetView(),
          ),
          GoRoute(
            path: AppRoutes.history,
            builder: (context, state) => const HistoryView(),
          ),
          GoRoute(
            path: AppRoutes.medicineDetails,
            builder: (context, state) => MedicineDetailsView(
              medicineId: state.pathParameters['id'] ?? '',
            ),
          ),
          GoRoute(
            path: AppRoutes.family,
            builder: (context, state) => const PlaceholderView(title: 'Family'),
          ),
          GoRoute(
            path: AppRoutes.more,
            builder: (context, state) => const MoreView(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.addMedicine,
        builder: (context, state) => const AddMedicineView(),
      ),
      GoRoute(
        path: AppRoutes.conditionTags,
        builder: (context, state) => const ConditionTagsView(),
      ),
      GoRoute(
        path: AppRoutes.scan,
        builder: (context, state) => const ScanView(),
      ),
      GoRoute(
        path: AppRoutes.scanConfirm,
        builder: (context, state) => const ScanConfirmView(),
      ),
      GoRoute(
        path: AppRoutes.scheduleEditor,
        builder: (context, state) => const ScheduleEditorView(),
      ),
      GoRoute(
        path: AppRoutes.lockScreenNotification,
        builder: (context, state) => const LockScreenNotificationView(),
      ),
      GoRoute(
        path: AppRoutes.alarmReminder,
        builder: (context, state) => const AlarmReminderView(),
      ),
      GoRoute(
        path: AppRoutes.snooze,
        builder: (context, state) => const SnoozeView(),
      ),
      GoRoute(
        path: AppRoutes.weeklyInsight,
        builder: (context, state) => const WeeklyInsightView(),
      ),
      GoRoute(
        path: AppRoutes.invite,
        builder: (context, state) => const PlaceholderView(title: 'Invite'),
      ),
      GoRoute(
        path: AppRoutes.joinFamily,
        builder: (context, state) =>
            const PlaceholderView(title: 'Join family'),
      ),
      GoRoute(
        path: AppRoutes.memberView,
        builder: (context, state) =>
            const PlaceholderView(title: 'Member view'),
      ),
      GoRoute(
        path: AppRoutes.manageMembers,
        builder: (context, state) =>
            const PlaceholderView(title: 'Manage members'),
      ),
      GoRoute(
        path: AppRoutes.familyAlerts,
        builder: (context, state) =>
            const PlaceholderView(title: 'Family alerts'),
      ),
      GoRoute(
        path: AppRoutes.mediGuide,
        builder: (context, state) => const PlaceholderView(title: 'MediGuide'),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: AppRoutes.notificationSettings,
        builder: (context, state) =>
            const PlaceholderView(title: 'Notification settings'),
      ),
      GoRoute(
        path: AppRoutes.privacyAndData,
        builder: (context, state) =>
            const PlaceholderView(title: 'Privacy and data'),
      ),
      GoRoute(
        path: AppRoutes.deleteAccount,
        builder: (context, state) =>
            const PlaceholderView(title: 'Delete account'),
      ),
    ],
  );
}

/// 4-tab shell: Today, Cabinet, Family, More. Floating + for Add medicine.
class _Shell extends ConsumerWidget {
  const _Shell({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String location = GoRouterState.of(context).uri.path;
    const List<String> tabs = <String>[
      AppRoutes.today,
      AppRoutes.cabinet,
      AppRoutes.family,
      AppRoutes.more,
    ];
    final int currentIndex = tabs.indexWhere(
      (t) => location == t || location.startsWith('$t/'),
    );
    final int activeIndex = location.startsWith('/medicine')
        ? 1
        : currentIndex < 0
        ? 0
        : currentIndex;
    return Scaffold(
      body: child,
      bottomNavigationBar: AppBottomNav(
        currentIndex: activeIndex,
        onTabTapped: (i) => context.go(tabs[i]),
      ),
    );
  }
}
