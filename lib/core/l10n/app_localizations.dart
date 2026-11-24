import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ne.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ne'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Okhati'**
  String get appTitle;

  /// No description provided for @todayTitle.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get todayTitle;

  /// No description provided for @todayGreeting.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get todayGreeting;

  /// No description provided for @todayCabinetLabel.
  ///
  /// In en, this message translates to:
  /// **'MEDICINE CABINET'**
  String get todayCabinetLabel;

  /// No description provided for @todayCabinetCount.
  ///
  /// In en, this message translates to:
  /// **'{count} medicines'**
  String todayCabinetCount(int count);

  /// No description provided for @todayWeeklyInsight.
  ///
  /// In en, this message translates to:
  /// **'Weekly insight · AI'**
  String get todayWeeklyInsight;

  /// No description provided for @todayAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get todayAdd;

  /// No description provided for @todayScan.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get todayScan;

  /// No description provided for @todayHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get todayHistory;

  /// No description provided for @todayMediGuide.
  ///
  /// In en, this message translates to:
  /// **'MediGuide'**
  String get todayMediGuide;

  /// No description provided for @cabinetTitle.
  ///
  /// In en, this message translates to:
  /// **'My medicines'**
  String get cabinetTitle;

  /// No description provided for @cabinetSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get cabinetSearch;

  /// No description provided for @cabinetFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get cabinetFilterAll;

  /// No description provided for @cabinetFilterLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get cabinetFilterLow;

  /// No description provided for @cabinetFilterExpiring.
  ///
  /// In en, this message translates to:
  /// **'Expiring'**
  String get cabinetFilterExpiring;

  /// No description provided for @cabinetFilterExpired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get cabinetFilterExpired;

  /// No description provided for @cabinetEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No medicines found'**
  String get cabinetEmptyTitle;

  /// No description provided for @cabinetEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Check the spelling, or add this medicine to your cabinet.'**
  String get cabinetEmptyBody;

  /// No description provided for @cabinetAdd.
  ///
  /// In en, this message translates to:
  /// **'Add medicine'**
  String get cabinetAdd;

  /// No description provided for @cabinetBack.
  ///
  /// In en, this message translates to:
  /// **'Back to cabinet'**
  String get cabinetBack;

  /// No description provided for @medicineDetailsEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get medicineDetailsEdit;

  /// No description provided for @medicineDetailsDoseOnLabel.
  ///
  /// In en, this message translates to:
  /// **'DOSE ON LABEL'**
  String get medicineDetailsDoseOnLabel;

  /// No description provided for @medicineDetailsNotDiagnosis.
  ///
  /// In en, this message translates to:
  /// **'Not a diagnosis'**
  String get medicineDetailsNotDiagnosis;

  /// No description provided for @medicineDetailsLast7Days.
  ///
  /// In en, this message translates to:
  /// **'Last 7 days'**
  String get medicineDetailsLast7Days;

  /// No description provided for @medicineDetailsMarkTaken.
  ///
  /// In en, this message translates to:
  /// **'Mark dose as taken'**
  String get medicineDetailsMarkTaken;

  /// No description provided for @addMedicineTitle.
  ///
  /// In en, this message translates to:
  /// **'Add medicine'**
  String get addMedicineTitle;

  /// No description provided for @addMedicineMedicineName.
  ///
  /// In en, this message translates to:
  /// **'Medicine name'**
  String get addMedicineMedicineName;

  /// No description provided for @addMedicineStrength.
  ///
  /// In en, this message translates to:
  /// **'Strength'**
  String get addMedicineStrength;

  /// No description provided for @addMedicineQuantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get addMedicineQuantity;

  /// No description provided for @addMedicineExpiryDate.
  ///
  /// In en, this message translates to:
  /// **'Expiry date'**
  String get addMedicineExpiryDate;

  /// No description provided for @addMedicineConditionTag.
  ///
  /// In en, this message translates to:
  /// **'Condition tag (optional)'**
  String get addMedicineConditionTag;

  /// No description provided for @addMedicineSetReminder.
  ///
  /// In en, this message translates to:
  /// **'Set reminder'**
  String get addMedicineSetReminder;

  /// No description provided for @addMedicineSave.
  ///
  /// In en, this message translates to:
  /// **'Save medicine'**
  String get addMedicineSave;

  /// No description provided for @addMedicineScanPackage.
  ///
  /// In en, this message translates to:
  /// **'Scan the package'**
  String get addMedicineScanPackage;

  /// No description provided for @scanTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan package'**
  String get scanTitle;

  /// No description provided for @scanConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm details'**
  String get scanConfirm;

  /// No description provided for @scanNotWorking.
  ///
  /// In en, this message translates to:
  /// **'Scan not working? Tap the pencil to enter manually.'**
  String get scanNotWorking;

  /// No description provided for @scanConfirmAiNotice.
  ///
  /// In en, this message translates to:
  /// **'This is a draft read by AI. Check every field. Nothing is saved until you confirm.'**
  String get scanConfirmAiNotice;

  /// No description provided for @scanConfirmAiMistakes.
  ///
  /// In en, this message translates to:
  /// **'AI can make mistakes.'**
  String get scanConfirmAiMistakes;

  /// No description provided for @scheduleEditorTitle.
  ///
  /// In en, this message translates to:
  /// **'Reminder'**
  String get scheduleEditorTitle;

  /// No description provided for @scheduleEditorTimes.
  ///
  /// In en, this message translates to:
  /// **'TIMES'**
  String get scheduleEditorTimes;

  /// No description provided for @scheduleEditorAddTime.
  ///
  /// In en, this message translates to:
  /// **'Add time'**
  String get scheduleEditorAddTime;

  /// No description provided for @scheduleEditorDays.
  ///
  /// In en, this message translates to:
  /// **'DAYS'**
  String get scheduleEditorDays;

  /// No description provided for @scheduleEditorDoseAmount.
  ///
  /// In en, this message translates to:
  /// **'DOSE AMOUNT'**
  String get scheduleEditorDoseAmount;

  /// No description provided for @scheduleEditorAlertStyle.
  ///
  /// In en, this message translates to:
  /// **'ALERT STYLE'**
  String get scheduleEditorAlertStyle;

  /// No description provided for @scheduleEditorNeverSuggests.
  ///
  /// In en, this message translates to:
  /// **'Use the amount printed on your label or prescription. Okhati never suggests a dose.'**
  String get scheduleEditorNeverSuggests;

  /// No description provided for @conditionTagsTitle.
  ///
  /// In en, this message translates to:
  /// **'Condition tag'**
  String get conditionTagsTitle;

  /// No description provided for @conditionTagsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Label why you take this medicine. This is only a tag, not a diagnosis.'**
  String get conditionTagsSubtitle;

  /// No description provided for @conditionTagsSearch.
  ///
  /// In en, this message translates to:
  /// **'Search or create'**
  String get conditionTagsSearch;

  /// No description provided for @conditionTagsNewTag.
  ///
  /// In en, this message translates to:
  /// **'Create new tag'**
  String get conditionTagsNewTag;

  /// No description provided for @addMedicineScanSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Fill name and expiry from a photo'**
  String get addMedicineScanSubtitle;

  /// No description provided for @conditionTagCold.
  ///
  /// In en, this message translates to:
  /// **'Cold'**
  String get conditionTagCold;

  /// No description provided for @conditionTagAllergy.
  ///
  /// In en, this message translates to:
  /// **'Allergy'**
  String get conditionTagAllergy;

  /// No description provided for @conditionTagPain.
  ///
  /// In en, this message translates to:
  /// **'Pain'**
  String get conditionTagPain;

  /// No description provided for @conditionTagVitamin.
  ///
  /// In en, this message translates to:
  /// **'Vitamin'**
  String get conditionTagVitamin;

  /// No description provided for @conditionTagBloodPressure.
  ///
  /// In en, this message translates to:
  /// **'Blood pressure'**
  String get conditionTagBloodPressure;

  /// No description provided for @scanCapture.
  ///
  /// In en, this message translates to:
  /// **'Capture package'**
  String get scanCapture;

  /// No description provided for @scanFlash.
  ///
  /// In en, this message translates to:
  /// **'Toggle flash'**
  String get scanFlash;

  /// No description provided for @scanManualEntry.
  ///
  /// In en, this message translates to:
  /// **'Enter manually'**
  String get scanManualEntry;

  /// No description provided for @scanConfirmSave.
  ///
  /// In en, this message translates to:
  /// **'Confirm and save'**
  String get scanConfirmSave;

  /// No description provided for @scanConfirmEditManual.
  ///
  /// In en, this message translates to:
  /// **'Edit manually'**
  String get scanConfirmEditManual;

  /// No description provided for @scanConfirmRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get scanConfirmRequired;

  /// No description provided for @scanConfirmLowConfidence.
  ///
  /// In en, this message translates to:
  /// **'Low confidence — please check this field'**
  String get scanConfirmLowConfidence;

  /// No description provided for @scheduleAlarm.
  ///
  /// In en, this message translates to:
  /// **'Alarm'**
  String get scheduleAlarm;

  /// No description provided for @scheduleNotification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get scheduleNotification;

  /// No description provided for @scheduleDoseUnit.
  ///
  /// In en, this message translates to:
  /// **'{count} capsule'**
  String scheduleDoseUnit(Object count);

  /// No description provided for @scheduleWeekdayMonday.
  ///
  /// In en, this message translates to:
  /// **'M'**
  String get scheduleWeekdayMonday;

  /// No description provided for @scheduleWeekdayTuesday.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get scheduleWeekdayTuesday;

  /// No description provided for @scheduleWeekdayWednesday.
  ///
  /// In en, this message translates to:
  /// **'W'**
  String get scheduleWeekdayWednesday;

  /// No description provided for @scheduleWeekdayThursday.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get scheduleWeekdayThursday;

  /// No description provided for @scheduleWeekdayFriday.
  ///
  /// In en, this message translates to:
  /// **'F'**
  String get scheduleWeekdayFriday;

  /// No description provided for @scheduleWeekdaySaturday.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get scheduleWeekdaySaturday;

  /// No description provided for @scheduleWeekdaySunday.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get scheduleWeekdaySunday;

  /// No description provided for @historyTitle.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get historyTitle;

  /// No description provided for @historyTakenThisWeek.
  ///
  /// In en, this message translates to:
  /// **'taken this week'**
  String get historyTakenThisWeek;

  /// No description provided for @historyAdherence.
  ///
  /// In en, this message translates to:
  /// **'adherence'**
  String get historyAdherence;

  /// No description provided for @weeklyInsightTitle.
  ///
  /// In en, this message translates to:
  /// **'Weekly summary'**
  String get weeklyInsightTitle;

  /// No description provided for @weeklyInsightAiSummary.
  ///
  /// In en, this message translates to:
  /// **'Okhati summary · AI'**
  String get weeklyInsightAiSummary;

  /// No description provided for @weeklyInsightDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Based on your logged data. Not medical advice. AI can make mistakes.'**
  String get weeklyInsightDisclaimer;

  /// No description provided for @familyTitle.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get familyTitle;

  /// No description provided for @familyInvite.
  ///
  /// In en, this message translates to:
  /// **'Invite'**
  String get familyInvite;

  /// No description provided for @familyManageMembers.
  ///
  /// In en, this message translates to:
  /// **'Manage members'**
  String get familyManageMembers;

  /// No description provided for @familyJoin.
  ///
  /// In en, this message translates to:
  /// **'Have a code?'**
  String get familyJoin;

  /// No description provided for @familyJoinFamily.
  ///
  /// In en, this message translates to:
  /// **'Join a family'**
  String get familyJoinFamily;

  /// No description provided for @familyMemberView.
  ///
  /// In en, this message translates to:
  /// **'Member view'**
  String get familyMemberView;

  /// No description provided for @familyFamilyAlerts.
  ///
  /// In en, this message translates to:
  /// **'Alerts'**
  String get familyFamilyAlerts;

  /// No description provided for @inviteTitle.
  ///
  /// In en, this message translates to:
  /// **'Invite someone'**
  String get inviteTitle;

  /// No description provided for @inviteViewer.
  ///
  /// In en, this message translates to:
  /// **'Viewer'**
  String get inviteViewer;

  /// No description provided for @inviteEditor.
  ///
  /// In en, this message translates to:
  /// **'Editor'**
  String get inviteEditor;

  /// No description provided for @inviteViewerDesc.
  ///
  /// In en, this message translates to:
  /// **'Viewers can see doses and stock but cannot change anything.'**
  String get inviteViewerDesc;

  /// No description provided for @inviteExpires.
  ///
  /// In en, this message translates to:
  /// **'Expires in 24 hours · works once'**
  String get inviteExpires;

  /// No description provided for @joinTitle.
  ///
  /// In en, this message translates to:
  /// **'Join a family'**
  String get joinTitle;

  /// No description provided for @joinSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the code you received, or scan the QR from the person inviting you.'**
  String get joinSubtitle;

  /// No description provided for @joinNotice.
  ///
  /// In en, this message translates to:
  /// **'You will join as the role chosen by the owner. They can change or remove it at any time.'**
  String get joinNotice;

  /// No description provided for @memberTitle.
  ///
  /// In en, this message translates to:
  /// **'Mother'**
  String get memberTitle;

  /// No description provided for @memberViewing.
  ///
  /// In en, this message translates to:
  /// **'You are viewing Mother’s medicines. Viewers cannot edit.'**
  String get memberViewing;

  /// No description provided for @memberLowStock.
  ///
  /// In en, this message translates to:
  /// **'{name} is low'**
  String memberLowStock(String name);

  /// No description provided for @memberRefillSoon.
  ///
  /// In en, this message translates to:
  /// **'Only {count} left. Plan a refill soon.'**
  String memberRefillSoon(int count);

  /// No description provided for @manageMembersTitle.
  ///
  /// In en, this message translates to:
  /// **'Manage members'**
  String get manageMembersTitle;

  /// No description provided for @manageMembersMembers.
  ///
  /// In en, this message translates to:
  /// **'MEMBERS'**
  String get manageMembersMembers;

  /// No description provided for @manageMembersPrivacy.
  ///
  /// In en, this message translates to:
  /// **'PRIVACY'**
  String get manageMembersPrivacy;

  /// No description provided for @moreTitle.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get moreTitle;

  /// No description provided for @moreHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get moreHistory;

  /// No description provided for @moreMediGuide.
  ///
  /// In en, this message translates to:
  /// **'MediGuide'**
  String get moreMediGuide;

  /// No description provided for @moreNotificationSettings.
  ///
  /// In en, this message translates to:
  /// **'Notification settings'**
  String get moreNotificationSettings;

  /// No description provided for @moreSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get moreSettings;

  /// No description provided for @morePrivacyAndData.
  ///
  /// In en, this message translates to:
  /// **'Privacy and data'**
  String get morePrivacyAndData;

  /// No description provided for @moreLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get moreLanguage;

  /// No description provided for @moreEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get moreEnglish;

  /// No description provided for @moreNepali.
  ///
  /// In en, this message translates to:
  /// **'नेपाली'**
  String get moreNepali;

  /// No description provided for @moreVersion.
  ///
  /// In en, this message translates to:
  /// **'Okhati v1.0 · Not a substitute for medical advice'**
  String get moreVersion;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'LANGUAGE'**
  String get settingsLanguage;

  /// No description provided for @settingsTextSize.
  ///
  /// In en, this message translates to:
  /// **'DISPLAY'**
  String get settingsTextSize;

  /// No description provided for @settingsTextSizeLabel.
  ///
  /// In en, this message translates to:
  /// **'Text size'**
  String get settingsTextSizeLabel;

  /// No description provided for @settingsHighContrast.
  ///
  /// In en, this message translates to:
  /// **'High contrast'**
  String get settingsHighContrast;

  /// No description provided for @settingsHighContrastDesc.
  ///
  /// In en, this message translates to:
  /// **'Stronger colours and borders'**
  String get settingsHighContrastDesc;

  /// No description provided for @settingsReadAloud.
  ///
  /// In en, this message translates to:
  /// **'Read today aloud'**
  String get settingsReadAloud;

  /// No description provided for @settingsReadAloudDesc.
  ///
  /// In en, this message translates to:
  /// **'Text-to-speech on the Today screen'**
  String get settingsReadAloudDesc;

  /// No description provided for @settingsAccount.
  ///
  /// In en, this message translates to:
  /// **'ACCOUNT'**
  String get settingsAccount;

  /// No description provided for @settingsLogOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get settingsLogOut;

  /// No description provided for @settingsDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get settingsDeleteAccount;

  /// No description provided for @notificationSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationSettingsTitle;

  /// No description provided for @notificationSettingsQuietHours.
  ///
  /// In en, this message translates to:
  /// **'QUIET HOURS'**
  String get notificationSettingsQuietHours;

  /// No description provided for @notificationSettingsQuietHoursLabel.
  ///
  /// In en, this message translates to:
  /// **'Quiet hours'**
  String get notificationSettingsQuietHoursLabel;

  /// No description provided for @notificationSettingsQuietHoursDesc.
  ///
  /// In en, this message translates to:
  /// **'22:00 – 07:00 · no sound for non-urgent alerts'**
  String get notificationSettingsQuietHoursDesc;

  /// No description provided for @notificationSettingsLowStockAlerts.
  ///
  /// In en, this message translates to:
  /// **'Low-stock alerts'**
  String get notificationSettingsLowStockAlerts;

  /// No description provided for @notificationSettingsExpiryWarnings.
  ///
  /// In en, this message translates to:
  /// **'Expiry warnings'**
  String get notificationSettingsExpiryWarnings;

  /// No description provided for @privacyAndDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy and data'**
  String get privacyAndDataTitle;

  /// No description provided for @privacyAndDataStored.
  ///
  /// In en, this message translates to:
  /// **'Stored on your account'**
  String get privacyAndDataStored;

  /// No description provided for @privacyAndDataSentToAI.
  ///
  /// In en, this message translates to:
  /// **'Sent to AI (only when you use it)'**
  String get privacyAndDataSentToAI;

  /// No description provided for @privacyAndDataNeverSent.
  ///
  /// In en, this message translates to:
  /// **'Never sent to AI'**
  String get privacyAndDataNeverSent;

  /// No description provided for @deleteAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccountTitle;

  /// No description provided for @deleteAccountConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete your account?'**
  String get deleteAccountConfirm;

  /// No description provided for @deleteAccountDesc.
  ///
  /// In en, this message translates to:
  /// **'This removes your medicines, dose history and photos from Okhati. If you own a family, hand over ownership first.'**
  String get deleteAccountDesc;

  /// No description provided for @deleteAccountCheckbox.
  ///
  /// In en, this message translates to:
  /// **'I understand this cannot be undone.'**
  String get deleteAccountCheckbox;

  /// No description provided for @lockScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Time for {name}'**
  String lockScreenTitle(String name);

  /// No description provided for @lockScreenDetails.
  ///
  /// In en, this message translates to:
  /// **'{strength} · {time}'**
  String lockScreenDetails(String strength, String time);

  /// No description provided for @alarmTitle.
  ///
  /// In en, this message translates to:
  /// **'MEDICINE TIME'**
  String get alarmTitle;

  /// No description provided for @alarmTime.
  ///
  /// In en, this message translates to:
  /// **'13:00'**
  String get alarmTime;

  /// No description provided for @snoozeTitle.
  ///
  /// In en, this message translates to:
  /// **'Remind me again in…'**
  String get snoozeTitle;

  /// No description provided for @permissionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Allow what Okhati needs'**
  String get permissionsTitle;

  /// No description provided for @signInTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get signInTitle;

  /// No description provided for @signUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get signUpTitle;

  /// No description provided for @onboarding1Title.
  ///
  /// In en, this message translates to:
  /// **'Know what to take today'**
  String get onboarding1Title;

  /// No description provided for @onboarding2Title.
  ///
  /// In en, this message translates to:
  /// **'See what is in your cabinet'**
  String get onboarding2Title;

  /// No description provided for @onboarding3Title.
  ///
  /// In en, this message translates to:
  /// **'Share with family, safely'**
  String get onboarding3Title;

  /// No description provided for @languageTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get languageTitle;

  /// No description provided for @permissionsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We only ask for what helps your routine. You can change these later.'**
  String get permissionsSubtitle;

  /// No description provided for @splashTagline.
  ///
  /// In en, this message translates to:
  /// **'Your medicine routine and home cabinet, in one place.'**
  String get splashTagline;

  /// No description provided for @splashBrandNepali.
  ///
  /// In en, this message translates to:
  /// **'ओखती'**
  String get splashBrandNepali;

  /// No description provided for @languageNepaliTitle.
  ///
  /// In en, this message translates to:
  /// **'Nepali'**
  String get languageNepaliTitle;

  /// No description provided for @languageNepaliPrompt.
  ///
  /// In en, this message translates to:
  /// **'Choose a language'**
  String get languageNepaliPrompt;

  /// No description provided for @languageNepaliName.
  ///
  /// In en, this message translates to:
  /// **'Nepali'**
  String get languageNepaliName;

  /// No description provided for @languageEnglishSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Use the app in English'**
  String get languageEnglishSubtitle;

  /// No description provided for @languageNepaliSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Use the app in Nepali'**
  String get languageNepaliSubtitle;

  /// No description provided for @languageChangeNote.
  ///
  /// In en, this message translates to:
  /// **'You can change the language anytime in Settings.'**
  String get languageChangeNote;

  /// No description provided for @onboarding1Body.
  ///
  /// In en, this message translates to:
  /// **'One simple Today screen shows every dose, what you already took, and what is coming next.'**
  String get onboarding1Body;

  /// No description provided for @onboarding2Body.
  ///
  /// In en, this message translates to:
  /// **'Track how much is left, get a low-stock warning, and never use an expired medicine by mistake.'**
  String get onboarding2Body;

  /// No description provided for @onboarding3Body.
  ///
  /// In en, this message translates to:
  /// **'Help a parent stay on track. See their doses and get an alert if one is missed.'**
  String get onboarding3Body;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get onboardingGetStarted;

  /// No description provided for @permissionsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get permissionsNotifications;

  /// No description provided for @permissionsNotificationsBody.
  ///
  /// In en, this message translates to:
  /// **'To remind you when a dose is due.'**
  String get permissionsNotificationsBody;

  /// No description provided for @permissionsAlarms.
  ///
  /// In en, this message translates to:
  /// **'Exact alarms'**
  String get permissionsAlarms;

  /// No description provided for @permissionsAlarmsBody.
  ///
  /// In en, this message translates to:
  /// **'So reminders fire on time, even offline or after restart.'**
  String get permissionsAlarmsBody;

  /// No description provided for @permissionsCamera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get permissionsCamera;

  /// No description provided for @permissionsCameraBody.
  ///
  /// In en, this message translates to:
  /// **'Only when you scan a medicine package.'**
  String get permissionsCameraBody;

  /// No description provided for @permissionsAllowContinue.
  ///
  /// In en, this message translates to:
  /// **'Allow and continue'**
  String get permissionsAllowContinue;

  /// No description provided for @permissionsNotNow.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get permissionsNotNow;

  /// No description provided for @authSignInSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to see today’s medicines.'**
  String get authSignInSubtitle;

  /// No description provided for @authSignUpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Takes under a minute. We only store what the app needs.'**
  String get authSignUpSubtitle;

  /// No description provided for @authEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get authEmail;

  /// No description provided for @authEmailHint.
  ///
  /// In en, this message translates to:
  /// **'name@example.com'**
  String get authEmailHint;

  /// No description provided for @authPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPassword;

  /// No description provided for @authPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters'**
  String get authPasswordHint;

  /// No description provided for @authShowPassword.
  ///
  /// In en, this message translates to:
  /// **'Show password'**
  String get authShowPassword;

  /// No description provided for @authHidePassword.
  ///
  /// In en, this message translates to:
  /// **'Hide password'**
  String get authHidePassword;

  /// No description provided for @authFullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get authFullName;

  /// No description provided for @authNameHint.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get authNameHint;

  /// No description provided for @authSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get authSignIn;

  /// No description provided for @authContinueGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get authContinueGoogle;

  /// No description provided for @authOr.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get authOr;

  /// No description provided for @authNewToOkhati.
  ///
  /// In en, this message translates to:
  /// **'New to Okhati?'**
  String get authNewToOkhati;

  /// No description provided for @authCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get authCreateAccount;

  /// No description provided for @authAlreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get authAlreadyHaveAccount;

  /// No description provided for @authPrivacyConsent.
  ///
  /// In en, this message translates to:
  /// **'I understand what data Okhati stores and what is sent to AI features.'**
  String get authPrivacyConsent;

  /// No description provided for @authDemoNotice.
  ///
  /// In en, this message translates to:
  /// **'Demo mode: account actions are not connected to a service.'**
  String get authDemoNotice;

  /// No description provided for @authInvalidForm.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email and a password with at least 8 characters.'**
  String get authInvalidForm;

  /// No description provided for @statusGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get statusGood;

  /// No description provided for @statusDue.
  ///
  /// In en, this message translates to:
  /// **'Due'**
  String get statusDue;

  /// No description provided for @statusLowStock.
  ///
  /// In en, this message translates to:
  /// **'Low stock'**
  String get statusLowStock;

  /// No description provided for @statusExpiring.
  ///
  /// In en, this message translates to:
  /// **'Expiring'**
  String get statusExpiring;

  /// No description provided for @statusExpired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get statusExpired;

  /// No description provided for @commonTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get commonTryAgain;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get commonSave;

  /// No description provided for @commonDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get commonDelete;

  /// No description provided for @commonDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get commonDone;

  /// No description provided for @commonBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get commonBack;

  /// No description provided for @commonNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get commonNext;

  /// No description provided for @commonSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get commonSkip;

  /// No description provided for @commonSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get commonSearch;

  /// No description provided for @commonClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get commonClose;

  /// No description provided for @commonAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get commonAdd;

  /// No description provided for @commonEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get commonEdit;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get commonRetry;

  /// No description provided for @commonLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading…'**
  String get commonLoading;

  /// No description provided for @commonEmpty.
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet'**
  String get commonEmpty;

  /// No description provided for @commonErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get commonErrorTitle;

  /// No description provided for @commonErrorBody.
  ///
  /// In en, this message translates to:
  /// **'Please try again.'**
  String get commonErrorBody;

  /// No description provided for @medicineCardMeta.
  ///
  /// In en, this message translates to:
  /// **'{count} left · Exp {date}'**
  String medicineCardMeta(int count, String date);

  /// No description provided for @medicineCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{strength} · {condition}'**
  String medicineCardSubtitle(String strength, String condition);

  /// No description provided for @medicineCardSubtitleNoCondition.
  ///
  /// In en, this message translates to:
  /// **'{strength}'**
  String medicineCardSubtitleNoCondition(String strength);

  /// No description provided for @medicineCardAccessibility.
  ///
  /// In en, this message translates to:
  /// **'{name}, {details}, {status}'**
  String medicineCardAccessibility(String name, String details, String status);

  /// No description provided for @navToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get navToday;

  /// No description provided for @navCabinet.
  ///
  /// In en, this message translates to:
  /// **'Cabinet'**
  String get navCabinet;

  /// No description provided for @navFamily.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get navFamily;

  /// No description provided for @navMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get navMore;

  /// No description provided for @todayEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing scheduled today'**
  String get todayEmptyTitle;

  /// No description provided for @todayEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Add a medicine and set a reminder to see it here.'**
  String get todayEmptyBody;

  /// No description provided for @todayNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get todayNotifications;

  /// No description provided for @todayLabel.
  ///
  /// In en, this message translates to:
  /// **'TODAY'**
  String get todayLabel;

  /// No description provided for @todayInsightBody.
  ///
  /// In en, this message translates to:
  /// **'You took 90% of doses this week. Evening doses were missed twice.'**
  String get todayInsightBody;

  /// No description provided for @doseTaken.
  ///
  /// In en, this message translates to:
  /// **'Taken'**
  String get doseTaken;

  /// No description provided for @doseUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get doseUpcoming;

  /// No description provided for @doseSnooze.
  ///
  /// In en, this message translates to:
  /// **'Snooze'**
  String get doseSnooze;

  /// No description provided for @profileMe.
  ///
  /// In en, this message translates to:
  /// **'Me'**
  String get profileMe;

  /// No description provided for @languageSwitchLabel.
  ///
  /// In en, this message translates to:
  /// **'ने'**
  String get languageSwitchLabel;

  /// No description provided for @doseDetail.
  ///
  /// In en, this message translates to:
  /// **'{strength} · {doseLabel}'**
  String doseDetail(String strength, String doseLabel);

  /// No description provided for @languageToggleTooltip.
  ///
  /// In en, this message translates to:
  /// **'Switch language'**
  String get languageToggleTooltip;

  /// No description provided for @medicineDetailsLeft.
  ///
  /// In en, this message translates to:
  /// **'Left'**
  String get medicineDetailsLeft;

  /// No description provided for @medicineDetailsExpires.
  ///
  /// In en, this message translates to:
  /// **'Expires'**
  String get medicineDetailsExpires;

  /// No description provided for @medicineDetailsAlertAt.
  ///
  /// In en, this message translates to:
  /// **'Alert at'**
  String get medicineDetailsAlertAt;

  /// No description provided for @medicineDetailsConditionTag.
  ///
  /// In en, this message translates to:
  /// **'Condition tag'**
  String get medicineDetailsConditionTag;

  /// No description provided for @medicineDetailsReminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get medicineDetailsReminders;

  /// No description provided for @medicineDetailsTakenMissed.
  ///
  /// In en, this message translates to:
  /// **'{taken} taken · {missed} missed'**
  String medicineDetailsTakenMissed(int taken, int missed);

  /// No description provided for @medicineDetailsFormTag.
  ///
  /// In en, this message translates to:
  /// **'{form} · Tag: {tag}'**
  String medicineDetailsFormTag(String form, String tag);

  /// No description provided for @medicineDetailsFormOnly.
  ///
  /// In en, this message translates to:
  /// **'{form}'**
  String medicineDetailsFormOnly(String form);

  /// No description provided for @medicineDetailsDaily.
  ///
  /// In en, this message translates to:
  /// **'daily'**
  String get medicineDetailsDaily;

  /// No description provided for @medicineDetailsNotSet.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get medicineDetailsNotSet;

  /// No description provided for @medicineDetailsTakenSnack.
  ///
  /// In en, this message translates to:
  /// **'Dose marked as taken'**
  String get medicineDetailsTakenSnack;

  /// No description provided for @medicineDetailsNoDoses.
  ///
  /// In en, this message translates to:
  /// **'No doses left'**
  String get medicineDetailsNoDoses;

  /// No description provided for @medicineDetailsDoseDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Copied from your package. Okhati never suggests a dose.'**
  String get medicineDetailsDoseDisclaimer;

  /// No description provided for @historyTakenCount.
  ///
  /// In en, this message translates to:
  /// **'19 taken'**
  String get historyTakenCount;

  /// No description provided for @historyMissedCount.
  ///
  /// In en, this message translates to:
  /// **'1 missed'**
  String get historyMissedCount;

  /// No description provided for @historySkippedCount.
  ///
  /// In en, this message translates to:
  /// **'1 skipped'**
  String get historySkippedCount;

  /// No description provided for @historyFilter7Days.
  ///
  /// In en, this message translates to:
  /// **'7 days'**
  String get historyFilter7Days;

  /// No description provided for @historyFilter30Days.
  ///
  /// In en, this message translates to:
  /// **'30 days'**
  String get historyFilter30Days;

  /// No description provided for @historyFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get historyFilterAll;

  /// No description provided for @historyFilterMissed.
  ///
  /// In en, this message translates to:
  /// **'Missed'**
  String get historyFilterMissed;

  /// No description provided for @historyToday.
  ///
  /// In en, this message translates to:
  /// **'TODAY'**
  String get historyToday;

  /// No description provided for @historyYesterday.
  ///
  /// In en, this message translates to:
  /// **'YESTERDAY'**
  String get historyYesterday;

  /// No description provided for @historyDownload.
  ///
  /// In en, this message translates to:
  /// **'Download history'**
  String get historyDownload;

  /// No description provided for @historyExportDemo.
  ///
  /// In en, this message translates to:
  /// **'Export is unavailable for demo data.'**
  String get historyExportDemo;

  /// No description provided for @historyTime8.
  ///
  /// In en, this message translates to:
  /// **'08:00'**
  String get historyTime8;

  /// No description provided for @historyTime13.
  ///
  /// In en, this message translates to:
  /// **'13:00'**
  String get historyTime13;

  /// No description provided for @historyTime20.
  ///
  /// In en, this message translates to:
  /// **'20:00'**
  String get historyTime20;

  /// No description provided for @historyMedicineCetirizine.
  ///
  /// In en, this message translates to:
  /// **'Cetirizine'**
  String get historyMedicineCetirizine;

  /// No description provided for @historyMedicineAmoxicillin.
  ///
  /// In en, this message translates to:
  /// **'Amoxicillin'**
  String get historyMedicineAmoxicillin;

  /// No description provided for @historyMedicineVitamin.
  ///
  /// In en, this message translates to:
  /// **'Vitamin D3'**
  String get historyMedicineVitamin;

  /// No description provided for @historyStrength10mg.
  ///
  /// In en, this message translates to:
  /// **'10 mg'**
  String get historyStrength10mg;

  /// No description provided for @historyStrength500mg.
  ///
  /// In en, this message translates to:
  /// **'500 mg'**
  String get historyStrength500mg;

  /// No description provided for @historyStrength1000iu.
  ///
  /// In en, this message translates to:
  /// **'1000 IU'**
  String get historyStrength1000iu;

  /// No description provided for @historyStatusTaken.
  ///
  /// In en, this message translates to:
  /// **'Taken'**
  String get historyStatusTaken;

  /// No description provided for @historyStatusDue.
  ///
  /// In en, this message translates to:
  /// **'Due'**
  String get historyStatusDue;

  /// No description provided for @historyStatusMissed.
  ///
  /// In en, this message translates to:
  /// **'Missed'**
  String get historyStatusMissed;

  /// No description provided for @historyStatusSkipped.
  ///
  /// In en, this message translates to:
  /// **'Skipped'**
  String get historyStatusSkipped;

  /// No description provided for @weeklyTitle.
  ///
  /// In en, this message translates to:
  /// **'Weekly summary'**
  String get weeklyTitle;

  /// No description provided for @weeklyDateRange.
  ///
  /// In en, this message translates to:
  /// **'Mon 12 – Sun 18 October'**
  String get weeklyDateRange;

  /// No description provided for @weeklyTaken.
  ///
  /// In en, this message translates to:
  /// **'Taken'**
  String get weeklyTaken;

  /// No description provided for @weeklyMissed.
  ///
  /// In en, this message translates to:
  /// **'Missed'**
  String get weeklyMissed;

  /// No description provided for @weeklyLowStock.
  ///
  /// In en, this message translates to:
  /// **'Low stock'**
  String get weeklyLowStock;

  /// No description provided for @weeklyDosesPerDay.
  ///
  /// In en, this message translates to:
  /// **'DOSES TAKEN PER DAY'**
  String get weeklyDosesPerDay;

  /// No description provided for @weeklyInsightBody.
  ///
  /// In en, this message translates to:
  /// **'You took 90% of your doses this week. Evening doses were missed twice. Amoxicillin is running low, with 6 left.'**
  String get weeklyInsightBody;

  /// No description provided for @weeklyDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Based on your logged data. Not medical advice. AI can make mistakes.'**
  String get weeklyDisclaimer;

  /// No description provided for @weeklySuggestionTitle.
  ///
  /// In en, this message translates to:
  /// **'Suggestion'**
  String get weeklySuggestionTitle;

  /// No description provided for @weeklySuggestionBody.
  ///
  /// In en, this message translates to:
  /// **'You usually log your 20:00 dose around 21:15. Move the reminder?'**
  String get weeklySuggestionBody;

  /// No description provided for @weeklyMoveReminder.
  ///
  /// In en, this message translates to:
  /// **'Move to 21:15'**
  String get weeklyMoveReminder;

  /// No description provided for @weeklyNotNow.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get weeklyNotNow;

  /// No description provided for @weeklyMon.
  ///
  /// In en, this message translates to:
  /// **'M'**
  String get weeklyMon;

  /// No description provided for @weeklyTue.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get weeklyTue;

  /// No description provided for @weeklyWed.
  ///
  /// In en, this message translates to:
  /// **'W'**
  String get weeklyWed;

  /// No description provided for @weeklyThu.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get weeklyThu;

  /// No description provided for @weeklyFri.
  ///
  /// In en, this message translates to:
  /// **'F'**
  String get weeklyFri;

  /// No description provided for @weeklySat.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get weeklySat;

  /// No description provided for @weeklySun.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get weeklySun;

  /// No description provided for @familyName.
  ///
  /// In en, this message translates to:
  /// **'Sharma Family'**
  String get familyName;

  /// No description provided for @familyOwnerSummary.
  ///
  /// In en, this message translates to:
  /// **'3 members · You are the owner'**
  String get familyOwnerSummary;

  /// No description provided for @familyProfiles.
  ///
  /// In en, this message translates to:
  /// **'PROFILES'**
  String get familyProfiles;

  /// No description provided for @familySelf.
  ///
  /// In en, this message translates to:
  /// **'Me (Sita)'**
  String get familySelf;

  /// No description provided for @familyMotherName.
  ///
  /// In en, this message translates to:
  /// **'Mother'**
  String get familyMotherName;

  /// No description provided for @familyBrotherName.
  ///
  /// In en, this message translates to:
  /// **'Brother (Rohan)'**
  String get familyBrotherName;

  /// No description provided for @familySelfSummary.
  ///
  /// In en, this message translates to:
  /// **'2 of 3 doses taken today'**
  String get familySelfSummary;

  /// No description provided for @familyMotherSummary.
  ///
  /// In en, this message translates to:
  /// **'1 of 3 taken · 1 missed'**
  String get familyMotherSummary;

  /// No description provided for @familyBrotherSummary.
  ///
  /// In en, this message translates to:
  /// **'Viewer · sees Mother only'**
  String get familyBrotherSummary;

  /// No description provided for @familyOnTrack.
  ///
  /// In en, this message translates to:
  /// **'On track'**
  String get familyOnTrack;

  /// No description provided for @familyAttention.
  ///
  /// In en, this message translates to:
  /// **'Needs attention'**
  String get familyAttention;

  /// No description provided for @familyInviteMember.
  ///
  /// In en, this message translates to:
  /// **'Invite family member'**
  String get familyInviteMember;

  /// No description provided for @familyJoinPrompt.
  ///
  /// In en, this message translates to:
  /// **'Have a code?'**
  String get familyJoinPrompt;

  /// No description provided for @inviteEditorDesc.
  ///
  /// In en, this message translates to:
  /// **'Editors can add medicines and manage stock and reminders.'**
  String get inviteEditorDesc;

  /// No description provided for @inviteRoleLabel.
  ///
  /// In en, this message translates to:
  /// **'Access role'**
  String get inviteRoleLabel;

  /// No description provided for @inviteShare.
  ///
  /// In en, this message translates to:
  /// **'Share invite'**
  String get inviteShare;

  /// No description provided for @inviteCopy.
  ///
  /// In en, this message translates to:
  /// **'Copy code'**
  String get inviteCopy;

  /// No description provided for @inviteCopied.
  ///
  /// In en, this message translates to:
  /// **'Invite code copied'**
  String get inviteCopied;

  /// No description provided for @inviteQrSemantics.
  ///
  /// In en, this message translates to:
  /// **'Mock invite QR code'**
  String get inviteQrSemantics;

  /// No description provided for @joinScanQr.
  ///
  /// In en, this message translates to:
  /// **'Scan QR code'**
  String get joinScanQr;

  /// No description provided for @joinCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Invite code'**
  String get joinCodeLabel;

  /// No description provided for @joinInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter the invite code to continue.'**
  String get joinInvalid;

  /// No description provided for @joinSuccess.
  ///
  /// In en, this message translates to:
  /// **'You joined the family.'**
  String get joinSuccess;

  /// No description provided for @memberMe.
  ///
  /// In en, this message translates to:
  /// **'Me'**
  String get memberMe;

  /// No description provided for @memberToday.
  ///
  /// In en, this message translates to:
  /// **'TODAY'**
  String get memberToday;

  /// No description provided for @memberAmlodipine.
  ///
  /// In en, this message translates to:
  /// **'Amlodipine'**
  String get memberAmlodipine;

  /// No description provided for @memberCalcium.
  ///
  /// In en, this message translates to:
  /// **'Calcium'**
  String get memberCalcium;

  /// No description provided for @memberAtorvastatin.
  ///
  /// In en, this message translates to:
  /// **'Atorvastatin'**
  String get memberAtorvastatin;

  /// No description provided for @memberAmlodipineStrength.
  ///
  /// In en, this message translates to:
  /// **'5 mg'**
  String get memberAmlodipineStrength;

  /// No description provided for @memberCalciumStrength.
  ///
  /// In en, this message translates to:
  /// **'500 mg'**
  String get memberCalciumStrength;

  /// No description provided for @memberAtorvastatinStrength.
  ///
  /// In en, this message translates to:
  /// **'10 mg'**
  String get memberAtorvastatinStrength;

  /// No description provided for @memberMissedAlert.
  ///
  /// In en, this message translates to:
  /// **'Calcium is low'**
  String get memberMissedAlert;

  /// No description provided for @memberMissedDetails.
  ///
  /// In en, this message translates to:
  /// **'Only 4 left. Plan a refill soon.'**
  String get memberMissedDetails;

  /// No description provided for @memberSeeAlerts.
  ///
  /// In en, this message translates to:
  /// **'See all alerts'**
  String get memberSeeAlerts;

  /// No description provided for @manageOwner.
  ///
  /// In en, this message translates to:
  /// **'Owner'**
  String get manageOwner;

  /// No description provided for @manageRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove member'**
  String get manageRemove;

  /// No description provided for @manageLeave.
  ///
  /// In en, this message translates to:
  /// **'Leave family'**
  String get manageLeave;

  /// No description provided for @manageLeaveConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Leave this family?'**
  String get manageLeaveConfirmTitle;

  /// No description provided for @manageLeaveConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'You will lose access to shared medicines and alerts.'**
  String get manageLeaveConfirmBody;

  /// No description provided for @manageViewDoses.
  ///
  /// In en, this message translates to:
  /// **'Viewers can see doses'**
  String get manageViewDoses;

  /// No description provided for @manageViewDosesDesc.
  ///
  /// In en, this message translates to:
  /// **'Taken, missed and skipped'**
  String get manageViewDosesDesc;

  /// No description provided for @manageEditMedicines.
  ///
  /// In en, this message translates to:
  /// **'Editors can add medicines'**
  String get manageEditMedicines;

  /// No description provided for @manageEditMedicinesDesc.
  ///
  /// In en, this message translates to:
  /// **'Add and edit stock and reminders'**
  String get manageEditMedicinesDesc;

  /// No description provided for @manageSendAlerts.
  ///
  /// In en, this message translates to:
  /// **'Send missed-dose alerts'**
  String get manageSendAlerts;

  /// No description provided for @manageSendAlertsDesc.
  ///
  /// In en, this message translates to:
  /// **'Push to owner and editors'**
  String get manageSendAlertsDesc;

  /// No description provided for @familyAlertsTitle.
  ///
  /// In en, this message translates to:
  /// **'Alerts'**
  String get familyAlertsTitle;

  /// No description provided for @familyAlertsFilter.
  ///
  /// In en, this message translates to:
  /// **'Filter alerts'**
  String get familyAlertsFilter;

  /// No description provided for @familyAlertsFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get familyAlertsFilterAll;

  /// No description provided for @familyAlertsFilterMissed.
  ///
  /// In en, this message translates to:
  /// **'Missed'**
  String get familyAlertsFilterMissed;

  /// No description provided for @familyAlertsFilterStock.
  ///
  /// In en, this message translates to:
  /// **'Low stock'**
  String get familyAlertsFilterStock;

  /// No description provided for @familyAlertsFilterExpired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get familyAlertsFilterExpired;

  /// No description provided for @familyAlertMissedMotherTitle.
  ///
  /// In en, this message translates to:
  /// **'Mother missed Calcium'**
  String get familyAlertMissedMotherTitle;

  /// No description provided for @familyAlertMissedMotherDetail.
  ///
  /// In en, this message translates to:
  /// **'Due at 13:00 · no dose logged'**
  String get familyAlertMissedMotherDetail;

  /// No description provided for @familyAlertLowMotherTitle.
  ///
  /// In en, this message translates to:
  /// **'Calcium is low for Mother'**
  String get familyAlertLowMotherTitle;

  /// No description provided for @familyAlertLowMotherDetail.
  ///
  /// In en, this message translates to:
  /// **'Only 4 left'**
  String get familyAlertLowMotherDetail;

  /// No description provided for @familyAlertTookMotherTitle.
  ///
  /// In en, this message translates to:
  /// **'Mother took Amlodipine'**
  String get familyAlertTookMotherTitle;

  /// No description provided for @familyAlertTookMotherDetail.
  ///
  /// In en, this message translates to:
  /// **'Logged at 08:05'**
  String get familyAlertTookMotherDetail;

  /// No description provided for @familyAlertExpiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Cough syrup has expired'**
  String get familyAlertExpiredTitle;

  /// No description provided for @familyAlertExpiredDetail.
  ///
  /// In en, this message translates to:
  /// **'In your cabinet · Exp 15 Aug 2026'**
  String get familyAlertExpiredDetail;

  /// No description provided for @familyAlertAgeOneHour.
  ///
  /// In en, this message translates to:
  /// **'1 h ago'**
  String get familyAlertAgeOneHour;

  /// No description provided for @familyAlertAgeTwoHours.
  ///
  /// In en, this message translates to:
  /// **'2 h ago'**
  String get familyAlertAgeTwoHours;

  /// No description provided for @familyAlertAgeToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get familyAlertAgeToday;

  /// No description provided for @familyAlertAgeYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get familyAlertAgeYesterday;

  /// No description provided for @alarmTaken.
  ///
  /// In en, this message translates to:
  /// **'Taken'**
  String get alarmTaken;

  /// No description provided for @alarmSnoozeTen.
  ///
  /// In en, this message translates to:
  /// **'Snooze 10 min'**
  String get alarmSnoozeTen;

  /// No description provided for @alarmMedicine.
  ///
  /// In en, this message translates to:
  /// **'Amoxicillin'**
  String get alarmMedicine;

  /// No description provided for @alarmDose.
  ///
  /// In en, this message translates to:
  /// **'500 mg · 1 capsule'**
  String get alarmDose;

  /// No description provided for @lockDate.
  ///
  /// In en, this message translates to:
  /// **'Saturday, 24 October'**
  String get lockDate;

  /// No description provided for @lockTime.
  ///
  /// In en, this message translates to:
  /// **'13:00'**
  String get lockTime;

  /// No description provided for @lockNow.
  ///
  /// In en, this message translates to:
  /// **'now'**
  String get lockNow;

  /// No description provided for @lockNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Time for Amoxicillin'**
  String get lockNotificationTitle;

  /// No description provided for @lockNotificationDetails.
  ///
  /// In en, this message translates to:
  /// **'500 mg · 1 capsule · 13:00'**
  String get lockNotificationDetails;

  /// No description provided for @lockOpenHint.
  ///
  /// In en, this message translates to:
  /// **'Tap the notification to open the alarm screen.'**
  String get lockOpenHint;

  /// No description provided for @snooze5.
  ///
  /// In en, this message translates to:
  /// **'5 minutes'**
  String get snooze5;

  /// No description provided for @snooze10.
  ///
  /// In en, this message translates to:
  /// **'10 minutes'**
  String get snooze10;

  /// No description provided for @snooze15.
  ///
  /// In en, this message translates to:
  /// **'15 minutes'**
  String get snooze15;

  /// No description provided for @snoozeCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get snoozeCancel;

  /// No description provided for @duplicateMedicineTitle.
  ///
  /// In en, this message translates to:
  /// **'Possible duplicate'**
  String get duplicateMedicineTitle;

  /// No description provided for @duplicateMedicineMessage.
  ///
  /// In en, this message translates to:
  /// **'A similar medicine, {name}, is already in your cabinet. Do you want to save this one too?'**
  String duplicateMedicineMessage(String name);

  /// No description provided for @duplicateMedicineContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue anyway'**
  String get duplicateMedicineContinue;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ne'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ne':
      return AppLocalizationsNe();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
