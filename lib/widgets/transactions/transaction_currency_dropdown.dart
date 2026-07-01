import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/constants.dart';

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
    final Color inputColor = Theme.of(context).colorScheme.primary;
    final _textTheme = Theme.of(context).textTheme;
    final currencies = DefaultCurrency.currencies;

    return DropdownMenu<String>(
      initialSelection: widget.selectedCurrency,
      textAlign: TextAlign.center,
      textStyle: _textTheme.bodyMedium,
      menuHeight: AppDimens.height150,
      width: AppDimens.width72,
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
      inputDecorationTheme: InputDecorationTheme(
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppDimens.radius12)),
          borderSide: BorderSide(color: inputColor, width: AppDimens.width2),
        ),

        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: inputColor, width: AppDimens.width2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppDimens.radius12)),
          borderSide: BorderSide(color: inputColor, width: AppDimens.width2),
        ),
      ),

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
