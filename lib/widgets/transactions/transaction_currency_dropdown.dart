import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/themes/app_decoration.dart';

class TransactionCurrencyDropdown extends StatefulWidget {
  const TransactionCurrencyDropdown({
    super.key,
    required this.selectedCurrency,
    required this.onChanged,
  });

  final String? selectedCurrency;
  final ValueChanged<String?> onChanged;

  @override
  State<TransactionCurrencyDropdown> createState() =>
      _TransactionCurrencyDropdownState();
}

class _TransactionCurrencyDropdownState
    extends State<TransactionCurrencyDropdown> {
  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    final _textTheme = Theme.of(context).textTheme;
    final currencies = DefaultCurrency.currencies;

    return DropdownMenu<String>(
      initialSelection: widget.selectedCurrency,
      textAlign: TextAlign.center,
      textStyle: _textTheme.bodyMedium,
      menuHeight: AppDimens.height150,
      width: AppDimens.width78,
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
      inputDecorationTheme: AppDecoration.dropdown(context),

      dropdownMenuEntries: currencies.map((c) {
        return DropdownMenuEntry(value: c.code, label: c.symbol);
      }).toList(),

      onSelected: (value) {
        if (value == null) return;

        widget.onChanged(value);
      },
    );
  }
}
