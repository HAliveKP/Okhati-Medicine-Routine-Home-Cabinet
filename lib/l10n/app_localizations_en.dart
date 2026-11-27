// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Okhati';

  @override
  String get tabToday => 'Today';

  @override
  String get tabCabinet => 'Cabinet';

  @override
  String get tabFamily => 'Family';

  @override
  String get tabMore => 'More';

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
  String get actionTaken => 'Taken';

  @override
  String get actionSnooze => 'Snooze';

  @override
  String get aiDisclaimer =>
      'AI can make mistakes. This app does not give medical advice.';

  @override
  String get historyTitle => 'History';

  @override
  String get exportPdf => 'Export PDF';

  @override
  String get selectDateRange => 'Select Date Range';

  @override
  String get noLogsInRange => 'No dose logs found in selected date range.';

  @override
  String get pdfTitle => 'Dose History Report';

  @override
  String get profileLabel => 'Profile';

  @override
  String get dateRangeLabel => 'Date Range';

  @override
  String get adherenceLabel => 'Adherence';

  @override
  String get tableDate => 'Date';

  @override
  String get tableTime => 'Time';

  @override
  String get tableMedicine => 'Medicine';

  @override
  String get tableStatus => 'Status';

  @override
  String get statusTaken => 'Taken';

  @override
  String get statusMissed => 'Missed';

  @override
  String get statusSkipped => 'Skipped';

  @override
  String get pdfFooter => 'Recorded data only, not medical advice';
}
