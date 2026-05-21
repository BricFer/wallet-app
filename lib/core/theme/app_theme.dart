import 'package:flutter/material.dart';
import 'package:wallet_app/core/theme/colors.dart';
import 'package:wallet_app/core/theme/text_theme.dart';

class AppTheme {
  static ThemeData _base(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: true, // Para que se usa esto?
      colorScheme: scheme,
      textTheme: AppTextTheme.textTheme,
    );
  }

  static final light = _base(
    const ColorScheme.light(
      primary: AppColors.primaryLight,
      secondary: AppColors.secondaryLight,
      tertiary: AppColors.tertiaryLight,
      surface: AppColors.surfaceLight,
    ),
  );

  static final dark = _base(
    const ColorScheme.dark(
      primary: AppColors.primaryDark,
      secondary: AppColors.secondaryDark,
      tertiary: AppColors.tertiaryDark,
      surface: AppColors.surfaceDark,
    ),
  );

  static final vibrant = _base(
    ColorScheme.fromSeed(
      seedColor: AppColors.primaryVibrant,
      primary: AppColors.primaryVibrant,
      secondary: AppColors.secondaryVibrant,
      tertiary: AppColors.tertiaryVibrant,
      surface: AppColors.surfaceDark,
    ),
  );

  static final neutral = _base(
    ColorScheme.fromSeed(
      seedColor: AppColors.primaryNeutral,
      primary: AppColors.primaryNeutral,
      secondary: AppColors.secondaryNeutral,
      tertiary: AppColors.tertiaryNeutral,
      surface: AppColors.surfaceNeutral,
    ),
  );
}
