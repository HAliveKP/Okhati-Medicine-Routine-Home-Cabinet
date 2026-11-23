// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Nepali (`ne`).
class AppLocalizationsNe extends AppLocalizations {
  AppLocalizationsNe([String locale = 'ne']) : super(locale);

  @override
  String get appTitle => 'ओखती';

  @override
  String get todayTitle => 'आज';

  @override
  String get todayGreeting => 'शुभ प्रभात';

  @override
  String get todayCabinetLabel => 'औषधि दराज';

  @override
  String todayCabinetCount(int count) {
    return '$count औषधि';
  }

  @override
  String get todayWeeklyInsight => 'यस हप्ताको अन्तर्दृष्टि · AI';

  @override
  String get todayAdd => 'थप्नुहोस्';

  @override
  String get todayScan => 'स्क्यान';

  @override
  String get todayHistory => 'इतिहास';

  @override
  String get todayMediGuide => 'मिडीगाइड';

  @override
  String get cabinetTitle => 'मेरा औषधिहरू';

  @override
  String get cabinetSearch => 'खोज्नुहोस्';

  @override
  String get cabinetFilterAll => 'सबै';

  @override
  String get cabinetFilterLow => 'कम';

  @override
  String get cabinetFilterExpiring => 'समाप्त हुन लागेका';

  @override
  String get cabinetFilterExpired => 'समाप्त भएका';

  @override
  String get cabinetEmptyTitle => 'कुनै औषधि फेला परेन';

  @override
  String get cabinetEmptyBody =>
      'हिज्जे जाँच गर्नुहोस्, वा यो औषधि आफ्नो दराजमा थप्नुहोस्।';

  @override
  String get cabinetAdd => 'औषधि थप्नुहोस्';

  @override
  String get cabinetBack => 'दराजमा फर्कनुहोस्';

  @override
  String get medicineDetailsEdit => 'सम्पादन गर्नुहोस्';

  @override
  String get medicineDetailsDoseOnLabel => 'लेबलमा खुराक';

  @override
  String get medicineDetailsNotDiagnosis => 'रोग निदान होइन';

  @override
  String get medicineDetailsLast7Days => 'गएको ७ दिन';

  @override
  String get medicineDetailsMarkTaken => 'खुराक लिइएको चिन्ह लगाउनुहोस्';

  @override
  String get addMedicineTitle => 'औषधि थप्नुहोस्';

  @override
  String get addMedicineMedicineName => 'औषधिको नाम';

  @override
  String get addMedicineStrength => 'शक्ति';

  @override
  String get addMedicineQuantity => 'मात्रा';

  @override
  String get addMedicineExpiryDate => 'मिति सकिने';

  @override
  String get addMedicineConditionTag => 'अवस्था ट्याग (वैकल्पिक)';

  @override
  String get addMedicineSetReminder => 'याद दिलाउने सेट गर्नुहोस्';

  @override
  String get addMedicineSave => 'औषधि जतन गर्नुहोस्';

  @override
  String get addMedicineScanPackage => 'प्याकेज स्क्यान गर्नुहोस्';

  @override
  String get scanTitle => 'प्याकेज स्क्यान गर्नुहोस्';

  @override
  String get scanConfirm => 'विवरण पुष्टि गर्नुहोस्';

  @override
  String get scanNotWorking =>
      'स्क्यान काम गरिरहेको छैन? म्यानुअली प्रविष्टि गर्न पेनिल क्लिक गर्नुहोस्।';

  @override
  String get scanConfirmAiNotice =>
      'यो एआईद्वारा पढिएको खस्रो प्रतिलिपि हो। हरेक क्षेत्र जाँच गर्नुहोस्। पुष्टि गर्दासम्म केही जतन हुन्न।';

  @override
  String get scanConfirmAiMistakes => 'एआईले गल्ती गर्न सक्छ।';

  @override
  String get scheduleEditorTitle => 'रिमाइन्डर';

