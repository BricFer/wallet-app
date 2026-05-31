import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wallet_app/core/theme/container_theme.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.text,
    this.icon,
    this.faIcon,
    this.fontColor,
    this.haveIconColor = false,
  });

  final String text;
  final IconData? icon;
  final FaIconData? faIcon;
  final Color? fontColor;
  final bool haveIconColor;

  @override
  Widget build(BuildContext context) {
    final containerTheme = Theme.of(context).extension<AppContainerTheme>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (icon != null)
          Icon(
            icon,
            color: haveIconColor
                ? containerTheme.iconContainerColor
                : containerTheme.iconColor,
          ),
        if (faIcon != null)
          FaIcon(
            faIcon,
            color: haveIconColor
                ? containerTheme.iconContainerColor
                : containerTheme.iconColor,
          ),
        SizedBox(width: 12.0),
        Text(
          text,
          style: TextStyle(color: fontColor ?? containerTheme.fontColorVariant),
        ),
      ],
    );
  }
}
