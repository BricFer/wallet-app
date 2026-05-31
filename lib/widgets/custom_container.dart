import 'package:flutter/material.dart';
import 'package:wallet_app/core/theme/app_decoration.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.alignment,
    required this.child,
  });

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: AppDecoration.container(context),
      width: width,
      height: height,
      alignment: alignment,
      child: child,
    );
  }
}
