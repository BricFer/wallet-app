import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

class AppContainerTheme extends ThemeExtension<AppContainerTheme> {
  final Color background;
  final Color borderColor;
  final double borderRadius;
  final List<BoxShadow>? shadow;

  const AppContainerTheme({
    required this.background,
    required this.borderColor,
    required this.borderRadius,
    this.shadow,
  });

  @override
  AppContainerTheme copyWith({
    Color? background,
    Color? borderColor,
    double? borderRadius,
    List<BoxShadow>? shadow,
  }) {
    return AppContainerTheme(
      background: background ?? this.background,
      borderColor: borderColor ?? this.borderColor,
      borderRadius: borderRadius ?? this.borderRadius,
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  AppContainerTheme lerp(ThemeExtension<AppContainerTheme>? other, double t) {
    if (other is! AppContainerTheme) {
      return this;
    }

    return AppContainerTheme(
      background: Color.lerp(background, other.background, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
      shadow: t < 0.5 ? shadow : other.shadow,
    );
  }
}
