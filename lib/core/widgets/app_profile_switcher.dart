import 'package:material_ui/material_ui.dart';

import '../constants/sizes.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import 'app_avatar.dart';

/// UI-only profile option for family/profile selection.
@immutable
class AppProfileOption {
  const AppProfileOption({
    required this.id,
    required this.name,
    required this.initials,
    this.subtitle,
  });

  final String id;
  final String name;
  final String initials;
  final String? subtitle;
}

/// Compact profile dropdown for the Today and Family headers.
class AppProfileSwitcher extends StatelessWidget {
  const AppProfileSwitcher({
    super.key,
    required this.profiles,
    required this.selectedProfileId,
    required this.semanticLabel,
    required this.onSelected,
  });

  final List<AppProfileOption> profiles;
  final String selectedProfileId;
  final String semanticLabel;
  final ValueChanged<AppProfileOption> onSelected;

  @override
  Widget build(BuildContext context) {
    final AppProfileOption? selected = _selected;
    if (selected == null) return const SizedBox.shrink();
    return PopupMenuButton<AppProfileOption>(
      tooltip: semanticLabel,
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => profiles
          .map(
            (AppProfileOption profile) => PopupMenuItem<AppProfileOption>(
              value: profile,
              child: Row(
                children: [
                  AppAvatar(
                    semanticLabel: profile.name,
                    initials: profile.initials,
                    size: AppSizes.avatar,
                  ),
                  const SizedBox(width: AppSizes.profileAvatarGap),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(profile.name, style: AppTypography.title),
                        if (profile.subtitle case final String subtitle)
                          Text(subtitle, style: AppTypography.meta),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(growable: false),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: AppSizes.minTouch),
        child: Material(
          color: AppColors.primaryTint,
          borderRadius: BorderRadius.circular(AppSizes.chipRadius),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.profileSwitcherInset,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  selected.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.title.copyWith(color: AppColors.primary),
                ),
                const SizedBox(width: AppSizes.profileSwitcherGap),
                const Icon(Icons.keyboard_arrow_down, color: AppColors.primary),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppProfileOption? get _selected {
    for (final AppProfileOption profile in profiles) {
      if (profile.id == selectedProfileId) return profile;
    }
    return profiles.isEmpty ? null : profiles.first;
  }
}
