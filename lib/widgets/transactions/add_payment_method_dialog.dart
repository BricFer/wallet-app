import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/models/payment_method/payment_method_request.dart';
import 'package:wallet_app/widgets/forms/form_input.dart';

class AddPaymentMethodDialog extends StatefulWidget {
  const AddPaymentMethodDialog({super.key, required this.onSubmit});

  final Future<void> Function(PaymentMethodRequest dto) onSubmit;

  @override
  State<AddPaymentMethodDialog> createState() => _AddPaymentMethodDialogState();
}

class _AddPaymentMethodDialogState extends State<AddPaymentMethodDialog> {
  final _aliasController = TextEditingController();
  final _issuerController = TextEditingController();

  bool _isDefault = false;
  bool _isActive = true;
  PaymentType _selectedType = PaymentType.CASH;

  bool _isSubmitting = false;

  @override
  void dispose() {
    _aliasController.dispose();
    _issuerController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_isSubmitting) return;

    final issuer = _issuerController.text.trim();

    if (issuer.isEmpty) return;

    setState(() {
      _isSubmitting = true;
    });

    final dto = PaymentMethodRequest(
      alias: _aliasController.text.trim(),
      type: _selectedType,
      issuer: issuer,
      isDefault: _isDefault,
      isActive: _isActive,
    );

    try {
      await widget.onSubmit(dto);
      if (!mounted) return;
      context.pop();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(Strings.addPaymentMethod),
      content: SingleChildScrollView(
        child: Column(
          // Evita que el diálogo ocupe más espacio del necesario
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomFormInput(
              labelText: Strings.methodAlias,
              controller: _aliasController,
            ),
            CustomFormInput(
              labelText: Strings.methodIssuer,
              controller: _issuerController,
            ),
            SwitchListTile(
              title: const Text('Make default?'),
              value: _isDefault,
              onChanged: (value) {
                setState(() {
                  _isDefault = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Active payment method?'),
              value: _isActive,
              onChanged: (value) {
                setState(() {
                  _isActive = value;
                });
              },
            ),
            DropdownMenu<PaymentType>(
              initialSelection: _selectedType,
              label: const Text('Payment type'),
              dropdownMenuEntries: PaymentType.values.map((type) {
                return DropdownMenuEntry(value: type, label: type.name);
              }).toList(),
              onSelected: (value) {
                if (value != null) {
                  setState(() {
                    _selectedType = value;
                  });
                }
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text(Strings.cancel),
        ),
        // Se usa este ya que es más adecuado para el envío de formularios
        FilledButton(
          onPressed: _isSubmitting ? null : _submit,
          child: _isSubmitting
              ? const SizedBox(
                  width: AppDimens.width18,
                  height: AppDimens.height18,
                  child: CircularProgressIndicator(
                    strokeWidth: AppDimens.width1,
                  ),
                )
              : const Text(Strings.save),
        ),
      ],
    );
  }
}
