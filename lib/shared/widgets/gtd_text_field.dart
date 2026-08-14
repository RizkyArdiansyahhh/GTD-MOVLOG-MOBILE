import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

/// Reusable text form field component for GTD Logistics App.
class GtdTextField extends StatelessWidget {
  const GtdTextField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.enabled = true,
    this.errorMessage,
    this.onChanged,
    this.maxLines = 1,
  });

  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final String? errorMessage;
  final ValueChanged<String>? onChanged;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: enabled ? AppColors.textPrimary : AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
        ],
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          enabled: enabled,
          validator: validator,
          onChanged: onChanged,
          maxLines: maxLines,
          style: AppTypography.bodyLarge.copyWith(
            color: enabled ? AppColors.textPrimary : AppColors.textSecondary,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary.withValues(alpha: 0.7),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            errorText: errorMessage,
          ),
        ),
      ],
    );
  }
}