  @override
  String get scheduleEditorTimes => 'समय';

  @override
  String get scheduleEditorAddTime => 'समय थप्नुहोस्';

  @override
  String get scheduleEditorDays => 'दिन';

  @override
  String get scheduleEditorDoseAmount => 'खुराक मात्रा';

  @override
  String get scheduleEditorAlertStyle => 'सूचना शैली';

  @override
  String get scheduleEditorNeverSuggests =>
      'लेबल वा प्रिस्क्रिप्शनमा छापिएको मात्रा प्रयोग गर्नुहोस्। ओखतीले कुनै पनि खुराक सुझाव दिनँदैन।';

  @override
  String get conditionTagsTitle => 'अवस्था ट्याग';

  @override
  String get conditionTagsSubtitle =>
      'तपाईंले किन यो औषधि लिनुहुन्छ, लेबल गर्नुहोस्। यो मात्र एउटा ट्याग हो, रोग निदान होइन।';

  @override
  String get conditionTagsSearch => 'खोज्नुहोस् वा सिर्जना गर्नुहोस्';

  @override
  String get conditionTagsNewTag => 'नयाँ ट्याग सिर्जना गर्नुहोस्';

  @override
  String get addMedicineScanSubtitle => 'फोटोबाट नाम र म्याद भर्नुहोस्';

  @override
  String get conditionTagCold => 'रुघाखोकी';

  @override
  String get conditionTagAllergy => 'एलर्जी';

  @override
  String get conditionTagPain => 'दुखाइ';

  @override
  String get conditionTagVitamin => 'भिटामिन';

  @override
  String get conditionTagBloodPressure => 'रक्तचाप';

  @override
  String get scanCapture => 'प्याकेटको तस्बिर लिनुहोस्';

  @override
  String get scanFlash => 'फ्ल्यास बदल्नुहोस्';

  @override
  String get scanManualEntry => 'म्यानुअल रूपमा भर्नुहोस्';

  @override
  String get scanConfirmSave => 'पुष्टि गरेर सुरक्षित गर्नुहोस्';

  @override
  String get scanConfirmEditManual => 'म्यानुअल रूपमा सम्पादन गर्नुहोस्';

  @override
  String get scanConfirmRequired => 'आवश्यक छ';

  @override
  String get scanConfirmLowConfidence => 'विश्वास कम छ — यो जाँच गर्नुहोस्';

  @override
  String get scheduleAlarm => 'अलार्म';

  @override
  String get scheduleNotification => 'सूचना';

  @override
  String scheduleDoseUnit(Object count) {
    return '$count क्याप्सुल';
  }

  @override
  String get scheduleWeekdayMonday => 'सो';

  @override
  String get scheduleWeekdayTuesday => 'मं';

  @override
  String get scheduleWeekdayWednesday => 'बु';

  @override
  String get scheduleWeekdayThursday => 'बि';

  @override
  String get scheduleWeekdayFriday => 'शु';

  @override
  String get scheduleWeekdaySaturday => 'श';

  @override
  String get scheduleWeekdaySunday => 'आ';

  @override
  String get historyTitle => 'इतिहास';

  @override
  String get historyTakenThisWeek => 'यस हप्ता लिइएको';

  @override
  String get historyAdherence => 'पालना';

  @override
  String get weeklyInsightTitle => 'साप्ताहिक सारांश';

  @override
  String get weeklyInsightAiSummary => 'ओखती सारांश · AI';

  @override
  String get weeklyInsightDisclaimer =>
      'तपाईंको लगआईतेजानकारीमा आधारित। चिकित्सा सल्लाह होइन। एआईले गल्ती गर्न सक्छ।';

  @override
  String get familyTitle => 'परिवार';

  @override
  String get familyInvite => 'निमन्त्रणा';

  @override
  String get familyManageMembers => 'सदस्यहरू व्यवस्थापन गर्नुहोस्';

  @override
  String get familyJoin => 'कोड छ?';

