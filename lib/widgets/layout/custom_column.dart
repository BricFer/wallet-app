import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/dimens.dart';

class CustomColumn extends StatelessWidget {
  const CustomColumn({
    super.key,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.spacing,
    required this.children,
  });

  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final double? spacing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      spacing: spacing ?? AppDimens.spacing24,
      children: children,
    );
  }
}
