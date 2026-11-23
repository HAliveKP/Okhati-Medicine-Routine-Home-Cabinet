import 'package:material_ui/material_ui.dart';

import '../constants/app_assets.dart';
import '../constants/sizes.dart';
import 'app_image.dart';

/// Scaled app logo with a neutral fallback until the supplied logo is present.
class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    required this.semanticLabel,
    this.size = AppSizes.avatar,
    this.excludeFromSemantics = false,
  });

  final String? semanticLabel;
  final double size;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) => AppImage(
    asset: AppAssets.logo,
    semanticLabel: semanticLabel,
    excludeFromSemantics: excludeFromSemantics,
    width: size,
    height: size,
  );
}
