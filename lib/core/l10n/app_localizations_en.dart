// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Okhati';

  @override
  String get todayTitle => 'Today';

  @override
  String get todayGreeting => 'Good morning';

  @override
  String get todayCabinetLabel => 'MEDICINE CABINET';

  @override
  String todayCabinetCount(int count) {
    return '$count medicines';
  }

  @override
  String get todayWeeklyInsight => 'Weekly insight · AI';

  @override
  String get todayAdd => 'Add';

  @override
  String get todayScan => 'Scan';

  @override
  String get todayHistory => 'History';

  @override
  String get todayMediGuide => 'MediGuide';

  @override
  String get cabinetTitle => 'My medicines';

  @override
  String get cabinetSearch => 'Search';

  @override
  String get cabinetFilterAll => 'All';

  @override
  String get cabinetFilterLow => 'Low';

  @override
  String get cabinetFilterExpiring => 'Expiring';

  @override
  String get cabinetFilterExpired => 'Expired';

  @override
  String get cabinetEmptyTitle => 'No medicines found';

  @override
  String get cabinetEmptyBody =>
      'Check the spelling, or add this medicine to your cabinet.';

  @override
  String get cabinetAdd => 'Add medicine';

  @override
  String get cabinetBack => 'Back to cabinet';

  @override
  String get medicineDetailsEdit => 'Edit';

  @override
  String get medicineDetailsDoseOnLabel => 'DOSE ON LABEL';

  @override
  String get medicineDetailsNotDiagnosis => 'Not a diagnosis';

  @override
  String get medicineDetailsLast7Days => 'Last 7 days';

  @override
  String get medicineDetailsMarkTaken => 'Mark dose as taken';

  @override
  String get addMedicineTitle => 'Add medicine';

  @override
  String get addMedicineMedicineName => 'Medicine name';

  @override
  String get addMedicineStrength => 'Strength';

  @override
  String get addMedicineQuantity => 'Quantity';

  @override
  String get addMedicineExpiryDate => 'Expiry date';

  @override
  String get addMedicineConditionTag => 'Condition tag (optional)';

  @override
  String get addMedicineSetReminder => 'Set reminder';

  @override
  String get addMedicineSave => 'Save medicine';

  @override
  String get addMedicineScanPackage => 'Scan the package';

  @override
  String get scanTitle => 'Scan package';

  @override
  String get scanConfirm => 'Confirm details';

  @override
  String get scanNotWorking =>
      'Scan not working? Tap the pencil to enter manually.';

  @override
  String get scanConfirmAiNotice =>
      'This is a draft read by AI. Check every field. Nothing is saved until you confirm.';

  @override
  String get scanConfirmAiMistakes => 'AI can make mistakes.';

  @override
  String get scheduleEditorTitle => 'Reminder';

  @override
  String get scheduleEditorTimes => 'TIMES';

  @override
  String get scheduleEditorAddTime => 'Add time';

  @override
  String get scheduleEditorDays => 'DAYS';

  @override
  String get scheduleEditorDoseAmount => 'DOSE AMOUNT';

  @override
  String get scheduleEditorAlertStyle => 'ALERT STYLE';

  @override
  String get scheduleEditorNeverSuggests =>
      'Use the amount printed on your label or prescription. Okhati never suggests a dose.';

  @override
  String get conditionTagsTitle => 'Condition tag';

  @override
  String get conditionTagsSubtitle =>
      'Label why you take this medicine. This is only a tag, not a diagnosis.';

  @override
  String get conditionTagsSearch => 'Search or create';

  @override
  String get conditionTagsNewTag => 'Create new tag';

  @override
  String get addMedicineScanSubtitle => 'Fill name and expiry from a photo';

  @override
  String get conditionTagCold => 'Cold';

  @override
  String get conditionTagAllergy => 'Allergy';

  @override
  String get conditionTagPain => 'Pain';

  @override
  String get conditionTagVitamin => 'Vitamin';

  @override
  String get conditionTagBloodPressure => 'Blood pressure';

  @override
  String get scanCapture => 'Capture package';

  @override
  String get scanFlash => 'Toggle flash';

  @override
  String get scanManualEntry => 'Enter manually';

  @override
  String get scanConfirmSave => 'Confirm and save';

  @override
  String get scanConfirmEditManual => 'Edit manually';

  @override
  String get scanConfirmRequired => 'Required';

  @override
  String get scanConfirmLowConfidence =>
      'Low confidence — please check this field';

  @override
  String get scheduleAlarm => 'Alarm';

  @override
  String get scheduleNotification => 'Notification';

  @override
  String scheduleDoseUnit(Object count) {
    return '$count capsule';
  }

  @override
  String get scheduleWeekdayMonday => 'M';

  @override
  String get scheduleWeekdayTuesday => 'T';

  @override
  String get scheduleWeekdayWednesday => 'W';

  @override
  String get scheduleWeekdayThursday => 'T';

  @override
  String get scheduleWeekdayFriday => 'F';

  @override
  String get scheduleWeekdaySaturday => 'S';

  @override
  String get scheduleWeekdaySunday => 'S';

  @override
  String get historyTitle => 'History';

  @override
  String get historyTakenThisWeek => 'taken this week';

  @override
  String get historyAdherence => 'adherence';

  @override
  String get weeklyInsightTitle => 'Weekly summary';

  @override
  String get weeklyInsightAiSummary => 'Okhati summary · AI';

  @override
  String get weeklyInsightDisclaimer =>
      'Based on your logged data. Not medical advice. AI can make mistakes.';

  @override
  String get familyTitle => 'Family';

  @override
  String get familyInvite => 'Invite';

  @override
  String get familyManageMembers => 'Manage members';

  @override
  String get familyJoin => 'Have a code?';

  @override
  String get familyJoinFamily => 'Join a family';

  @override
  String get familyMemberView => 'Member view';

  @override
  String get familyFamilyAlerts => 'Alerts';

  @override
  String get inviteTitle => 'Invite someone';

  @override
  String get inviteViewer => 'Viewer';

  @override
  String get inviteEditor => 'Editor';

  @override
  String get inviteViewerDesc =>
      'Viewers can see doses and stock but cannot change anything.';

  @override
  String get inviteExpires => 'Expires in 24 hours · works once';

  @override
  String get joinTitle => 'Join a family';

  @override
  String get joinSubtitle =>
      'Enter the code you received, or scan the QR from the person inviting you.';

  @override
  String get joinNotice =>
      'You will join as the role chosen by the owner. They can change or remove it at any time.';

  @override
  String get memberTitle => 'Mother';

  @override
  String get memberViewing =>
      'You are viewing Mother’s medicines. Viewers cannot edit.';

  @override
  String memberLowStock(String name) {
    return '$name is low';
  }

  @override
  String memberRefillSoon(int count) {
    return 'Only $count left. Plan a refill soon.';
  }

  @override
  String get manageMembersTitle => 'Manage members';

  @override
  String get manageMembersMembers => 'MEMBERS';

  @override
  String get manageMembersPrivacy => 'PRIVACY';

  @override
  String get moreTitle => 'More';

  @override
  String get moreHistory => 'History';

  @override
  String get moreMediGuide => 'MediGuide';

  @override
  String get moreNotificationSettings => 'Notification settings';

  @override
  String get moreSettings => 'Settings';

  @override
  String get morePrivacyAndData => 'Privacy and data';

  @override
  String get moreLanguage => 'Language';

  @override
  String get moreEnglish => 'English';

  @override
  String get moreNepali => 'नेपाली';

  @override
  String get moreVersion => 'Okhati v1.0 · Not a substitute for medical advice';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsLanguage => 'LANGUAGE';

  @override
  String get settingsTextSize => 'DISPLAY';

  @override
  String get settingsTextSizeLabel => 'Text size';

  @override
  String get settingsHighContrast => 'High contrast';

  @override
  String get settingsHighContrastDesc => 'Stronger colours and borders';

  @override
  String get settingsReadAloud => 'Read today aloud';

  @override
  String get settingsReadAloudDesc => 'Text-to-speech on the Today screen';

  @override
  String get settingsAccount => 'ACCOUNT';

  @override
  String get settingsLogOut => 'Log out';

  @override
  String get settingsDeleteAccount => 'Delete account';

  @override
  String get notificationSettingsTitle => 'Notifications';

  @override
  String get notificationSettingsQuietHours => 'QUIET HOURS';

  @override
  String get notificationSettingsQuietHoursLabel => 'Quiet hours';

  @override
  String get notificationSettingsQuietHoursDesc =>
      '22:00 – 07:00 · no sound for non-urgent alerts';

  @override
  String get notificationSettingsLowStockAlerts => 'Low-stock alerts';

  @override
  String get notificationSettingsExpiryWarnings => 'Expiry warnings';

  @override
  String get privacyAndDataTitle => 'Privacy and data';

  @override
  String get privacyAndDataStored => 'Stored on your account';

  @override
  String get privacyAndDataSentToAI => 'Sent to AI (only when you use it)';

  @override
  String get privacyAndDataNeverSent => 'Never sent to AI';

  @override
  String get deleteAccountTitle => 'Delete account';

  @override
  String get deleteAccountConfirm => 'Delete your account?';

  @override
  String get deleteAccountDesc =>
      'This removes your medicines, dose history and photos from Okhati. If you own a family, hand over ownership first.';

  @override
  String get deleteAccountCheckbox => 'I understand this cannot be undone.';

  @override
  String lockScreenTitle(String name) {
    return 'Time for $name';
  }

  @override
  String lockScreenDetails(String strength, String time) {
    return '$strength · $time';
  }

  @override
  String get alarmTitle => 'MEDICINE TIME';

  @override
  String get alarmTime => '13:00';

  @override
  String get snoozeTitle => 'Remind me again in…';

  @override
  String get permissionsTitle => 'Allow what Okhati needs';

  @override
  String get signInTitle => 'Welcome back';

  @override
  String get signUpTitle => 'Create account';

  @override
  String get onboarding1Title => 'Know what to take today';

  @override
  String get onboarding2Title => 'See what is in your cabinet';

  @override
  String get onboarding3Title => 'Share with family, safely';

  @override
  String get languageTitle => 'Choose your language';

  @override
  String get permissionsSubtitle =>
      'We only ask for what helps your routine. You can change these later.';

  @override
  String get splashTagline =>
      'Your medicine routine and home cabinet, in one place.';

  @override
  String get splashBrandNepali => 'ओखती';

  @override
  String get languageNepaliTitle => 'Nepali';

  @override
  String get languageNepaliPrompt => 'Choose a language';

  @override
  String get languageNepaliName => 'Nepali';

  @override
  String get languageEnglishSubtitle => 'Use the app in English';

  @override
  String get languageNepaliSubtitle => 'Use the app in Nepali';

  @override
  String get languageChangeNote =>
      'You can change the language anytime in Settings.';

  @override
  String get onboarding1Body =>
      'One simple Today screen shows every dose, what you already took, and what is coming next.';

  @override
  String get onboarding2Body =>
      'Track how much is left, get a low-stock warning, and never use an expired medicine by mistake.';

  @override
  String get onboarding3Body =>
      'Help a parent stay on track. See their doses and get an alert if one is missed.';

  @override
  String get onboardingGetStarted => 'Get started';

  @override
  String get permissionsNotifications => 'Notifications';

  @override
  String get permissionsNotificationsBody =>
      'To remind you when a dose is due.';

  @override
  String get permissionsAlarms => 'Exact alarms';

  @override
  String get permissionsAlarmsBody =>
      'So reminders fire on time, even offline or after restart.';

  @override
  String get permissionsCamera => 'Camera';

  @override
  String get permissionsCameraBody => 'Only when you scan a medicine package.';

  @override
  String get permissionsAllowContinue => 'Allow and continue';

  @override
  String get permissionsNotNow => 'Not now';

  @override
  String get authSignInSubtitle => 'Sign in to see today’s medicines.';

  @override
  String get authSignUpSubtitle =>
      'Takes under a minute. We only store what the app needs.';

  @override
  String get authEmail => 'Email';

  @override
  String get authEmailHint => 'name@example.com';

  @override
  String get authPassword => 'Password';

  @override
  String get authPasswordHint => 'At least 8 characters';

  @override
  String get authShowPassword => 'Show password';

  @override
  String get authHidePassword => 'Hide password';

  @override
  String get authFullName => 'Full name';

  @override
  String get authNameHint => 'Your name';

  @override
  String get authSignIn => 'Sign in';

  @override
  String get authContinueGoogle => 'Continue with Google';

  @override
  String get authOr => 'or';

  @override
  String get authNewToOkhati => 'New to Okhati?';

  @override
  String get authCreateAccount => 'Create account';

  @override
  String get authAlreadyHaveAccount => 'Already have an account?';

  @override
  String get authPrivacyConsent =>
      'I understand what data Okhati stores and what is sent to AI features.';

  @override
  String get authDemoNotice =>
      'Demo mode: account actions are not connected to a service.';

  @override
  String get authInvalidForm =>
      'Enter a valid email and a password with at least 8 characters.';

  @override
  String get statusGood => 'Good';

  @override
  String get statusDue => 'Due';

  @override
  String get statusLowStock => 'Low stock';

  @override
  String get statusExpiring => 'Expiring';

  @override
  String get statusExpired => 'Expired';

  @override
  String get commonTryAgain => 'Try again';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonSave => 'Save';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonDone => 'Done';

  @override
  String get commonBack => 'Back';

  @override
  String get commonNext => 'Next';

  @override
  String get commonSkip => 'Skip';

  @override
  String get commonSearch => 'Search';

  @override
  String get commonClose => 'Close';

  @override
  String get commonAdd => 'Add';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonRetry => 'Retry';

  @override
  String get commonLoading => 'Loading…';

  @override
  String get commonEmpty => 'Nothing here yet';

  @override
  String get commonErrorTitle => 'Something went wrong';

  @override
  String get commonErrorBody => 'Please try again.';

  @override
  String medicineCardMeta(int count, String date) {
    return '$count left · Exp $date';
  }

  @override
  String medicineCardSubtitle(String strength, String condition) {
    return '$strength · $condition';
  }

  @override
  String medicineCardSubtitleNoCondition(String strength) {
    return '$strength';
  }

  @override
  String medicineCardAccessibility(String name, String details, String status) {
    return '$name, $details, $status';
  }

  @override
  String get navToday => 'Today';

  @override
  String get navCabinet => 'Cabinet';

  @override
  String get navFamily => 'Family';

  @override
  String get navMore => 'More';

  @override
  String get todayEmptyTitle => 'Nothing scheduled today';

  @override
  String get todayEmptyBody =>
      'Add a medicine and set a reminder to see it here.';

  @override
  String get todayNotifications => 'Notifications';

  @override
  String get todayLabel => 'TODAY';

  @override
  String get todayInsightBody =>
      'You took 90% of doses this week. Evening doses were missed twice.';

  @override
  String get doseTaken => 'Taken';

  @override
  String get doseUpcoming => 'Upcoming';

  @override
  String get doseSnooze => 'Snooze';

  @override
  String get profileMe => 'Me';

  @override
  String get languageSwitchLabel => 'ने';

  @override
  String doseDetail(String strength, String doseLabel) {
    return '$strength · $doseLabel';
  }

  @override
  String get languageToggleTooltip => 'Switch language';

  @override
  String get medicineDetailsLeft => 'Left';

  @override
  String get medicineDetailsExpires => 'Expires';

  @override
  String get medicineDetailsAlertAt => 'Alert at';

  @override
  String get medicineDetailsConditionTag => 'Condition tag';

  @override
  String get medicineDetailsReminders => 'Reminders';

  @override
  String medicineDetailsTakenMissed(int taken, int missed) {
    return '$taken taken · $missed missed';
  }

  @override
  String medicineDetailsFormTag(String form, String tag) {
    return '$form · Tag: $tag';
  }

  @override
  String medicineDetailsFormOnly(String form) {
    return '$form';
  }

  @override
  String get medicineDetailsDaily => 'daily';

  @override
  String get medicineDetailsNotSet => 'Not set';

  @override
  String get medicineDetailsTakenSnack => 'Dose marked as taken';

  @override
  String get medicineDetailsNoDoses => 'No doses left';

  @override
  String get medicineDetailsDoseDisclaimer =>
      'Copied from your package. Okhati never suggests a dose.';

  @override
  String get historyTakenCount => '19 taken';

  @override
  String get historyMissedCount => '1 missed';

  @override
  String get historySkippedCount => '1 skipped';

  @override
  String get historyFilter7Days => '7 days';

  @override
  String get historyFilter30Days => '30 days';

  @override
  String get historyFilterAll => 'All';

  @override
  String get historyFilterMissed => 'Missed';

  @override
  String get historyToday => 'TODAY';

  @override
  String get historyYesterday => 'YESTERDAY';

  @override
  String get historyDownload => 'Download history';

  @override
  String get historyExportDemo => 'Export is unavailable for demo data.';

  @override
  String get historyTime8 => '08:00';

  @override
  String get historyTime13 => '13:00';

  @override
  String get historyTime20 => '20:00';

  @override
  String get historyMedicineCetirizine => 'Cetirizine';

  @override
  String get historyMedicineAmoxicillin => 'Amoxicillin';

  @override
  String get historyMedicineVitamin => 'Vitamin D3';

  @override
  String get historyStrength10mg => '10 mg';

  @override
  String get historyStrength500mg => '500 mg';

  @override
  String get historyStrength1000iu => '1000 IU';

  @override
  String get historyStatusTaken => 'Taken';

  @override
  String get historyStatusDue => 'Due';

  @override
  String get historyStatusMissed => 'Missed';

  @override
  String get historyStatusSkipped => 'Skipped';

  @override
  String get weeklyTitle => 'Weekly summary';

  @override
  String get weeklyDateRange => 'Mon 12 – Sun 18 October';

  @override
  String get weeklyTaken => 'Taken';

  @override
  String get weeklyMissed => 'Missed';

  @override
  String get weeklyLowStock => 'Low stock';

  @override
  String get weeklyDosesPerDay => 'DOSES TAKEN PER DAY';

  @override
  String get weeklyInsightBody =>
      'You took 90% of your doses this week. Evening doses were missed twice. Amoxicillin is running low, with 6 left.';

  @override
  String get weeklyDisclaimer =>
      'Based on your logged data. Not medical advice. AI can make mistakes.';

  @override
  String get weeklySuggestionTitle => 'Suggestion';

  @override
  String get weeklySuggestionBody =>
      'You usually log your 20:00 dose around 21:15. Move the reminder?';

  @override
  String get weeklyMoveReminder => 'Move to 21:15';

  @override
  String get weeklyNotNow => 'Not now';

  @override
  String get weeklyMon => 'M';

  @override
  String get weeklyTue => 'T';

  @override
  String get weeklyWed => 'W';

  @override
  String get weeklyThu => 'T';

  @override
  String get weeklyFri => 'F';

  @override
  String get weeklySat => 'S';

  @override
  String get weeklySun => 'S';

  @override
  String get familyName => 'Sharma Family';

  @override
  String get familyOwnerSummary => '3 members · You are the owner';

  @override
  String get familyProfiles => 'PROFILES';

  @override
  String get familySelf => 'Me (Sita)';

  @override
  String get familyMotherName => 'Mother';

  @override
  String get familyBrotherName => 'Brother (Rohan)';

  @override
  String get familySelfSummary => '2 of 3 doses taken today';

  @override
  String get familyMotherSummary => '1 of 3 taken · 1 missed';

  @override
  String get familyBrotherSummary => 'Viewer · sees Mother only';

  @override
  String get familyOnTrack => 'On track';

  @override
  String get familyAttention => 'Needs attention';

  @override
  String get familyInviteMember => 'Invite family member';

  @override
  String get familyJoinPrompt => 'Have a code?';

  @override
  String get inviteEditorDesc =>
      'Editors can add medicines and manage stock and reminders.';

  @override
  String get inviteRoleLabel => 'Access role';

  @override
  String get inviteShare => 'Share invite';

  @override
  String get inviteCopy => 'Copy code';

  @override
  String get inviteCopied => 'Invite code copied';

  @override
  String get inviteQrSemantics => 'Mock invite QR code';

  @override
  String get joinScanQr => 'Scan QR code';

  @override
  String get joinCodeLabel => 'Invite code';

  @override
  String get joinInvalid => 'Enter the invite code to continue.';

  @override
  String get joinSuccess => 'You joined the family.';

  @override
  String get memberMe => 'Me';

  @override
  String get memberToday => 'TODAY';

  @override
  String get memberAmlodipine => 'Amlodipine';

  @override
  String get memberCalcium => 'Calcium';

  @override
  String get memberAtorvastatin => 'Atorvastatin';

  @override
  String get memberAmlodipineStrength => '5 mg';

  @override
  String get memberCalciumStrength => '500 mg';

  @override
  String get memberAtorvastatinStrength => '10 mg';

  @override
  String get memberMissedAlert => 'Calcium is low';

  @override
  String get memberMissedDetails => 'Only 4 left. Plan a refill soon.';

  @override
  String get memberSeeAlerts => 'See all alerts';

  @override
  String get manageOwner => 'Owner';

  @override
  String get manageRemove => 'Remove member';

  @override
  String get manageLeave => 'Leave family';

  @override
  String get manageLeaveConfirmTitle => 'Leave this family?';

  @override
  String get manageLeaveConfirmBody =>
      'You will lose access to shared medicines and alerts.';

  @override
  String get manageViewDoses => 'Viewers can see doses';

  @override
  String get manageViewDosesDesc => 'Taken, missed and skipped';

  @override
  String get manageEditMedicines => 'Editors can add medicines';

  @override
  String get manageEditMedicinesDesc => 'Add and edit stock and reminders';

  @override
  String get manageSendAlerts => 'Send missed-dose alerts';

  @override
  String get manageSendAlertsDesc => 'Push to owner and editors';

  @override
  String get familyAlertsTitle => 'Alerts';

  @override
  String get familyAlertsFilter => 'Filter alerts';

  @override
  String get familyAlertsFilterAll => 'All';

  @override
  String get familyAlertsFilterMissed => 'Missed';

  @override
  String get familyAlertsFilterStock => 'Low stock';

  @override
  String get familyAlertsFilterExpired => 'Expired';

  @override
  String get familyAlertMissedMotherTitle => 'Mother missed Calcium';

  @override
  String get familyAlertMissedMotherDetail => 'Due at 13:00 · no dose logged';

  @override
  String get familyAlertLowMotherTitle => 'Calcium is low for Mother';

  @override
  String get familyAlertLowMotherDetail => 'Only 4 left';

  @override
  String get familyAlertTookMotherTitle => 'Mother took Amlodipine';

  @override
  String get familyAlertTookMotherDetail => 'Logged at 08:05';

  @override
  String get familyAlertExpiredTitle => 'Cough syrup has expired';

  @override
  String get familyAlertExpiredDetail => 'In your cabinet · Exp 15 Aug 2026';

  @override
  String get familyAlertAgeOneHour => '1 h ago';

  @override
  String get familyAlertAgeTwoHours => '2 h ago';

  @override
  String get familyAlertAgeToday => 'Today';

  @override
  String get familyAlertAgeYesterday => 'Yesterday';

  @override
  String get alarmTaken => 'Taken';

  @override
  String get alarmSnoozeTen => 'Snooze 10 min';

  @override
  String get alarmMedicine => 'Amoxicillin';

  @override
  String get alarmDose => '500 mg · 1 capsule';

  @override
  String get lockDate => 'Saturday, 24 October';

  @override
  String get lockTime => '13:00';

  @override
  String get lockNow => 'now';

  @override
  String get lockNotificationTitle => 'Time for Amoxicillin';

  @override
  String get lockNotificationDetails => '500 mg · 1 capsule · 13:00';

  @override
  String get lockOpenHint => 'Tap the notification to open the alarm screen.';

  @override
  String get snooze5 => '5 minutes';

  @override
  String get snooze10 => '10 minutes';

  @override
  String get snooze15 => '15 minutes';

  @override
  String get snoozeCancel => 'Cancel';

  @override
  String get duplicateMedicineTitle => 'Possible duplicate';

  @override
  String duplicateMedicineMessage(String name) {
    return 'A similar medicine, $name, is already in your cabinet. Do you want to save this one too?';
  }

  @override
  String get duplicateMedicineContinue => 'Continue anyway';

  @override
  String get doseSkip => 'Skip';

  @override
  String get doseMarkedTaken => 'Marked as taken';

  @override
  String get doseAlreadyLogged => 'This dose is already logged';
}
