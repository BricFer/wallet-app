import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/themes/container_theme.dart';

class CustomGradientOutlinedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  final ButtonStyle? style;
  final double? thickness;
  final Color? background;

  const CustomGradientOutlinedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.style,
    this.thickness,
    this.background,
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
          width: AppDimens.width124,
          height: AppDimens.height48,
          decoration: BoxDecoration(
            color: _colorScheme.surface,
            borderRadius: BorderRadius.circular(AppDimens.radius4),
          ),
          margin: EdgeInsets.all(thickness ?? AppDimens.width4),
          child: OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimens.radius18),
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
