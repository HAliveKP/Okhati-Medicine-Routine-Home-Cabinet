import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';

class PermissionsView extends StatelessWidget {
  const PermissionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.pageInset,
            AppSpacing.m,
            AppSpacing.pageInset,
            AppSpacing.l,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.permissionsTitle, style: AppTypography.headingLarge),
              const SizedBox(height: AppSpacing.l),
              Text(l10n.permissionsSubtitle, style: AppTypography.body),
              const SizedBox(height: AppSpacing.xl),
              _PermissionTile(
                icon: Icons.notifications_none,
                title: l10n.permissionsNotifications,
                body: l10n.permissionsNotificationsBody,
              ),
              const SizedBox(height: AppSpacing.m),
              _PermissionTile(
                icon: Icons.alarm,
                title: l10n.permissionsAlarms,
                body: l10n.permissionsAlarmsBody,
              ),
              const SizedBox(height: AppSpacing.m),
              _PermissionTile(
                icon: Icons.camera_alt_outlined,
                title: l10n.permissionsCamera,
                body: l10n.permissionsCameraBody,
              ),
              const Spacer(),
              AppButton(
                text: l10n.permissionsAllowContinue,
                onPressed: () => context.go(AppRoutes.signIn),
              ),
              const SizedBox(height: AppSpacing.m),
              AppButton(
                text: l10n.permissionsNotNow,
                variant: AppButtonVariant.secondary,
                onPressed: () => context.go(AppRoutes.signIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PermissionTile extends StatelessWidget {
  const _PermissionTile({
    required this.icon,
    required this.title,
    required this.body,
  });
  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) => Container(
    constraints: const BoxConstraints(minHeight: 80),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.surface,
      border: Border.all(color: AppColors.line),
      borderRadius: BorderRadius.circular(AppSizes.entryCardRadius),
    ),
    child: Row(
      children: [
        Container(
          width: AppSizes.minTouch,
          height: AppSizes.minTouch,
          decoration: const BoxDecoration(
            color: AppColors.primaryTint,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        const SizedBox(width: AppSpacing.l),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTypography.title),
              const SizedBox(height: AppSpacing.xs),
              Text(body, style: AppTypography.body),
            ],
          ),
        ),
      ],
    ),
  );
}
