import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/dimens.dart';

class DropdownRegister extends StatelessWidget {
  const DropdownRegister({
    super.key,
    required this.dropdownMenuEntries,
    this.controller,
    required this.onSelected,
  });

  final List<DropdownMenuEntry<String>> dropdownMenuEntries;
  final TextEditingController? controller;
  final ValueChanged<String?> onSelected;

  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    return DropdownMenu<String>(
      textAlign: TextAlign.center,
      textStyle: Theme.of(context).textTheme.bodyMedium,
      menuHeight: AppDimens.height150,
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(_colorScheme.surface),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radius12),
            side: BorderSide(
              color: _colorScheme.secondary,
              width: AppDimens.width2,
            ),
          ),
        ),
      ),
      controller: controller,
      onSelected: onSelected,
      dropdownMenuEntries: dropdownMenuEntries,
    );
  }
}
