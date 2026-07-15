import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/themes/container_theme.dart';

class CustomOutlinedContainer extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final Widget child;

  const CustomOutlinedContainer({
    super.key,
    this.padding,
    this.margin,
    this.decoration,
    this.width,
    this.height,
    this.alignment,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final _containerTheme = Theme.of(context).extension<AppContainerTheme>()!;
    final _colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: width,
      height: height,
      padding: padding ?? AppPaddings.paddingAll8,
      margin: margin,
      decoration: BoxDecoration(
        color: _colorScheme.surface,
        borderRadius: BorderRadius.circular(AppDimens.radius12),
        border: BoxBorder.all(
          color: _containerTheme.backgroundColor,
          width: AppDimens.width2,
        ),
        boxShadow: [
          BoxShadow(
            color: _containerTheme.backgroundColor,
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}