  @override
  String get familyJoinFamily => 'परिवारमा सामेल हुनुहोस्';

  @override
  String get familyMemberView => 'सदस्य विवरण';

  @override
  String get familyFamilyAlerts => 'सूचनाहरू';

  @override
  String get inviteTitle => 'कसैलाई निमन्त्रणा गर्नुहोस्';

  @override
  String get inviteViewer => 'हेर्ने';

  @override
  String get inviteEditor => 'सम्पादक';

  @override
  String get inviteViewerDesc =>
      'हेर्नेले खुराक र स्टक हेर्न सक्छन् तर केही परिवर्तन गर्न सक्दैनन्।';

  @override
  String get inviteExpires => '24 घण्टामा सकिन्छ · एक पटक मात्र काम गर्छ';

  @override
  String get joinTitle => 'परिवारमा सामेल हुनुहोस्';

  @override
  String get joinSubtitle =>
      'तपाईंले पाएको कोड प्रविष्ट गर्नुहोस्, वा तपाईंलाई निमन्त्रणा गर्ने व्यक्तिले दिएको क्यूआर स्क्यान गर्नुहोस्।';

  @override
  String get joinNotice =>
      'तपाईं मालिकद्वारा छानिएको भूमिकामा सामेल हुनुहुन्छ। उनीहरुले कुनै पनि समयमा त्यसलाई परिवर्तन वा हटाउन सक्छन्।';

  @override
  String get memberTitle => 'आमाहरू';

  @override
  String get memberViewing =>
      'तपाईं आमाको औषधिहरू हेर्दै हुनुहुन्छ। हेर्नेले सम्पादन गर्न सक्दैनन्।';

  @override
  String memberLowStock(String name) {
    return '$name कम छ';
  }

  @override
  String memberRefillSoon(int count) {
    return 'मात्र $count बाँकी छन्। चाँडो रिफिल गर्नुहोस्।';
  }

  @override
  String get manageMembersTitle => 'सदस्यहरू व्यवस्थापन गर्नुहोस्';

  @override
  String get manageMembersMembers => 'सदस्यहरू';

  @override
  String get manageMembersPrivacy => 'गोपनीयता';

  @override
  String get moreTitle => 'अधिक';

  @override
  String get moreHistory => 'इतिहास';

  @override
  String get moreMediGuide => 'मिडीगाइड';

  @override
  String get moreNotificationSettings => 'सूचना सेटिङ';

  @override
  String get moreSettings => 'सेटिङहरू';

  @override
  String get morePrivacyAndData => 'गोपनीयता र तथ्याङ्क';

  @override
  String get moreLanguage => 'भाषा';

  @override
  String get moreEnglish => 'English';

  @override
  String get moreNepali => 'नेपाली';

  @override
  String get moreVersion => 'ओखती संस्करण १.० · चिकित्सा सल्लाहको विकल्प होइन';

  @override
  String get settingsTitle => 'सेटिङहरू';

  @override
  String get settingsLanguage => 'भाषा';

  @override
  String get settingsTextSize => 'दृश्यीकरण';

  @override
  String get settingsTextSizeLabel => 'पाठको आकार';

  @override
  String get settingsHighContrast => 'उच्च contraste';

  @override
  String get settingsHighContrastDesc => 'बलियो रङ र सीमाहरू';

  @override
  String get settingsReadAloud => 'आज पढ्नुहोस्';

  @override
  String get settingsReadAloudDesc => 'आजको स्क्रिनमा पाठ-से-भाषण';

  @override
  String get settingsAccount => 'खाता';

  @override
  String get settingsLogOut => 'लग आउट';

  @override
  String get settingsDeleteAccount => 'खाता हटाउनुहोस्';

  @override
  String get notificationSettingsTitle => 'सूचनाहरू';

  @override
  String get notificationSettingsQuietHours => 'शान्त घण्टाहरू';

  @override
  String get notificationSettingsQuietHoursLabel => 'शान्त घण्टाहरू';

