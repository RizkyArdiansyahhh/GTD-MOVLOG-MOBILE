import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import 'gtd_button.dart';

/// Reusable presentation error state component for GTD Logistics App.
class GtdErrorState extends StatelessWidget {
  const GtdErrorState({
    super.key,
    this.title = 'Something went wrong',
    required this.message,
    this.icon,
    this.retryLabel = 'Try Again',
    this.onRetry,
  });

  final String title;
  final String message;
  final Widget? icon;
  final String retryLabel;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppSpacing.paddingLg,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            icon ??
                const Icon(
                  Icons.error_outline_rounded,
                  size: 64,
                  color: AppColors.statusError,
                ),
            const SizedBox(height: AppSpacing.md),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTypography.headlineMedium.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: AppSpacing.lg),
              GtdButton(
                label: retryLabel,
                onPressed: onRetry,
                icon: const Icon(Icons.refresh_rounded, size: 18),
                width: 200,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
