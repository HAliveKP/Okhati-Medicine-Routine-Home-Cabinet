import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/di/providers.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';

class LanguageView extends ConsumerWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final Locale selected = ref.watch(localeProvider);
    final AppSettingsController settings = ref.read(
      appSettingsControllerProvider,
    );
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
              Text(l10n.languageTitle, style: AppTypography.headingLarge),
              const SizedBox(height: AppSpacing.m),
              Text(
                l10n.languageNepaliPrompt,
                style: AppTypography.heading.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.l),
              _LanguageCard(
                title: l10n.moreEnglish,
                subtitle: l10n.languageEnglishSubtitle,
                selected: selected.languageCode == 'en',
                onTap: () => settings.setLocale(const Locale('en')),
              ),
              const SizedBox(height: AppSpacing.m),
              _LanguageCard(
                title: l10n.languageNepaliName,
                subtitle: l10n.languageNepaliSubtitle,
                selected: selected.languageCode == 'ne',
                onTap: () => settings.setLocale(const Locale('ne')),
              ),
              const SizedBox(height: AppSpacing.l),
              Text(l10n.languageChangeNote, style: AppTypography.body),
              const Spacer(),
              AppButton(
                text: l10n.commonNext,
                onPressed: () => context.go(AppRoutes.onboarding),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageCard extends StatelessWidget {
  const _LanguageCard({
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    selected: selected,
    label: '$title, $subtitle',
    child: Material(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.entryCardRadius),
        side: BorderSide(
          color: selected ? AppColors.primary : AppColors.line,
          width: selected ? AppSizes.selectedBorderWidth : 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.entryCardRadius),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: AppSizes.minTouch * 2),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(title, style: AppTypography.heading),
                      const SizedBox(height: AppSpacing.xs),
                      Text(subtitle, style: AppTypography.body),
                    ],
                  ),
                ),
                Icon(
                  selected ? Icons.check_circle : Icons.circle_outlined,
                  color: selected ? AppColors.primary : AppColors.line,
                  size: AppSizes.entryChoiceIcon,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
