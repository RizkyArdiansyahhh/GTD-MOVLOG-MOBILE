import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Centralized typography tokens using Plus Jakarta Sans for GTD Logistics Mobile App.
abstract class AppTypography {
  /// Display Large (32px Bold 700)
  static TextStyle get displayLarge => GoogleFonts.plusJakartaSans(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  /// Headline Medium (20px SemiBold 600)
  static TextStyle get headlineMedium => GoogleFonts.plusJakartaSans(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  /// Body Large (16px Regular 400)
  static TextStyle get bodyLarge => GoogleFonts.plusJakartaSans(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      );

  /// Body Medium (14px Regular 400)
  static TextStyle get bodyMedium => GoogleFonts.plusJakartaSans(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      );

  /// Label Small (12px Medium 500)
  static TextStyle get labelSmall => GoogleFonts.plusJakartaSans(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
      );

  /// Button Text Style (16px SemiBold 600)
  static TextStyle get buttonText => GoogleFonts.plusJakartaSans(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );
}
