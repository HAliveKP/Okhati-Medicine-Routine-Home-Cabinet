import 'package:material_ui/material_ui.dart';

import '../constants/sizes.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Compact top bar with a 48dp back target and optional action widgets.
class AppTopBar extends StatelessWidget {
  const AppTopBar({
    super.key,
    required this.title,
    required this.backLabel,
    required this.onBack,
    this.actions = const [],
  });

  final String title;
  final String backLabel;
  final VoidCallback onBack;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: AppSizes.topBarHeight,
    child: Row(
      children: [
        IconButton(
          tooltip: backLabel,
          onPressed: onBack,
          icon: const Icon(Icons.arrow_back_ios_new),
          color: AppColors.textPrimary,
          constraints: const BoxConstraints(
            minWidth: AppSizes.minTouch,
            minHeight: AppSizes.minTouch,
          ),
        ),
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.heading,
          ),
        ),
        ...actions,
      ],
    ),
  );
}
