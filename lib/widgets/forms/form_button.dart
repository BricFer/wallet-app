import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/themes/container_theme.dart';

class CustomFormButton extends StatelessWidget {
  const CustomFormButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final _containerTheme = Theme.of(context).extension<AppContainerTheme>()!;
    final _textTheme = Theme.of(context).textTheme;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        elevation: AppDimens.elevation8,
        shadowColor: _containerTheme.containerShadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius12),
        ),
      ),
      child: Ink(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: _containerTheme.gradientColor,
          borderRadius: BorderRadius.circular(AppDimens.radius12),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            label,
            style: _textTheme.bodyLarge?.copyWith(
              color: _containerTheme.fontColorVariant,
            ),
          ),
        ),
      ),
    );
  }
}
