import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/themes/app_decoration.dart';

class TransactionGroup extends StatefulWidget {
  const TransactionGroup({super.key});

  @override
  State<TransactionGroup> createState() => _TransactionGroupState();
}

class _TransactionGroupState extends State<TransactionGroup> {
  final _groupController = TextEditingController();

  @override
  void dispose() {
    _groupController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;

    return Row(
      spacing: AppDimens.spacing8,
      children: [
        Text("Group:", style: Theme.of(context).textTheme.bodyMedium),
        DropdownMenu<String>(
          textAlign: TextAlign.center,
          textStyle: Theme.of(context).textTheme.bodyMedium,
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
          controller: _groupController,
          initialSelection: "none",
          dropdownMenuEntries: [
            // TODO: Traer el listado de grupos creado por el usuario y pintarlo con un for()
            DropdownMenuEntry(
              value: "none",
              label: "[None]",
              enabled: false,
              style: ButtonStyle(),
            ),
            DropdownMenuEntry(
              value: "london",
              label: "London",
              style: ButtonStyle(),
            ),

            // TODO: Agregar un field para la creación de nuevos grupos, con una ventana de dialogo (explicada en la ultima clase)
          ],
          inputDecorationTheme: AppDecoration.radioInput(context),
        ),
      ],
    );
  }
}
