import 'package:material_ui/material_ui.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../domain/models/dose_log_request.dart';
import '../../domain/repositories/dose_action_repository.dart';

/// Demonstrates the notification action result in-app for this UI prototype.
class ReminderActionDemo extends StatefulWidget {
  const ReminderActionDemo({super.key, required this.repository});

  final DoseActionRepository repository;

  @override
  State<ReminderActionDemo> createState() => _ReminderActionDemoState();
}

class _ReminderActionDemoState extends State<ReminderActionDemo> {
  String? _confirmation;

  Future<void> _taken() async {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final bool logged = await widget.repository.recordTaken(
      const DoseLogRequest(
        medicineId: 'demo-medicine',
        scheduleId: 'demo-schedule',
        profileId: 'demo-profile',
        scheduledAt: DateTime.utc(2026, 1, 1, 8),
        doseAmount: 1,
        loggedBy: 'demo-profile',
      ),
    );
    if (mounted) {
      setState(
        () => _confirmation = logged
            ? l10n.doseMarkedTaken
            : l10n.doseAlreadyLogged,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FilledButton(onPressed: _taken, child: Text(l10n.alarmTaken)),
        TextButton(onPressed: () {}, child: Text(l10n.doseSkip)),
        if (_confirmation != null) Text(_confirmation!),
      ],
    );
  }
}
