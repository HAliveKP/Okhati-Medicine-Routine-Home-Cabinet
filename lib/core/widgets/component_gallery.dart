import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../constants/spacing.dart';
import '../l10n/app_localizations.dart';
import '../router/app_routes.dart';
import '../theme/app_colors.dart';
import 'app_avatar.dart';
import 'app_bottom_nav.dart';
import 'app_bottom_sheet.dart';
import 'app_button.dart';
import 'app_card.dart';
import 'app_confirmation_dialog.dart';
import 'app_filter_chip.dart';
import 'app_logo.dart';
import 'app_profile_switcher.dart';
import 'app_search_field.dart';
import 'app_settings_tile.dart';
import 'app_toggle.dart';
import 'app_top_bar.dart';
import 'status_chip.dart';

/// Debug gallery for reviewing shared interface components.
class ComponentGallery extends StatefulWidget {
  const ComponentGallery({super.key});

  @override
  State<ComponentGallery> createState() => _ComponentGalleryState();
}

class _ComponentGalleryState extends State<ComponentGallery> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedFilter = 0;
  int _selectedTab = 0;
  bool _highContrast = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final List<String> filters = [
      l10n.cabinetFilterAll,
      l10n.cabinetFilterLow,
      l10n.cabinetFilterExpiring,
      l10n.cabinetFilterExpired,
    ];
    final String initials = l10n.appTitle.substring(0, 1);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.appTitle)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.pageInset),
        children: [
          AppTopBar(
            title: l10n.cabinetTitle,
            backLabel: l10n.commonBack,
            onBack: () => context.go(AppRoutes.today),
          ),
          const SizedBox(height: AppSpacing.l),
          AppCard(
            semanticLabel: l10n.cabinetTitle,
            padding: const EdgeInsets.all(AppSpacing.l),
            child: Row(
              children: [
                AppLogo(semanticLabel: l10n.appTitle),
                const SizedBox(width: AppSpacing.m),
                Expanded(
                  child: AppProfileSwitcher(
                    profiles: [
                      AppProfileOption(
                        id: 'you',
                        name: l10n.todayTitle,
                        initials: initials,
                      ),
                      AppProfileOption(
                        id: 'family',
                        name: l10n.familyTitle,
                        initials: initials,
                      ),
                    ],
                    selectedProfileId: 'you',
                    semanticLabel: l10n.familyTitle,
                    onSelected: (_) {},
                  ),
                ),
                AppAvatar(semanticLabel: l10n.familyTitle, initials: initials),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.l),
          AppSearchField(
            controller: _searchController,
            hint: l10n.cabinetSearch,
            semanticLabel: l10n.commonSearch,
            clearLabel: l10n.commonClose,
          ),
          const SizedBox(height: AppSpacing.m),
          Wrap(
            spacing: AppSpacing.s,
            runSpacing: AppSpacing.s,
            children: [
              for (int index = 0; index < filters.length; index++)
                AppFilterChip(
                  label: filters[index],
                  selected: index == _selectedFilter,
                  onSelected: (_) => setState(() => _selectedFilter = index),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.l),
          Wrap(
            spacing: AppSpacing.s,
            runSpacing: AppSpacing.s,
            children: [
              StatusChip(
                icon: Icons.check,
                label: l10n.statusGood,
                color: AppColors.statusGood,
                backgroundColor: AppColors.statusGoodBackground,
              ),
              StatusChip(
                icon: Icons.schedule,
                label: l10n.statusDue,
                color: AppColors.statusDue,
                backgroundColor: AppColors.statusDueBackground,
              ),
              StatusChip(
                icon: Icons.warning_amber_rounded,
                label: l10n.statusLowStock,
                color: AppColors.statusLowStock,
                backgroundColor: AppColors.statusLowStockBackground,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.l),
          AppToggle(
            title: l10n.settingsHighContrast,
            subtitle: l10n.settingsHighContrastDesc,
            semanticLabel: l10n.settingsHighContrastDesc,
            value: _highContrast,
            onChanged: (bool value) => setState(() => _highContrast = value),
            icon: Icons.visibility_outlined,
          ),
          const SizedBox(height: AppSpacing.m),
          AppSettingsTile(
            title: l10n.moreSettings,
            semanticLabel: l10n.moreSettings,
            icon: Icons.settings_outlined,
            onTap: () {},
          ),
          const SizedBox(height: AppSpacing.l),
          AppButton(
            text: l10n.addMedicineSave,
            onPressed: () => AppBottomSheet.show<void>(
              context: context,
              builder: (BuildContext sheetContext) => AppButton(
                text: l10n.commonDone,
                onPressed: () => Navigator.of(sheetContext).pop(),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.s),
          AppButton(
            text: l10n.commonDelete,
            variant: AppButtonVariant.danger,
            onPressed: () => AppConfirmationDialog.show(
              context: context,
              title: l10n.deleteAccountTitle,
              body: l10n.deleteAccountDesc,
              confirmLabel: l10n.commonDelete,
              cancelLabel: l10n.commonCancel,
              destructive: true,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: _selectedTab,
        onTabTapped: (int value) => setState(() => _selectedTab = value),
      ),
    );
  }
}
