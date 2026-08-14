import 'package:flutter/material.dart';

/// Centralized 8px grid spacing tokens for GTD Logistics Mobile App.
abstract class AppSpacing {
  /// Extra small spacing (4.0)
  static const double xs = 4.0;

  /// Small spacing (8.0)
  static const double sm = 8.0;

  /// Medium standard spacing (16.0)
  static const double md = 16.0;

  /// Large section spacing (24.0)
  static const double lg = 24.0;

  /// Extra large margin spacing (32.0)
  static const double xl = 32.0;

  // EdgeInsets helpers
  static const EdgeInsets paddingXs = EdgeInsets.all(xs);
  static const EdgeInsets paddingSm = EdgeInsets.all(sm);
  static const EdgeInsets paddingMd = EdgeInsets.all(md);
  static const EdgeInsets paddingLg = EdgeInsets.all(lg);
  static const EdgeInsets paddingXl = EdgeInsets.all(xl);
}
