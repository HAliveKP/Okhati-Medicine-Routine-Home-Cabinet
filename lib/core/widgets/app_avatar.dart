import 'package:material_ui/material_ui.dart';

import '../constants/sizes.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import 'app_image.dart';
import '../constants/app_assets.dart';

/// Accessible initials avatar; uses an image asset when one is supplied.
class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    required this.semanticLabel,
    this.initials,
    this.image,
    this.backgroundColor = AppColors.primaryTint,
    this.size = AppSizes.avatar,
  }) : assert(image != null || initials != null);

  final String semanticLabel;
  final String? initials;
  final AppAsset? image;
  final Color backgroundColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      return AppImage(
        asset: image!,
        semanticLabel: semanticLabel,
        excludeFromSemantics: false,
        width: size,
        height: size,
        fit: BoxFit.cover,
        borderRadius: BorderRadius.circular(size),
      );
    }
    return Semantics(
      image: true,
      label: semanticLabel,
      child: ExcludeSemantics(
        child: CircleAvatar(
          radius: size / 2,
          backgroundColor: backgroundColor,
          child: Text(
            initials!,
            style: AppTypography.title.copyWith(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
