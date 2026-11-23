import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/di/providers.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_pill.dart';
import '../../../../core/widgets/language_button.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({
    super.key,
    required this.profileName,
    required this.settings,
  });

  final String profileName;
  final AppSettingsController settings;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 12, top: 4, bottom: 4),
      child: Row(
        children: [
          Expanded(
            child: _Greeting(profileName: profileName, l10n: l10n),
          ),
          AppPill(
            label: l10n.profileMe,
            trailingIcon: Icons.keyboard_arrow_down,
            onTap: () => context.go(AppRoutes.member('mother')),
          ),
          const SizedBox(width: 8),
          LanguageButton(
            onTap: settings.toggleLocale,
            tooltip: l10n.languageToggleTooltip,
          ),
          const SizedBox(width: 4),
          IconButton(
            onPressed: () => context.go(AppRoutes.lockScreenNotification),
            icon: const Icon(Icons.notifications_none, size: 24),
            color: AppColors.textPrimary,
            tooltip: l10n.todayNotifications,
          ),
        ],
      ),
    );
  }
}

class _Greeting extends StatelessWidget {
  const _Greeting({required this.profileName, required this.l10n});

  final String profileName;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        l10n.todayGreeting,
        style: AppTypography.body.copyWith(color: AppColors.textSecondary),
      ),
      Text(
        profileName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTypography.title.copyWith(
          fontSize: 22,
          height: 31 / 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
