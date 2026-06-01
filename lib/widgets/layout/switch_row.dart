import 'package:flutter/material.dart';
import 'package:wallet_app/core/themes/container_theme.dart';

class SwitchRow extends StatefulWidget {
  const SwitchRow({
    super.key,
    required this.label,
    this.mainAxisAlignment,
    this.fontColor,
  });

  final String label;
  final MainAxisAlignment? mainAxisAlignment;
  final Color? fontColor;

  @override
  State<SwitchRow> createState() => _SwitchRowState();
}

class _SwitchRowState extends State<SwitchRow> {
  late String label;
  late MainAxisAlignment? mainAxisAlignment;
  late Color? fontColor;
  bool isActive = true;

  @override
  void initState() {
    super.initState();
    label = widget.label;
    mainAxisAlignment = widget.mainAxisAlignment;
    fontColor = widget.fontColor;
  }

  @override
  Widget build(BuildContext context) {
    final containerTheme = Theme.of(context).extension<AppContainerTheme>()!;

    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(color: fontColor ?? containerTheme.fontColorVariant),
        ),
        Switch(
          value: isActive,
          activeThumbColor: Theme.of(context).colorScheme.tertiary,
          inactiveThumbColor: Theme.of(context).colorScheme.shadow,
          trackColor: WidgetStateProperty.resolveWith<Color?>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              return null;
            }
            return Colors.white24;
          }),
          trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              return null;
            }
            return Colors.transparent;
          }),
          onChanged: (bool value) {
            setState(() {
              isActive = value;
            });
          },
        ),
      ],
    );
  }
}
