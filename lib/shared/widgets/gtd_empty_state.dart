import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import 'gtd_button.dart';

/// Reusable empty state placeholder component for GTD Logistics App.
class GtdEmptyState extends StatelessWidget {
  const GtdEmptyState({
    super.key,
    required this.title,
    this.description,
    this.icon,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String? description;
  final Widget? icon;
  final String? actionLabel;
  final VoidCallback? onAction;

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
                  Icons.inbox_outlined,
                  size: 64,
                  color: AppColors.textSecondary,
                ),
            const SizedBox(height: AppSpacing.md),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTypography.headlineMedium,
            ),
            if (description != null) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                description!,
                textAlign: TextAlign.center,
                style: AppTypography.bodyMedium,
              ),
            ],
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: AppSpacing.lg),
              GtdButton(
                label: actionLabel!,
                onPressed: onAction,
                width: 200,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
