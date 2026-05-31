import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wallet_app/core/constants/icons.dart';
import 'package:wallet_app/core/theme/container_theme.dart';

class CustomProfileRow extends StatelessWidget {
  const CustomProfileRow({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final containerTheme = Theme.of(context).extension<AppContainerTheme>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextStyle(color: containerTheme.fontColorVariant)),
        FaIcon(AppIcons.edit),
      ],
    );
  }
}
