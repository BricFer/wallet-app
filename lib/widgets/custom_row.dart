import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key, required this.text, this.icon, this.faIcon});

  final String text;
  final IconData? icon;
  final FaIconData? faIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (icon != null) Icon(icon),
        if (faIcon != null) FaIcon(faIcon),
        SizedBox(width: 12),
        Text(text),
      ],
    );
  }
}
