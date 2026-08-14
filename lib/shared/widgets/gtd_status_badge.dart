import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

/// Reusable status badge component for GTD Logistics App.
/// Note: Statuses are provisional UI presentation defaults and do not assume backend API contracts.
class GtdStatusBadge extends StatelessWidget {
  const GtdStatusBadge({
    super.key,
    required this.status,
    this.label,
    this.backgroundColor,
    this.textColor,
  });

  /// Status identifier (e.g. 'pending', 'assigned', 'in_transit', 'delivered', 'cancelled', 'failed')
  final String status;

  /// Custom label override (defaults to formatted status string if null)
  final String? label;

  /// Custom background color override
  final Color? backgroundColor;

  /// Custom text color override
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final effectiveLabel = label ?? _formatStatusLabel(status);
    final effectiveBgColor = backgroundColor ?? _getBackgroundColor(status);
    final effectiveFgColor = textColor ?? _getTextColor(status);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm + 2,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: effectiveBgColor,
        borderRadius: AppRadius.borderPill,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: effectiveFgColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: AppSpacing.xs + 2),
          Text(
            effectiveLabel,
            style: AppTypography.labelSmall.copyWith(
              color: effectiveFgColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  static String _formatStatusLabel(String status) {
    switch (status.toLowerCase().replaceAll('-', '_')) {
      case 'pending':
        return 'Pending';
      case 'assigned':
        return 'Assigned';
      case 'in_transit':
      case 'intransit':
        return 'In Transit';
      case 'delivered':
        return 'Delivered';
      case 'cancelled':
      case 'canceled':
        return 'Cancelled';
      case 'failed':
        return 'Failed';
      default:
        return status;
    }
  }

  static Color _getBackgroundColor(String status) {
    switch (status.toLowerCase().replaceAll('-', '_')) {
      case 'pending':
        return AppColors.statusPending.withValues(alpha: 0.15);
      case 'assigned':
        return AppColors.primary.withValues(alpha: 0.1);
      case 'in_transit':
      case 'intransit':
        return AppColors.statusInTransit.withValues(alpha: 0.15);
      case 'delivered':
        return AppColors.statusSuccess.withValues(alpha: 0.15);
      case 'cancelled':
      case 'canceled':
      case 'failed':
        return AppColors.statusError.withValues(alpha: 0.15);
      default:
        return AppColors.border;
    }
  }

  static Color _getTextColor(String status) {
    switch (status.toLowerCase().replaceAll('-', '_')) {
      case 'pending':
        return const Color(0xFFB45309); // Darker amber for contrast
      case 'assigned':
        return AppColors.primary;
      case 'in_transit':
      case 'intransit':
        return const Color(0xFF1D4ED8); // Darker blue for contrast
      case 'delivered':
        return const Color(0xFF047857); // Darker emerald for contrast
      case 'cancelled':
      case 'canceled':
      case 'failed':
        return AppColors.statusError;
      default:
        return AppColors.textPrimary;
    }
  }
}
