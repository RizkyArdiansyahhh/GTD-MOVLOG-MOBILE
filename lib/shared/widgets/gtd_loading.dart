import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

/// Clean application-level loading indicator component for GTD Logistics App.
class GtdLoading extends StatelessWidget {
  const GtdLoading({
    super.key,
    this.message,
    this.size = 36.0,
    this.color = AppColors.primary,
  });

  final String? message;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppSpacing.paddingMd,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
            if (message != null) ...[
              const SizedBox(height: AppSpacing.md),
              Text(
                message!,
                textAlign: TextAlign.center,
                style: AppTypography.bodyMedium,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
