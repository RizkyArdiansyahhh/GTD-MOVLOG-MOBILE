import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

/// Button visual variants for GTD UI Kit.
enum GtdButtonVariant {
  primary,
  secondary,
  outline,
  text,
}

/// Reusable action button component for GTD Logistics App.
class GtdButton extends StatelessWidget {
  const GtdButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = GtdButtonVariant.primary,
    this.icon,
    this.isLoading = false,
    this.width,
    this.height = 48.0,
  });

  final String label;
  final VoidCallback? onPressed;
  final GtdButtonVariant variant;
  final Widget? icon;
  final bool isLoading;
  final double? width;
  final double height;

  bool get _isDisabled => onPressed == null || isLoading;

  @override
  Widget build(BuildContext context) {
    final effectiveWidth = width ?? double.infinity;

    return SizedBox(
      width: effectiveWidth,
      height: height,
      child: _buildButtonChild(context),
    );
  }

  Widget _buildButtonChild(BuildContext context) {
    switch (variant) {
      case GtdButtonVariant.primary:
        return ElevatedButton(
          onPressed: _isDisabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.5),
            disabledForegroundColor: Colors.white.withValues(alpha: 0.7),
            shape: RoundedRectangleBorder(borderRadius: AppRadius.borderSm),
          ),
          child: _buildContent(context, Colors.white),
        );

      case GtdButtonVariant.secondary:
        return ElevatedButton(
          onPressed: _isDisabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondary,
            foregroundColor: AppColors.primary,
            disabledBackgroundColor: AppColors.secondary.withValues(alpha: 0.5),
            disabledForegroundColor: AppColors.primary.withValues(alpha: 0.5),
            shape: RoundedRectangleBorder(borderRadius: AppRadius.borderSm),
          ),
          child: _buildContent(context, AppColors.primary),
        );

      case GtdButtonVariant.outline:
        return OutlinedButton(
          onPressed: _isDisabled ? null : onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            side: BorderSide(
              color: _isDisabled
                  ? AppColors.border
                  : AppColors.primary,
              width: 1.5,
            ),
            shape: RoundedRectangleBorder(borderRadius: AppRadius.borderSm),
          ),
          child: _buildContent(
            context,
            _isDisabled ? AppColors.textSecondary : AppColors.primary,
          ),
        );

      case GtdButtonVariant.text:
        return TextButton(
          onPressed: _isDisabled ? null : onPressed,
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(borderRadius: AppRadius.borderSm),
          ),
          child: _buildContent(
            context,
            _isDisabled ? AppColors.textSecondary : AppColors.primary,
          ),
        );
    }
  }

  Widget _buildContent(BuildContext context, Color color) {
    if (isLoading) {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      );
    }

    final textWidget = Text(
      label,
      style: AppTypography.buttonText.copyWith(color: color),
    );

    if (icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          icon!,
          const SizedBox(width: AppSpacing.sm),
          Flexible(
            child: Text(
              label,
              style: AppTypography.buttonText.copyWith(color: color),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }

    return textWidget;
  }
}
