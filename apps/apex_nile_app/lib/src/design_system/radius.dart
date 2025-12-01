import 'package:flutter/material.dart';

/// Border radius tokens for consistent rounded corners throughout the app.
class AppRadius {
  AppRadius._();

  /// Small radius - 8.0
  static const BorderRadius small = BorderRadius.all(Radius.circular(8.0));

  /// Medium radius - 12.0
  static const BorderRadius medium = BorderRadius.all(Radius.circular(12.0));

  /// Large radius - 16.0
  static const BorderRadius large = BorderRadius.all(Radius.circular(16.0));

  /// Extra large radius - 24.0
  static const BorderRadius extraLarge = BorderRadius.all(Radius.circular(24.0));

  /// Small circular radius value
  static const double smallValue = 8.0;

  /// Medium circular radius value
  static const double mediumValue = 12.0;

  /// Large circular radius value
  static const double largeValue = 16.0;

  /// Extra large circular radius value
  static const double extraLargeValue = 24.0;
}
