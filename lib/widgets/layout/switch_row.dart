import 'package:flutter/material.dart';
import 'package:wallet_app/core/themes/container_theme.dart';

class SwitchRow extends StatefulWidget {
  const SwitchRow({
    super.key,
    required this.label,
    this.mainAxisAlignment,
    this.fontColor,
    this.isActive,
  });

  final String label;
  final MainAxisAlignment? mainAxisAlignment;
  final Color? fontColor;
  final bool? isActive;

  @override
  State<SwitchRow> createState() => _SwitchRowState();
}

class _SwitchRowState extends State<SwitchRow> {
  late bool? isActive;

  @override
  void initState() {
    super.initState();
    isActive = widget.isActive;
  }

  @override
  Widget build(BuildContext context) {
    final containerTheme = Theme.of(context).extension<AppContainerTheme>()!;
    final _colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.label,
          style: TextStyle(color: widget.fontColor ?? containerTheme.fontColorVariant),
        ),
        Switch(
          value: isActive ?? false,
          activeThumbColor: _colorScheme.tertiary,
          inactiveThumbColor: _colorScheme.shadow,
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
