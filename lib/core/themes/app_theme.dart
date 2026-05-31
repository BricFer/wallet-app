import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/themes/app_gradient.dart';
import 'package:wallet_app/core/themes/container_theme.dart';
import 'package:wallet_app/core/themes/colors.dart';
import 'package:wallet_app/core/themes/text_theme.dart';

class AppTheme {
  static const double borderRadius = AppDimens.mdRadius;

  static ThemeData _base(ColorScheme scheme, AppContainerTheme containerTheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme: AppTextTheme.textTheme,
      extensions: [containerTheme],
    );
  }

  // TODO: Evaluar si agregar un lightTheme con colores planos en lugar de con gradient
  static final light = _base(
    const ColorScheme.light(
      primary: AppColors.primaryLight,
      onPrimary: AppColors.onPrimaryLight,
      secondary: AppColors.secondaryLight,
      tertiary: AppColors.tertiaryLight,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.onSurfaceLight,
      shadow: AppColors.shadowColor,
    ),
    AppContainerTheme(
      backgroundColor: AppColors.containerColorLight,
      gradientColor: AppGradient.linearGradientContainerLight,
      fontColor: AppColors.fontColorContainerLight,
      fontColorVariant: AppColors.fontColorContainerVariantLight,
      iconColor: AppColors.iconColorLight,
      iconContainerColor: AppColors.iconColorContainerLight,
      borderColor: AppColors.containerColorLight,
      borderRadius: borderRadius,
    ),
  );

  static final dark = _base(
    const ColorScheme.dark(
      primary: AppColors.primaryDark,
      onPrimary: AppColors.onPrimaryDark,
      secondary: AppColors.secondaryDark,
      tertiary: AppColors.tertiaryDark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.onSurfaceDark,
      shadow: AppColors.shadowColor,
    ),
    AppContainerTheme(
      backgroundColor: AppColors.containerColorDark,
      gradientColor: AppGradient.linearGradientContainerDark,
      fontColor: AppColors.fontColorContainerDark,
      fontColorVariant: AppColors.fontColorContainerVariantDark,
      iconColor: AppColors.iconColorDark,
      iconContainerColor: AppColors.iconColorContainerDark,
      borderColor: AppColors.containerColorDark,
      borderRadius: borderRadius,
    ),
  );

  static final vibrant = _base(
    ColorScheme.fromSeed(
      seedColor: AppColors.primaryVibrant,
      primary: AppColors.primaryVibrant,
      onPrimary: AppColors.onPrimaryVibrant,
      secondary: AppColors.secondaryVibrant,
      tertiary: AppColors.tertiaryVibrant,
      surface: AppColors.surfaceVibrant,
      onSurface: AppColors.onSurfaceVibrart,
      shadow: AppColors.shadowColor,
    ),
    AppContainerTheme(
      backgroundColor: AppColors.containerColorVibrant,
      gradientColor: AppGradient.linearGradientContainerVibrant,
      fontColor: AppColors.fontColorContainerVibrant,
      fontColorVariant: AppColors.fontColorContainerVariantVibrant,
      iconColor: AppColors.iconColorVibrant,
      iconContainerColor: AppColors.iconColorContainerVibrant,
      borderColor: AppColors.containerColorVibrant,
      borderRadius: borderRadius,
    ),
  );

  static final neutral = _base(
    ColorScheme.fromSeed(
      seedColor: AppColors.primaryNeutral,
      primary: AppColors.primaryNeutral,
      onPrimary: AppColors.onPrimaryNeutral,
      secondary: AppColors.secondaryNeutral,
      tertiary: AppColors.tertiaryNeutral,
      surface: AppColors.surfaceNeutral,
      onSurface: AppColors.onSurfaceNeutral,
      shadow: AppColors.shadowColor,
    ),
    AppContainerTheme(
      backgroundColor: AppColors.containerColorNeutral,
      gradientColor: AppGradient.linearGradientContainerNeutral,
      fontColor: AppColors.fontColorContainerNeutral,
      fontColorVariant: AppColors.fontColorContainerVariantNeutral,
      iconColor: AppColors.iconColorNeutral,
      iconContainerColor: AppColors.iconColorContainerNeutral,
      borderColor: AppColors.containerColorNeutral,
      borderRadius: borderRadius,
    ),
  );
}
