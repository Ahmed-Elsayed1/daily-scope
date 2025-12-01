import 'package:flutter/material.dart';

import 'colors.dart';

class AppTypography {
  static TextStyle get headline => const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.deepBlue,
      );

  static TextStyle get subtitle => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.deepBlueAlt,
      );

  static TextStyle get body => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      );

  static TextStyle get caption => const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: Colors.black54,
      );
}
