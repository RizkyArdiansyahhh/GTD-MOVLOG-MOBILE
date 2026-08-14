import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';

/// Reusable card container component for GTD Logistics App.
class GtdCard extends StatelessWidget {
  const GtdCard({
    super.key,
    required this.child,
    this.padding = AppSpacing.paddingMd,
    this.margin = EdgeInsets.zero,
    this.onTap,
    this.elevation = 0,
    this.color = AppColors.surface,
    this.borderColor = AppColors.border,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final VoidCallback? onTap;
  final double elevation;
  final Color color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final cardWidget = Card(
      elevation: elevation,
      margin: margin,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.borderMd,
        side: BorderSide(color: borderColor, width: 1),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: AppRadius.borderMd,
        child: cardWidget,
      );
    }

    return cardWidget;
  }
}
