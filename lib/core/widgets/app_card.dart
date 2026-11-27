import 'package:material_ui/material_ui.dart';

import '../constants/sizes.dart';
import '../theme/app_colors.dart';

/// Shared bordered surface used to compose feature-specific cards.
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = EdgeInsets.zero,
    this.semanticLabel,
    this.color = AppColors.surface,
    this.borderColor = AppColors.line,
    this.radius = AppSizes.cardRadius,
    this.borderWidth = 1,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final String? semanticLabel;
  final Color color;
  final Color borderColor;
  final double radius;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(radius);
    final Widget content = Padding(padding: padding, child: child);
    return Material(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: BorderSide(color: borderColor, width: borderWidth),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Semantics(
          button: onTap != null,
          label: semanticLabel,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: onTap == null ? 0 : AppSizes.minTouch,
            ),
            child: content,
          ),
        ),
      ),
    );
  }
}
