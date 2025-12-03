import 'package:flutter/material.dart';

/// Spacing tokens for consistent layout throughout the app.
/// Use these values instead of hardcoded numbers for padding, margins, and gaps.
class AppSpacing {
  AppSpacing._();

  /// Extra small spacing - 4.0
  static const double xs = 4.0;

  /// Small spacing - 8.0
  static const double sm = 8.0;

  /// Medium spacing - 16.0
  static const double md = 16.0;

  /// Large spacing - 24.0
  static const double lg = 24.0;

  /// Extra large spacing - 32.0
  static const double xl = 32.0;

  /// Extra extra large spacing - 48.0
  static const double xxl = 48.0;

  // EdgeInsets helpers for common patterns

  /// Horizontal padding - small
  static const EdgeInsets horizontalSm = EdgeInsets.symmetric(horizontal: sm);

  /// Horizontal padding - medium
  static const EdgeInsets horizontalMd = EdgeInsets.symmetric(horizontal: md);

  /// Horizontal padding - large
  static const EdgeInsets horizontalLg = EdgeInsets.symmetric(horizontal: lg);

  /// Vertical padding - small
  static const EdgeInsets verticalSm = EdgeInsets.symmetric(vertical: sm);

  /// Vertical padding - medium
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(vertical: md);

  /// Vertical padding - large
  static const EdgeInsets verticalLg = EdgeInsets.symmetric(vertical: lg);

  /// All sides padding - small
  static const EdgeInsets allSm = EdgeInsets.all(sm);

  /// All sides padding - medium
  static const EdgeInsets allMd = EdgeInsets.all(md);

  /// All sides padding - large
  static const EdgeInsets allLg = EdgeInsets.all(lg);
}
