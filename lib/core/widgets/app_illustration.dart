import 'package:material_ui/material_ui.dart';

import '../constants/app_assets.dart';
import 'app_image.dart';

/// Responsive illustration widget with semantic labeling and a neutral fallback.
class AppIllustration extends StatelessWidget {
  AppIllustration({
    super.key,
    required this.asset,
    required this.semanticLabel,
    required this.excludeFromSemantics,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  }) : assert(asset.kind == AppAssetKind.illustration);

  final AppAsset asset;
  final String? semanticLabel;
  final bool excludeFromSemantics;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) => AppImage(
    asset: asset,
    semanticLabel: semanticLabel,
    excludeFromSemantics: excludeFromSemantics,
    width: width,
    height: height,
    fit: fit,
  );
}
