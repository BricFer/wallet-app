import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:string_capitalize/string_capitalize.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/providers/category_provider.dart';
import 'package:wallet_app/core/themes/app_decoration.dart';

class TransactionCategoriesDropdown extends StatelessWidget {
  const TransactionCategoriesDropdown({
    super.key,
    required this.selectedCategoryId,
    required this.onChanged,
  });

  final int? selectedCategoryId;
  final ValueChanged<int?> onChanged;

  // En esta clase no se usa controller ya que no se está permitiendo que el usuario escriba
  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    final _textTheme = Theme.of(context).textTheme;
    final categories = context.watch<CategoryProvider>().categories;

    return Row(
      spacing: AppDimens.spacing16,
      children: [
        Text('Category:', style: Theme.of(context).textTheme.bodyMedium),

        DropdownMenu<int>(
          initialSelection: selectedCategoryId,
          textAlign: TextAlign.center,
          textStyle: _textTheme.labelSmall,
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

          label: Text('Select category', style: _textTheme.bodyMedium),
          dropdownMenuEntries: categories.map((c) {
            return DropdownMenuEntry(
              value: c.categoryId,
              label: c.name.capitalize(),
            );
          }).toList(),

          inputDecorationTheme: AppDecoration.radioInput(context),
          onSelected: onChanged,
        ),
      ],
    );
  }
}
