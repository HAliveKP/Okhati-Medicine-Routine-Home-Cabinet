// Pure date/time formatting helpers. No Flutter, no UI.
import 'package:intl/intl.dart';

/// Format a time as HH:mm in the device locale.
String hhmm(DateTime time) => DateFormat.Hm().format(time);

/// Format a date as "dd MMM yyyy" (e.g. 18 Jan 2027).
String dmY(DateTime day) => DateFormat('dd MMM yyyy').format(day);

/// Format a date as a short weekday (e.g. Mon).
String weekdayE(DateTime day) => DateFormat.E().format(day);

/// Format a date as month + year (e.g. Jan 2027) in [locale].
String monthYear(DateTime day, String locale) =>
    DateFormat('MMM yyyy', locale).format(day);
