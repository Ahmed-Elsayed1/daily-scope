import 'package:flutter/material.dart';

import 'colors.dart';
import 'radius.dart';
import 'spacing.dart';
import 'typography.dart';

/// Builds the light theme for the Apex Nile app.
/// Uses design system tokens for consistent styling.
ThemeData buildApexTheme() {
  final base = ThemeData.light();

  return base.copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.deepBlue,
      primary: AppColors.deepBlue,
      secondary: AppColors.amber,
      surface: AppColors.surface,
      error: AppColors.error,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: AppColors.background,

    // AppBar styling
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.deepBlue,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),

    // Text theme using design tokens
    textTheme: base.textTheme.copyWith(
      headlineLarge:
          AppTextStyles.headlineLarge.copyWith(color: AppColors.textPrimary),
      headlineMedium:
          AppTextStyles.headlineMedium.copyWith(color: AppColors.deepBlue),
      headlineSmall:
          AppTextStyles.headlineSmall.copyWith(color: AppColors.textPrimary),
      titleLarge:
          AppTextStyles.titleLarge.copyWith(color: AppColors.textPrimary),
      titleMedium:
          AppTextStyles.titleMedium.copyWith(color: AppColors.textPrimary),
      titleSmall:
          AppTextStyles.titleSmall.copyWith(color: AppColors.textPrimary),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.textPrimary),
      bodyMedium:
          AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary),
      bodySmall:
          AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
      labelLarge:
          AppTextStyles.labelLarge.copyWith(color: AppColors.deepBlueAlt),
      labelMedium:
          AppTextStyles.labelMedium.copyWith(color: AppColors.textSecondary),
    ),

    // Input decoration
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      border: OutlineInputBorder(
        borderRadius: AppRadius.medium,
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.medium,
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.medium,
        borderSide: const BorderSide(color: AppColors.deepBlue, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppRadius.medium,
        borderSide: const BorderSide(color: AppColors.error),
      ),
      contentPadding: AppSpacing.allMd,
    ),

    // Button themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.deepBlue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.medium,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        textStyle: AppTextStyles.button,
        elevation: 2,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.deepBlue,
        textStyle: AppTextStyles.button,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.deepBlue,
        side: const BorderSide(color: AppColors.deepBlue),
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.medium,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        textStyle: AppTextStyles.button,
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.amber,
      foregroundColor: AppColors.deepBlue,
      elevation: 4,
    ),

    // Card theme
    cardTheme: CardTheme(
      color: AppColors.surface,
      elevation: 2,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.large,
      ),
      margin: AppSpacing.allMd,
    ),

    // Divider theme
    dividerTheme: const DividerThemeData(
      color: AppColors.border,
      thickness: 1,
      space: AppSpacing.md,
    ),

    // Chip theme
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.surface,
      selectedColor: AppColors.deepBlue,
      labelStyle: AppTextStyles.labelMedium,
      padding: AppSpacing.allSm,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.small,
      ),
    ),
  );
}

/// Builds the dark theme for the Apex Nile app.
/// Uses design system tokens for consistent styling.
ThemeData buildApexDarkTheme() {
  final base = ThemeData.dark();

  return base.copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.deepBlue,
      primary: AppColors.amber,
      secondary: AppColors.deepBlue,
      surface: AppColors.surfaceDark,
      error: AppColors.error,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: AppColors.backgroundDark,

    // AppBar styling
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceDark,
      foregroundColor: AppColors.textPrimaryDark,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimaryDark,
      ),
    ),

    // Text theme using design tokens
    textTheme: base.textTheme.copyWith(
      headlineLarge: AppTextStyles.headlineLarge
          .copyWith(color: AppColors.textPrimaryDark),
      headlineMedium:
          AppTextStyles.headlineMedium.copyWith(color: AppColors.amber),
      headlineSmall: AppTextStyles.headlineSmall
          .copyWith(color: AppColors.textPrimaryDark),
      titleLarge:
          AppTextStyles.titleLarge.copyWith(color: AppColors.textPrimaryDark),
      titleMedium:
          AppTextStyles.titleMedium.copyWith(color: AppColors.textPrimaryDark),
      titleSmall:
          AppTextStyles.titleSmall.copyWith(color: AppColors.textPrimaryDark),
      bodyLarge:
          AppTextStyles.bodyLarge.copyWith(color: AppColors.textPrimaryDark),
      bodyMedium:
          AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimaryDark),
      bodySmall:
          AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondaryDark),
      labelLarge: AppTextStyles.labelLarge.copyWith(color: AppColors.amber),
      labelMedium: AppTextStyles.labelMedium
          .copyWith(color: AppColors.textSecondaryDark),
    ),

    // Input decoration
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceDark,
      border: OutlineInputBorder(
        borderRadius: AppRadius.medium,
        borderSide: const BorderSide(color: AppColors.borderDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.medium,
        borderSide: const BorderSide(color: AppColors.borderDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.medium,
        borderSide: const BorderSide(color: AppColors.amber, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppRadius.medium,
        borderSide: const BorderSide(color: AppColors.error),
      ),
      contentPadding: AppSpacing.allMd,
    ),

    // Button themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.amber,
        foregroundColor: AppColors.deepBlue,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.medium,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        textStyle: AppTextStyles.button,
        elevation: 2,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.amber,
        textStyle: AppTextStyles.button,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.amber,
        side: const BorderSide(color: AppColors.amber),
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.medium,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        textStyle: AppTextStyles.button,
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.amber,
      foregroundColor: AppColors.deepBlue,
      elevation: 4,
    ),

    // Card theme
    cardTheme: CardTheme(
      color: AppColors.surfaceDark,
      elevation: 2,
      shadowColor: Colors.black45,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.large,
      ),
      margin: AppSpacing.allMd,
    ),

    // Divider theme
    dividerTheme: const DividerThemeData(
      color: AppColors.borderDark,
      thickness: 1,
      space: AppSpacing.md,
    ),

    // Chip theme
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.surfaceDark,
      selectedColor: AppColors.amber,
      labelStyle:
          AppTextStyles.labelMedium.copyWith(color: AppColors.textPrimaryDark),
      padding: AppSpacing.allSm,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.small,
      ),
    ),
  );
}
