import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:okhati/core/router/home_shell.dart';
import 'package:okhati/core/theme/app_theme.dart';
import 'package:okhati/l10n/app_localizations.dart';

class OkhatiApp extends StatelessWidget {
  const OkhatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Okhati',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      // TODO(D): add dark + high-contrast + text-scale from user settings.
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomeShell(),
    );
  }
}
