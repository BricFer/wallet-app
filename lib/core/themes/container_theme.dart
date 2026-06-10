import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

class AppContainerTheme extends ThemeExtension<AppContainerTheme> {
  final Color backgroundColor;
  final LinearGradient? gradientColor;
  final Color fontColor;
  final Color fontColorVariant;
  final Color fontColorTransaction;
  final Color iconColor;
  final Color? iconContainerColor;
  final Color borderColor;
  final double borderRadius;
  final List<BoxShadow>? boxShadow;
  final Color containerShadow;

  const AppContainerTheme({
    required this.backgroundColor,
    this.gradientColor,
    required this.fontColor,
    required this.fontColorVariant,
    required this.fontColorTransaction,
    required this.iconColor,
    this.iconContainerColor,
    required this.borderColor,
    required this.borderRadius,
    this.boxShadow,
    required this.containerShadow,
  });

  @override
  AppContainerTheme copyWith({
    Color? backgroundColor,
    LinearGradient? gradientColor,
    Color? fontColor,
    Color? fontColorVariant,
    Color? fontColorTransaction,
    Color? iconColor,
    Color? iconContainerColor,
    Color? borderColor,
    double? borderRadius,
    List<BoxShadow>? boxShadow,
    Color? containerShadow,
  }) {
    return AppContainerTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      gradientColor: gradientColor ?? this.gradientColor,
      fontColor: fontColor ?? this.fontColor,
      fontColorVariant: fontColorVariant ?? this.fontColorVariant,
      fontColorTransaction: fontColorTransaction ?? this.fontColorTransaction,
      iconColor: iconColor ?? this.iconColor,
      iconContainerColor: iconContainerColor ?? this.iconContainerColor,
      borderColor: borderColor ?? this.borderColor,
      borderRadius: borderRadius ?? this.borderRadius,
      boxShadow: boxShadow ?? this.boxShadow,
      containerShadow: containerShadow ?? this.containerShadow,
    );
  }

  @override
  AppContainerTheme lerp(ThemeExtension<AppContainerTheme>? other, double t) {
    if (other is! AppContainerTheme) {
      return this;
    }

    return AppContainerTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      gradientColor: LinearGradient.lerp(
        gradientColor,
        other.gradientColor,
        t,
      )!,
      fontColor: Color.lerp(fontColor, other.fontColor, t)!,
      fontColorVariant: Color.lerp(
        fontColorVariant,
        other.fontColorVariant,
        t,
      )!,
      fontColorTransaction: Color.lerp(
        fontColorTransaction,
        other.fontColorTransaction,
        t,
      )!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      iconContainerColor: Color.lerp(
        iconContainerColor,
        other.iconContainerColor,
        t,
      )!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
      containerShadow: Color.lerp(containerShadow, other.containerShadow, t)!,
      boxShadow: t < 0.5 ? boxShadow : other.boxShadow,
    );
  }
}
