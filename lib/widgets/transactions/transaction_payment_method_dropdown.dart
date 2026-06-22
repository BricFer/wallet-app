import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/providers/auth_provider.dart';
import 'package:wallet_app/core/providers/payment_method_provider.dart';
import 'package:wallet_app/core/themes/app_decoration.dart';
import 'package:wallet_app/models/payment_method/payment_method_request.dart';
import 'package:wallet_app/widgets/transactions/add_payment_method_dialog.dart';

class TransactionPaymentMethodDropdown extends StatefulWidget {
  const TransactionPaymentMethodDropdown({
    super.key,
    required this.selectedMethodId,
    required this.onChanged,
    this.controller,
  });

  final int? selectedMethodId;
  final ValueChanged<int?> onChanged;
  final TextEditingController? controller;

  @override
  State<TransactionPaymentMethodDropdown> createState() =>
      _TransactionPaymentMethodDropdownState();
}

class _TransactionPaymentMethodDropdownState
    extends State<TransactionPaymentMethodDropdown> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadMethods();
    });
  }

  Future<void> _loadMethods() async {
    final userId = context.read<AuthProvider>().userId!;

    await context.read<PaymentMethodProvider>().loadActiveMethods(userId);
  }

  Future<void> _showAddMethodDialog() async {
    await showDialog(
      context: context,
      builder: (_) {
        return AddPaymentMethodDialog(
          onSubmit: (PaymentMethodRequest dto) async {
            final userId = context.read<AuthProvider>().userId!;

            await context.read<PaymentMethodProvider>().saveMethod(
              userId,
              dto,
              null,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    final methods = context.watch<PaymentMethodProvider>().methods;

    return Row(
      spacing: AppDimens.spacing8,
      children: [
        Text('Payment Method', style: Theme.of(context).textTheme.bodyMedium),

        Expanded(
          child: DropdownMenu<int>(
            initialSelection: widget.selectedMethodId,
            controller: widget.controller,
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

            label: const Text('Select a payment method:'),
            dropdownMenuEntries: [
              ...methods.map((method) {
                return DropdownMenuEntry(
                  value: method.paymentMethodId,
                  label: method.alias?.isNotEmpty == true
                      ? method.alias!
                      : method.issuer,
                );
              }),
              DropdownMenuEntry(value: -1, label: Strings.addPaymentMethod),
            ],

            inputDecorationTheme: AppDecoration.radioInput(context),
            onSelected: (value) {
              if (value == null) return;

              if (value == -1) {
                _showAddMethodDialog();
                return;
              }
              widget.onChanged(value);
            },
          ),
        ),
      ],
    );
  }
}
