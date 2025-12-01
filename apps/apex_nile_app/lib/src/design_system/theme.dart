import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData buildApexTheme() {
  final base = ThemeData.light();
  return base.copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.deepBlue,
      primary: AppColors.deepBlue,
      secondary: AppColors.amber,
      surface: AppColors.surface,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.deepBlue,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: base.textTheme.copyWith(
      headlineMedium: base.textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: AppColors.deepBlue,
      ),
      bodyLarge: base.textTheme.bodyLarge?.copyWith(color: Colors.black87),
      bodyMedium: base.textTheme.bodyMedium?.copyWith(color: Colors.black87),
      labelLarge:
          base.textTheme.labelLarge?.copyWith(color: AppColors.deepBlueAlt),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.deepBlue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.amber,
      foregroundColor: AppColors.deepBlue,
    ),
    cardTheme: CardTheme(
      color: AppColors.surface,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}