  @override
  String get notificationSettingsQuietHoursDesc =>
      'राति १०:०० – बिहान ७:०० · गैर-जरुरी अलर्टको आवाज नहुनु';

  @override
  String get notificationSettingsLowStockAlerts => 'कम स्टक अलर्ट';

  @override
  String get notificationSettingsExpiryWarnings => 'मिति सकिने चेतावनी';

  @override
  String get privacyAndDataTitle => 'गोपनीयता र तथ्याङ्क';

  @override
  String get privacyAndDataStored => 'तपाईंको खातामा जतन गरिएको';

  @override
  String get privacyAndDataSentToAI =>
      'एआईमा पठाइएको (तपाईं प्रयोग गर्दा मात्र)';

  @override
  String get privacyAndDataNeverSent => 'कभै पठाइँदैन';

  @override
  String get deleteAccountTitle => 'खाता हटाउनुहोस्';

  @override
  String get deleteAccountConfirm => 'आफ्नो खाता हटाउन चाहनुहुन्छ?';

  @override
  String get deleteAccountDesc =>
      'यसले तपाईंका औषधिहरू, खुराक इतिहास र तस्बिरहरू ओखतीबाट हटाउँछ। यदि तपाईं परिवारका मालिक हुनुहुन्छ भन्दा, पहिले मालिकत्व हस्तान्तरण गर्नुहोस्।';

  @override
  String get deleteAccountCheckbox => 'म बुझ्छु, यो प्रयोग गर्न सकिँदैन।';

  @override
  String lockScreenTitle(String name) {
    return '$name को समय भयो';
  }

  @override
  String lockScreenDetails(String strength, String time) {
    return '$strength · $time';
  }

  @override
  String get alarmTitle => 'औषधि लिने समय';

  @override
  String get alarmTime => '१३:००';

  @override
  String get snoozeTitle => 'फेरि कतिपछि सम्झाउने?';

  @override
  String get permissionsTitle => 'ओखतीलाई के आवश्यक छ अनुमति दिनुहोस्';

  @override
  String get signInTitle => 'फेरि स्वागत छ';

  @override
  String get signUpTitle => 'खाता बनाउनुहोस्';

  @override
  String get onboarding1Title => 'आज के खान्े थाहा पाउनुहोस्';

  @override
  String get onboarding2Title => 'तपाईंको दराजमा के छ हेरौँ';

  @override
  String get onboarding3Title => 'सुरक्षित रूपमा परिवारसँग साझा गर्नुहोस्';

  @override
  String get languageTitle => 'भाषा छान्नुहोस्';

  @override
  String get permissionsSubtitle =>
      'हामीले तपाईंको दिनचर्याका लागि आवश्यक छ त्यो मात्र सोध्छौँ। तपाईं पछि परिवर्तन गर्न सक्नुहुन्छ।';

  @override
  String get splashTagline =>
      'तपाईंको औषधि दिनचर्या र घरको औषधि दराज, एउटै ठाउँमा।';

  @override
  String get splashBrandNepali => 'ओखती';

  @override
  String get languageNepaliTitle => 'नेपाली';

  @override
  String get languageNepaliPrompt => 'भाषा छान्नुहोस्';

  @override
  String get languageNepaliName => 'नेपाली';

  @override
  String get languageEnglishSubtitle => 'एपलाई अङ्ग्रेजीमा प्रयोग गर्नुहोस्';

  @override
  String get languageNepaliSubtitle => 'एपलाई नेपालीमा प्रयोग गर्नुहोस्';

  @override
  String get languageChangeNote =>
      'तपाईं सेटिङमा जुनसुकै बेला भाषा परिवर्तन गर्न सक्नुहुन्छ।';

  @override
  String get onboarding1Body =>
      'एउटै Today पर्दामा हरेक मात्रा, तपाईंले लिइसकेको औषधि र अब आउने औषधि देखिन्छ।';

