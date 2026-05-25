import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/theme/app_container_theme.dart';
import 'package:wallet_app/core/theme/colors.dart';
import 'package:wallet_app/core/theme/text_theme.dart';

class AppTheme {
  static const double borderRadius = AppDimens.mdRadius;

  static ThemeData _base(ColorScheme scheme, AppContainerTheme containerTheme) {
    return ThemeData(
      useMaterial3: true, // Para que se usa esto?
      colorScheme: scheme,
      textTheme: AppTextTheme.textTheme,
      extensions: [containerTheme],
    );
  }

  static final light = _base(
    const ColorScheme.light(
      primary: AppColors.primaryLight,
      secondary: AppColors.secondaryLight,
      tertiary: AppColors.tertiaryLight,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.fontColorLight,
    ),
    AppContainerTheme(
      background: AppColors.secondaryLight,
      borderColor: AppColors.secondaryLight,
      borderRadius: borderRadius,
    ),
  );

  static final dark = _base(
    const ColorScheme.dark(
      primary: AppColors.primaryDark,
      secondary: AppColors.secondaryDark,
      tertiary: AppColors.tertiaryDark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.fontColorDark,
    ),
    AppContainerTheme(
      background: AppColors.primaryDark,
      borderColor: AppColors.primaryDark,
      borderRadius: borderRadius,
    ),
  );

  static final vibrant = _base(
    ColorScheme.fromSeed(
      seedColor: AppColors.primaryVibrant,
      primary: AppColors.primaryVibrant,
      secondary: AppColors.secondaryVibrant,
      tertiary: AppColors.tertiaryVibrant,
      surface: AppColors.surfaceVibrant,
      onSurface: AppColors.fontConlorVibrant,
    
    ),
    AppContainerTheme(
      background: AppColors.primaryVibrant,
      borderColor: AppColors.primaryVibrant,
      borderRadius: borderRadius,
    ),
  );

  static final neutral = _base(
    ColorScheme.fromSeed(
      seedColor: AppColors.primaryNeutral,
      primary: AppColors.primaryNeutral,
      secondary: AppColors.secondaryNeutral,
      tertiary: AppColors.tertiaryNeutral,
      surface: AppColors.surfaceNeutral,
      onSurface: AppColors.fontColorNeutral,
    ),
    AppContainerTheme(
      background: AppColors.secondaryNeutral,
      borderColor: AppColors.secondaryNeutral,
      borderRadius: borderRadius,
    ),
  );
}
