import 'package:flutter/material.dart';

/// Centralized color tokens for GTD Logistics Mobile App.
abstract class AppColors {
  /// Primary Brand Color - GTD Deep Navy
  static const Color primary = Color(0xFF1C2D44);

  /// Darker variant of Primary Color
  static const Color primaryVariant = Color(0xFF111C2B);

  /// Secondary Accent Color - GTD Gold / Yellow
  static const Color secondary = Color(0xFFF8C944);

  /// Secondary Variant Color
  static const Color secondaryVariant = Color(0xFFE0B236);

  /// Surface background for cards and dialogs
  static const Color surface = Color(0xFFFFFFFF);

  /// Main screen background color (Slate 50)
  static const Color background = Color(0xFFF8FAFC);

  /// High-emphasis text color (Slate 900 / GTD Navy)
  static const Color textPrimary = Color(0xFF1C2D44);

  /// Secondary metadata text color (Slate 500)
  static const Color textSecondary = Color(0xFF64748B);

  /// Border and divider color (Slate 200)
  static const Color border = Color(0xFFE2E8F0);

  // Status Tokens
  static const Color statusPending = Color(0xFFF8C944);
  static const Color statusInTransit = Color(0xFF3B82F6);
  static const Color statusSuccess = Color(0xFF10B981);
  static const Color statusError = Color(0xFFEF4444);
}