  @override
  String get onboarding2Body =>
      'बाँकी मात्रा हेर्नुहोस्, कम स्टकको चेतावनी पाउनुहोस् र म्याद सकिएको औषधि प्रयोग हुन नदिनुहोस्।';

  @override
  String get onboarding3Body =>
      'अभिभावकलाई औषधि समयमै लिन सहयोग गर्नुहोस्। मात्रा हेर्नुहोस् र छुटेमा सूचना पाउनुहोस्।';

  @override
  String get onboardingGetStarted => 'सुरु गर्नुहोस्';

  @override
  String get permissionsNotifications => 'सूचनाहरू';

  @override
  String get permissionsNotificationsBody => 'मात्रा लिने समय हुँदा सम्झाउन।';

  @override
  String get permissionsAlarms => 'ठ्याक्कै समयका अलार्म';

  @override
  String get permissionsAlarmsBody =>
      'इन्टरनेट नभए पनि वा फोन फेरि सुरु हुँदा पनि समयमा सम्झना आउन।';

  @override
  String get permissionsCamera => 'क्यामेरा';

  @override
  String get permissionsCameraBody => 'औषधिको प्याकेट स्क्यान गर्दा मात्र।';

  @override
  String get permissionsAllowContinue => 'अनुमति दिएर जारी राख्नुहोस्';

  @override
  String get permissionsNotNow => 'अहिले होइन';

  @override
  String get authSignInSubtitle => 'आजका औषधि हेर्न साइन इन गर्नुहोस्।';

  @override
  String get authSignUpSubtitle =>
      'एक मिनेटभन्दा कम लाग्छ। एपलाई चाहिने जानकारी मात्र राखिन्छ।';

  @override
  String get authEmail => 'इमेल';

  @override
  String get authEmailHint => 'name@example.com';

  @override
  String get authPassword => 'पासवर्ड';

  @override
  String get authPasswordHint => 'कम्तीमा ८ अक्षर';

  @override
  String get authShowPassword => 'पासवर्ड देखाउनुहोस्';

  @override
  String get authHidePassword => 'पासवर्ड लुकाउनुहोस्';

  @override
  String get authFullName => 'पूरा नाम';

  @override
  String get authNameHint => 'तपाईंको नाम';

  @override
  String get authSignIn => 'साइन इन';

  @override
  String get authContinueGoogle => 'Google बाट जारी राख्नुहोस्';

  @override
  String get authOr => 'वा';

  @override
  String get authNewToOkhati => 'ओखतीमा नयाँ हुनुहुन्छ?';

  @override
  String get authCreateAccount => 'खाता बनाउनुहोस्';

  @override
  String get authAlreadyHaveAccount => 'पहिल्यै खाता छ?';

  @override
  String get authPrivacyConsent =>
      'ओखतीले राख्ने र एआई सुविधामा पठाउने तथ्याङ्क मैले बुझेँ।';

  @override
  String get authDemoNotice =>
      'डेमो मोड: खाता कार्यहरू कुनै सेवासँग जोडिएका छैनन्।';

  @override
  String get authInvalidForm =>
      'सही इमेल र कम्तीमा ८ अक्षरको पासवर्ड लेख्नुहोस्।';

  @override
  String get statusGood => 'राम्रो';

  @override
  String get statusDue => 'बाँकी';

  @override
  String get statusLowStock => 'कम स्टक';

  @override
  String get statusExpiring => 'सकिन लागेको';

  @override
  String get statusExpired => 'सकिएको';

  @override
  String get commonTryAgain => 'फेरि प्रयास गर्नुहोस्';

  @override
  String get commonCancel => 'रद्द गर्नुहोस्';

  @override
  String get commonSave => 'जतन गर्नुहोस्';

  @override
  String get commonDelete => 'हटाउनुहोस्';

  @override
  String get commonDone => 'भयो';

  @override
  String get commonBack => 'पछाडि';

  @override
  String get commonNext => 'अर्को';

