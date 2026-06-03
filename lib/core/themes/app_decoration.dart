import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/constants/paddings.dart';
import 'package:wallet_app/core/themes/container_theme.dart';

class AppDecoration {
  const AppDecoration();

  static BoxDecoration container(
    BuildContext context, {
    Color? containerBackgroud,
    bool showGradient = true,
  }) {
    final containerTheme = Theme.of(context).extension<AppContainerTheme>()!;

    return BoxDecoration(
      color: containerBackgroud,
      gradient: showGradient ? containerTheme.gradientColor : null,
      borderRadius: const BorderRadius.all(Radius.circular(AppDimens.radius12)),
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

  static InputDecorationTheme radioInput(BuildContext context) {
    final Color inputColor = Theme.of(context).colorScheme.primary;

    return InputDecorationTheme(
      contentPadding: AppPaddings.paddingAll8,

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppDimens.radius12)),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: AppDimens.width0,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppDimens.radius12)),
        borderSide: BorderSide(color: inputColor, width: AppDimens.width2),
      ),
    );
  }

  static InputDecoration textInput(
    BuildContext context, {
    IconData? icon,
    FaIconData? faIcon,
    String? hintText,
    String? labelText,
  }) {
    final Color inputColor = Theme.of(context).colorScheme.primary;
    var displayedIcon;

    if (icon != null) displayedIcon = Icon(icon);
    if (faIcon != null) displayedIcon = FaIcon(faIcon);

    return InputDecoration(
      contentPadding: AppPaddings.paddingAll8,
      icon: displayedIcon,
      hintText: hintText,
      labelText: labelText,
      labelStyle: Theme.of(context).textTheme.bodyMedium,
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppDimens.radius12)),
        borderSide: BorderSide(color: inputColor, width: AppDimens.width2),
      ),

      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: inputColor, width: AppDimens.width2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppDimens.radius12)),
        borderSide: BorderSide(color: inputColor, width: AppDimens.width2),
      ),
    );
  }
}
