import 'package:flutter/material.dart';

/// Centralized border radius tokens for GTD Logistics Mobile App.
abstract class AppRadius {
  /// Small border radius (6.0) for input fields, chips, small badges
  static const double sm = 6.0;

  /// Medium border radius (12.0) for cards, dialog containers, status badges
  static const double md = 12.0;

  /// Large border radius (16.0) for bottom sheets, modal cards
  static const double lg = 16.0;

  /// Pill border radius (50.0) for rounded status badges and pills
  static const double pill = 50.0;

  // BorderRadius objects
  static const BorderRadius borderSm = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius borderMd = BorderRadius.all(Radius.circular(md));
  static const BorderRadius borderLg = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius borderPill = BorderRadius.all(Radius.circular(pill));
}
