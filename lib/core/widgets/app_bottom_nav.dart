import 'package:material_ui/material_ui.dart';

import '../constants/sizes.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// App bottom navigation shell (4 tabs), matching the Figma BottomNav.
///
/// Figma: 84dp tall, top hairline, 56x32 active pill behind a 24dp icon,
/// 4dp gap, 12dp label (medium inactive / semibold active).
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTabTapped,
  });

  final int currentIndex;
  final ValueChanged<int> onTabTapped;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final List<({IconData icon, String label})> tabs =
        <({IconData icon, String label})>[
          (icon: Icons.calendar_today_outlined, label: l10n.navToday),
          (icon: Icons.medication_outlined, label: l10n.navCabinet),
          (icon: Icons.people_outline, label: l10n.navFamily),
          (icon: Icons.menu, label: l10n.navMore),
        ];
    final int selected = currentIndex.clamp(0, tabs.length - 1);

    return Container(
      height: AppSizes.bottomNavHeight,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.line)),
      ),
      child: Row(
        children: List<Widget>.generate(tabs.length, (int index) {
          final ({IconData icon, String label}) tab = tabs[index];
          final bool active = index == selected;
          return Expanded(
            child: InkWell(
              onTap: () => onTabTapped(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: AppSizes.navIconWrapWidth,
                    height: AppSizes.navIconWrapHeight,
                    decoration: BoxDecoration(
                      color: active
                          ? AppColors.primaryTint
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      tab.icon,
                      size: 24,
                      color: active
                          ? AppColors.primary
                          : AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    tab.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: active
                        ? AppTypography.navLabelActive
                        : AppTypography.navLabel,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
