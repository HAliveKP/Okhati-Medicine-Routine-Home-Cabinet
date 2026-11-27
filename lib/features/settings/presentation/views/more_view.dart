import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/spacing.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return ColoredBox(
      color: AppColors.background,
      child: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.pageInset),
          children: [
            Text(l10n.moreTitle, style: AppTypography.headingLarge),
            const SizedBox(height: AppSpacing.l),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: Text(l10n.moreSettings),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go(AppRoutes.settings),
            ),
          ],
        ),
      ),
    );
  }
}
