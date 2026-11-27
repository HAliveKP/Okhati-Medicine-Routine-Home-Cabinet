import 'package:material_ui/material_ui.dart';

import '../constants/app_assets.dart';
import '../constants/sizes.dart';
import '../theme/app_colors.dart';

/// Semantic image that scales with its parent and renders a neutral fallback.
class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.asset,
    required this.semanticLabel,
    required this.excludeFromSemantics,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.borderRadius,
  }) : assert(
         excludeFromSemantics || (semanticLabel != null && semanticLabel != ''),
         'Provide a semantic label or exclude the image from semantics.',
       );

  final AppAsset asset;
  final String? semanticLabel;
  final bool excludeFromSemantics;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final Widget image = Image.asset(
      asset.path,
      width: width,
      height: height,
      fit: fit,
      excludeFromSemantics: true,
      errorBuilder: (context, error, stackTrace) => _NeutralFallback(
        width: width,
        height: height,
        borderRadius: borderRadius,
      ),
    );
    final Widget clippedImage = borderRadius == null
        ? image
        : ClipRRect(borderRadius: borderRadius!, child: image);

    if (excludeFromSemantics) return clippedImage;
    return Semantics(
      image: true,
      label: semanticLabel,
      child: ExcludeSemantics(child: clippedImage),
    );
  }
}

class _NeutralFallback extends StatelessWidget {
  const _NeutralFallback({this.width, this.height, this.borderRadius});

  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final Widget placeholder = SizedBox(
      width: width ?? AppSizes.minTouch,
      height: height ?? AppSizes.minTouch,
      child: const Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          color: AppColors.textSecondary,
          size: AppSizes.assetFallbackIcon,
        ),
      ),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.primaryTint,
        borderRadius:
            borderRadius ?? BorderRadius.circular(AppSizes.controlRadius),
      ),
      child: placeholder,
    );
  }
}
