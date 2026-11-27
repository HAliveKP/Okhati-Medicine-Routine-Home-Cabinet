// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Nepali (`ne`).
class AppLocalizationsNe extends AppLocalizations {
  AppLocalizationsNe([String locale = 'ne']) : super(locale);

  @override
  String get appName => 'ओखती';

  @override
  String get tabToday => 'आज';

  @override
  String get tabCabinet => 'औषधि दराज';

  @override
  String get tabFamily => 'परिवार';

  @override
  String get tabMore => 'थप';

  @override
  String get statusGood => 'ठीक';

  @override
  String get statusDue => 'समय भयो';

  @override
  String get statusLowStock => 'कम बाँकी';

  @override
  String get statusExpiring => 'म्याद सकिँदै';

  @override
  String get statusExpired => 'म्याद सकियो';

  @override
  String get actionTaken => 'खाएँ';

  @override
  String get actionSnooze => 'पछि सम्झाउनुहोस्';

  @override
  String get aiDisclaimer =>
      'एआईले गल्ती गर्न सक्छ। यो एपले चिकित्सकीय सल्लाह दिँदैन।';

  @override
  String get historyTitle => 'इतिहास';

  @override
  String get exportPdf => 'पीडिएफ निर्यात गर्नुहोस्';

  @override
  String get selectDateRange => 'मिति दायरा चयन गर्नुहोस्';

  @override
  String get noLogsInRange =>
      'चयन गरिएको मिति दायरामा कुनै खुराक रेकर्ड फेला परेन।';

  @override
  String get pdfTitle => 'खुराक इतिहास प्रतिवेदन';

  @override
  String get profileLabel => 'प्रोफाइल';

  @override
  String get dateRangeLabel => 'मिति दायरा';

  @override
  String get adherenceLabel => 'पालना दर';

  @override
  String get tableDate => 'मिति';

  @override
  String get tableTime => 'समय';

  @override
  String get tableMedicine => 'औषधि';

  @override
  String get tableStatus => 'स्थिति';

  @override
  String get statusTaken => 'खायो';

  @override
  String get statusMissed => 'छुटेको';

  @override
  String get statusSkipped => 'छोडेको';

  @override
  String get pdfFooter => 'रेकर्ड गरिएको डाटा मात्र, चिकित्सकीय सल्लाह होइन';
}
