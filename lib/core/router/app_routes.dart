import 'package:material_ui/material_ui.dart';

/// Route names used across the app. Keep these in sync with the router.
abstract class AppRoutes {
  AppRoutes._();
  static const String splash = '/';
  static const String language = '/language';
  static const String onboarding = '/onboarding';
  static const String permissions = '/permissions';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String today = '/today';
  static const String cabinet = '/cabinet';
  static const String medicineDetails = '/medicine/:id';
  static const String addMedicine = '/add-medicine';
  static const String conditionTags = '/condition-tags';
  static const String scan = '/scan';
  static const String scanConfirm = '/scan-confirm';
  static const String scheduleEditor = '/schedule-editor';
  static const String lockScreenNotification = '/lock-screen-notification';
  static const String alarmReminder = '/alarm-reminder';
  static const String snooze = '/snooze';
  static const String history = '/history';
  static const String weeklyInsight = '/weekly-insight';
  static const String family = '/family';
  static const String invite = '/invite';
  static const String joinFamily = '/join-family';
  static const String memberView = '/member/:id';
  static const String manageMembers = '/manage-members';
  static const String familyAlerts = '/family-alerts';
  static const String mediGuide = '/medi-guide';
  static const String more = '/more';
  static const String settings = '/settings';
  static const String notificationSettings = '/notification-settings';
  static const String privacyAndData = '/privacy-and-data';
  static const String deleteAccount = '/delete-account';
  static const String componentGallery = '/debug/components';
  static const String componentGalleryName = 'componentGallery';

  static String medicine(String id) => '/medicine/$id';
  static String member(String id) => '/member/$id';
  static String snoozeAt(int minutes) => '/snooze?minutes=$minutes';
}

/// Placeholder views used while the shell is being built. Each real screen
/// replaces its placeholder in Phase 2.
class PlaceholderView extends StatelessWidget {
  const PlaceholderView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title — coming soon')),
    );
  }
}
