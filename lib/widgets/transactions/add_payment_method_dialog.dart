import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/themes/app_decoration.dart';
import 'package:wallet_app/models/payment_method/payment_method_request.dart';
import 'package:wallet_app/models/payment_method/payment_type.dart';
import 'package:wallet_app/widgets/forms/form_input.dart';

class AddPaymentMethodDialog extends StatefulWidget {
  const AddPaymentMethodDialog({super.key, required this.onSubmit});

  final Future<int?> Function(PaymentMethodRequest dto) onSubmit;

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
      final createdMethodId = await widget.onSubmit(dto);
      if (!mounted) return;
      context.pop(createdMethodId);
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
    final _textTheme = Theme.of(context).textTheme;
    String? label = 'Payment type';

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
            SizedBox(height: AppDimens.height18),
            CustomFormInput(
              labelText: Strings.methodIssuer,
              controller: _issuerController,
            ),
            SizedBox(height: AppDimens.height18),
            SwitchListTile(
              title: Text('Make default?', style: _textTheme.bodyMedium),
              value: _isDefault,
              onChanged: (value) {
                setState(() {
                  _isDefault = value;
                });
              },
            ),
            SizedBox(height: AppDimens.height18),
            SwitchListTile(
              title: Text(
                'Active payment method?',
                style: _textTheme.bodyMedium,
              ),
              value: _isActive,
              onChanged: (value) {
                setState(() {
                  _isActive = value;
                });
              },
            ),
            SizedBox(height: AppDimens.height18),
            DropdownMenu<PaymentType>(
              expandedInsets: EdgeInsets.zero,
              initialSelection: _selectedType,
              label: Text(label, style: _textTheme.bodySmall),
              inputDecorationTheme: AppDecoration.dropdown(context),
              dropdownMenuEntries: PaymentType.values.map((type) {
                return DropdownMenuEntry(value: type, label: type.typeName);
              }).toList(),
              onSelected: (value) {
                if (value != null) {
                  setState(() {
                    _selectedType = value;
                  });
                }
              },
            ),
            SizedBox(height: AppDimens.height18),
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
