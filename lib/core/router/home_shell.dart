import 'package:flutter/material.dart';
import 'package:okhati/l10n/app_localizations.dart';

/// Max 4 tabs: Today, Cabinet, Family, More.
class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final titles = [t.tabToday, t.tabCabinet, t.tabFamily, t.tabMore];

    return Scaffold(
      appBar: AppBar(title: Text(titles[_index])),
      // TODO: replace placeholders with feature presentation screens.
      body: Center(child: Text(titles[_index])),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.today_outlined),
            label: t.tabToday,
          ),
          NavigationDestination(
            icon: const Icon(Icons.medication_outlined),
            label: t.tabCabinet,
          ),
          NavigationDestination(
            icon: const Icon(Icons.family_restroom_outlined),
            label: t.tabFamily,
          ),
          NavigationDestination(
            icon: const Icon(Icons.more_horiz),
            label: t.tabMore,
          ),
        ],
      ),
    );
  }
}