  @override
  String get commonSkip => 'छोड्नुहोस्';

  @override
  String get commonSearch => 'खोज्नुहोस्';

  @override
  String get commonClose => 'बन्द गर्नुहोस्';

  @override
  String get commonAdd => 'थप्नुहोस्';

  @override
  String get commonEdit => 'सम्पादन गर्नुहोस्';

  @override
  String get commonRetry => 'पुनः प्रयास';

  @override
  String get commonLoading => 'लोड हुँदैछ…';

  @override
  String get commonEmpty => 'यहाँ अझै केही छैन';

  @override
  String get commonErrorTitle => 'केही गडबड भयो';

  @override
  String get commonErrorBody => 'कृपया फेरि प्रयास गर्नुहोस्।';

  @override
  String medicineCardMeta(int count, String date) {
    return '$count बाँकी · म्याद $date';
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
    return 'औषधि $name, विवरण $details, अवस्था $status';
  }

  @override
  String get navToday => 'आज';

  @override
  String get navCabinet => 'दराज';

  @override
  String get navFamily => 'परिवार';

  @override
  String get navMore => 'अधिक';

  @override
  String get todayEmptyTitle => 'आज केही तय भएको छैन';

  @override
  String get todayEmptyBody =>
      'यहाँ देख्न औषधि थप्नुहोस् र रिमाइन्डर सेट गर्नुहोस्।';

  @override
  String get todayNotifications => 'सूचनाहरू';

  @override
  String get todayLabel => 'आज';

  @override
  String get todayInsightBody =>
      'तपाईंले यस हप्ता ९०% खुराक लिनुभयो। साँझको खुराक दुई पटक छुट्यो।';

  @override
  String get doseTaken => 'लिइयो';

  @override
  String get doseUpcoming => 'आउँदै';

  @override
  String get doseSnooze => 'पछि';

  @override
  String get profileMe => 'म';

  @override
  String get languageSwitchLabel => 'EN';

  @override
  String doseDetail(String strength, String doseLabel) {
    return '$strength · $doseLabel';
  }

  @override
  String get languageToggleTooltip => 'भाषा परिवर्तन गर्नुहोस्';

  @override
  String get medicineDetailsLeft => 'बाँकी';

  @override
  String get medicineDetailsExpires => 'म्याद सकिने';

  @override
  String get medicineDetailsAlertAt => 'सूचना सीमा';

  @override
  String get medicineDetailsConditionTag => 'अवस्था ट्याग';

  @override
  String get medicineDetailsReminders => 'रिमाइन्डरहरू';

  @override
  String medicineDetailsTakenMissed(int taken, int missed) {
    return '$taken लिइयो · $missed छुट्यो';
  }

  @override
  String medicineDetailsFormTag(String form, String tag) {
    return '$form · ट्याग: $tag';
  }

  @override
  String medicineDetailsFormOnly(String form) {
    return '$form';
  }

  @override
  String get medicineDetailsDaily => 'दैनिक';

  @override
  String get medicineDetailsNotSet => 'सेट गरिएको छैन';

  @override
  String get medicineDetailsTakenSnack => 'खुराक लिइएको रेकर्ड भयो';

  @override
  String get medicineDetailsNoDoses => 'खुराक बाँकी छैन';

  @override
  String get medicineDetailsDoseDisclaimer =>
      'तपाईंको प्याकेजबाट प्रतिलिपि गरिएको। ओखतीले कहिल्यै खुराक सुझाव दिँदैन।';

  @override
  String get historyTakenCount => '१९ पटक लिइयो';

  @override
  String get historyMissedCount => '१ छुट्यो';

  @override
  String get historySkippedCount => '१ छोडियो';

  @override
  String get historyFilter7Days => '७ दिन';

  @override
  String get historyFilter30Days => '३० दिन';

  @override
  String get historyFilterAll => 'सबै';

  @override
  String get historyFilterMissed => 'छुटेका';

  @override
  String get historyToday => 'आज';

