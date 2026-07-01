import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/providers/provider.dart';
import 'package:wallet_app/core/themes/app_decoration.dart';
import 'package:wallet_app/core/themes/container_theme.dart';
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
    final createdMethodId = await showDialog(
      context: context,
      builder: (_) {
        return AddPaymentMethodDialog(
          onSubmit: (PaymentMethodRequest dto) async {
            final userId = context.read<AuthProvider>().userId!;

            final method = await context
                .read<PaymentMethodProvider>()
                .saveMethod(userId, dto, null);

            return method?.paymentMethodId;
          },
        );
      },
    );

    if (createdMethodId != null) {
      widget.onChanged(createdMethodId);

      if (!mounted) return;

      widget.controller?.text =
          context
              .read<PaymentMethodProvider>()
              .getById(createdMethodId)
              ?.alias ??
          '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    final _textTheme = Theme.of(context).textTheme;
    final _containerTheme = Theme.of(context).extension<AppContainerTheme>()!;

    final methods = context.watch<PaymentMethodProvider>().methods;

    return DropdownMenu<int>(
      initialSelection: widget.selectedMethodId ?? -1,
      controller: widget.controller,
      width: AppDimens.width245,
      textAlign: TextAlign.center,
      textStyle: _textTheme.bodyMedium,
      trailingIcon: Icon(
        Icons.arrow_drop_down,
        color: _containerTheme.fontColorVariant,
      ),
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

      dropdownMenuEntries: [
        ...methods.map((method) {
          final alias = method.alias;
          final issuer = method.issuer;

          final displayedLabel = (alias != null && alias.isNotEmpty)
              ? alias
              : issuer;
          return DropdownMenuEntry(
            value: method.paymentMethodId,
            label: displayedLabel,
          );
        }),
        DropdownMenuEntry(value: -1, label: Strings.addPaymentMethod),
      ],

      inputDecorationTheme: AppDecoration.dropdown(context),
      onSelected: (value) {
        if (value == null) return;

        if (value == -1) {
          _showAddMethodDialog();
          return;
        }
        widget.onChanged(value);
      },
    );
  }
}
