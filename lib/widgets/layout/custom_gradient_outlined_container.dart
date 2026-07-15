import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/themes/container_theme.dart';

class CustomGradientOutlinedContainer extends StatelessWidget {
  final Widget child;
  final ButtonStyle? style;
  final double? thickness;
  final Color? background;
  final double? width;
  final double? height;

  const CustomGradientOutlinedContainer({
    super.key,
    required this.child,
    this.style,
    this.thickness,
    this.background,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final _containerTheme = Theme.of(context).extension<AppContainerTheme>()!;
    final _colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: _containerTheme.gradientColor,
          borderRadius: BorderRadius.circular(AppDimens.radius8),
        ),
        child: Container(
          width: width,
          height: height,
          padding: AppPaddings.paddingAll16,
          decoration: BoxDecoration(
            color: _colorScheme.surface,
            borderRadius: BorderRadius.circular(AppDimens.radius4),
          ),
          margin: EdgeInsets.all(thickness ?? AppDimens.width4),
          child: child,
        ),
      ),
    );
  }
}