  @override
  String get historyYesterday => 'हिजो';

  @override
  String get historyDownload => 'इतिहास डाउनलोड गर्नुहोस्';

  @override
  String get historyExportDemo => 'डेमो विवरण निर्यात गर्न मिल्दैन।';

  @override
  String get historyTime8 => '०८:००';

  @override
  String get historyTime13 => '१३:००';

  @override
  String get historyTime20 => '२०:००';

  @override
  String get historyMedicineCetirizine => 'सेटिरिजिन';

  @override
  String get historyMedicineAmoxicillin => 'अमोक्सिसिलिन';

  @override
  String get historyMedicineVitamin => 'भिटामिन डी३';

  @override
  String get historyStrength10mg => '१० मि.ग्रा.';

  @override
  String get historyStrength500mg => '५०० मि.ग्रा.';

  @override
  String get historyStrength1000iu => '१००० आइयु';

  @override
  String get historyStatusTaken => 'लिइयो';

  @override
  String get historyStatusDue => 'बाँकी';

  @override
  String get historyStatusMissed => 'छुट्यो';

  @override
  String get historyStatusSkipped => 'छोडियो';

  @override
  String get weeklyTitle => 'साप्ताहिक सारांश';

  @override
  String get weeklyDateRange => 'सोम १२ – आइत १८ अक्टोबर';

  @override
  String get weeklyTaken => 'लिइयो';

  @override
  String get weeklyMissed => 'छुट्यो';

  @override
  String get weeklyLowStock => 'कम स्टक';

  @override
  String get weeklyDosesPerDay => 'दिनमा लिइएका खुराक';

  @override
  String get weeklyInsightBody =>
      'तपाईंले यस हप्ता ९०% खुराक लिनुभयो। साँझका खुराक दुई पटक छुटे। अमोक्सिसिलिन ६ वटा मात्र बाँकी छ।';

  @override
  String get weeklyDisclaimer =>
      'तपाईंको अभिलेखमा आधारित। चिकित्सा सल्लाह होइन। AI ले गल्ती गर्न सक्छ।';

  @override
  String get weeklySuggestionTitle => 'सुझाव';

  @override
  String get weeklySuggestionBody =>
      'तपाईंले प्रायः २०:०० को खुराक २१:१५ मा लेख्नुहुन्छ। रिमाइन्डर सार्ने?';

  @override
  String get weeklyMoveReminder => '२१:१५ मा सार्नुहोस्';

  @override
  String get weeklyNotNow => 'अहिले होइन';

  @override
  String get weeklyMon => 'सो';

  @override
  String get weeklyTue => 'मं';

  @override
  String get weeklyWed => 'बु';

  @override
  String get weeklyThu => 'बि';

  @override
  String get weeklyFri => 'शु';

  @override
  String get weeklySat => 'श';

  @override
  String get weeklySun => 'आ';

  @override
  String get alarmTaken => 'लिइयो';

  @override
  String get alarmSnoozeTen => '१० मिनेटपछि';

  @override
  String get alarmMedicine => 'अमोक्सिसिलिन';

  @override
  String get alarmDose => '५०० मि.ग्रा. · १ क्याप्सुल';

  @override
  String get lockDate => 'शनिबार, २४ अक्टोबर';

  @override
  String get lockTime => '१३:००';

  @override
  String get lockNow => 'अहिले';

  @override
  String get lockNotificationTitle => 'अमोक्सिसिलिन लिने समय';

  @override
  String get lockNotificationDetails => '५०० मि.ग्रा. · १ क्याप्सुल · १३:००';

  @override
  String get lockOpenHint => 'अलार्म खोल्न सूचनामा थिच्नुहोस्।';

  @override
  String get snooze5 => '५ मिनेट';

  @override
  String get snooze10 => '१० मिनेट';

  @override
  String get snooze15 => '१५ मिनेट';

  @override
  String get snoozeCancel => 'रद्द गर्नुहोस्';
}
