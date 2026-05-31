import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/theme/container_theme.dart';

class AppDecoration {
  static BoxDecoration container(BuildContext context) {
    final containerTheme = Theme.of(context).extension<AppContainerTheme>()!;

    return BoxDecoration(
      gradient: containerTheme.gradientColor,
      borderRadius: const BorderRadius.all(Radius.circular(AppDimens.mdRadius)),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.primary,
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(3, 3),
        ),
      ],
    );
  }
}
