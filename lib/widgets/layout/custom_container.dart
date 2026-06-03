import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/paddings.dart';
import 'package:wallet_app/core/themes/app_decoration.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.padding,
    this.margin,
    this.decoration,
    this.width,
    this.height,
    this.alignment,
    required this.child,
  });

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? AppPaddings.paddingAll16,
      margin: margin,
      decoration: decoration ?? AppDecoration.container(context),
      width: width,
      height: height,
      alignment: alignment,
      child: child,
    );
  }
}
