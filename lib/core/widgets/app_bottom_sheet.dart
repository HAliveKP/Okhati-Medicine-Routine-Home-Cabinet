import 'package:material_ui/material_ui.dart';

import '../constants/spacing.dart';
import '../constants/sizes.dart';
import '../theme/app_colors.dart';

/// Shared safe-area bottom sheet host.
abstract final class AppBottomSheet {
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool isScrollControlled = true,
  }) => showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled,
    useSafeArea: true,
    backgroundColor: AppColors.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppSizes.cardRadius),
      ),
    ),
    builder: (BuildContext context) => Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.l,
        right: AppSpacing.l,
        top: AppSpacing.m,
        bottom: MediaQuery.viewInsetsOf(context).bottom + AppSpacing.l,
      ),
      child: builder(context),
    ),
  );
}
