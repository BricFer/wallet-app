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
    BorderRadiusGeometry? borderRadius,
    bool showGradient = true,
  }) {
    final _containerTheme = Theme.of(context).extension<AppContainerTheme>()!;

    return BoxDecoration(
      color: containerBackgroud,
      gradient: showGradient ? _containerTheme.gradientColor : null,
      borderRadius:
          borderRadius ?? BorderRadius.all(Radius.circular(AppDimens.radius12)),
      boxShadow: [
        BoxShadow(
          color: _containerTheme.containerShadow,
          spreadRadius: 2,
          blurRadius: 3,
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

  static InputDecorationTheme dropdown(BuildContext context) {
    // final Color inputColor = Theme.of(context).colorScheme.primary;
    final _textTheme = Theme.of(context).textTheme;

    return InputDecorationTheme(
      contentPadding: AppPaddings.paddingAll8,
      labelStyle: _textTheme.bodySmall,
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppDimens.radius12)),
        borderSide: BorderSide(width: AppDimens.width2),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppDimens.radius12)),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: AppDimens.width0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppDimens.radius12)),
        borderSide: BorderSide(width: AppDimens.width2),
      ),
    );
  }

  static InputDecoration textInput(
    BuildContext context, {
    IconData? icon,
    FaIconData? faIcon,
    String? hintText,
    String? labelText,
    Color? fontColor,
  }) {
    final Color inputColor = Theme.of(context).colorScheme.onSurface;
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
        borderSide: BorderSide(color: inputColor, width: AppDimens.width1),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppDimens.radius12)),
        borderSide: BorderSide(color: inputColor, width: AppDimens.width1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppDimens.radius12)),
        borderSide: BorderSide(color: inputColor, width: AppDimens.width1),
      ),
    );
  }
}
