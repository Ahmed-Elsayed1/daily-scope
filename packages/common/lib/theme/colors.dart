import 'package:flutter/material.dart';

/// Color palette for the Daily Scope app.
/// Provides both light and dark theme colors with semantic naming.
class AppColors {
  AppColors._();

  // Primary Colors
  /// Deep blue - primary brand color
  static const Color deepBlue = Color(0xFF0A2342);

  /// Alternative deep blue shade
  static const Color deepBlueAlt = Color(0xFF102E5D);

  /// Amber - secondary/accent color
  static const Color amber = Color(0xFFFFB703);

  // Light Theme Colors
  /// Light theme background
  static const Color background = Color(0xFFF5F7FB);

  /// Light theme surface (cards, sheets)
  static const Color surface = Colors.white;

  /// Light theme text - primary
  static const Color textPrimary = Color(0xFF1A1A1A);

  /// Light theme text - secondary
  static const Color textSecondary = Color(0xFF666666);

  // Dark Theme Colors
  /// Dark theme background
  static const Color backgroundDark = Color(0xFF0F1419);

  /// Dark theme surface (cards, sheets)
  static const Color surfaceDark = Color(0xFF1A1F26);

  /// Dark theme text - primary
  static const Color textPrimaryDark = Color(0xFFE8E8E8);

  /// Dark theme text - secondary
  static const Color textSecondaryDark = Color(0xFFB0B0B0);

  // Semantic Colors
  /// Success/positive state
  static const Color success = Color(0xFF2CB67D);

  /// Error/negative state
  static const Color error = Color(0xFFD62828);

  /// Warning state
  static const Color warning = Color(0xFFF77F00);

  /// Info state
  static const Color info = Color(0xFF0081A7);

  // Border and Divider Colors
  /// Light theme border
  static const Color border = Color(0xFFE0E0E0);

  /// Dark theme border
  static const Color borderDark = Color(0xFF2A2F36);
}
