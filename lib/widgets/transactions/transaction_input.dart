import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wallet_app/core/themes/app_decoration.dart';

class TransactionInput extends StatefulWidget {
  const TransactionInput({
    super.key,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.icon,
    this.maxLength,
    this.showCursor,
  });

  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final FaIconData? icon;
  final int? maxLength;
  final bool? showCursor;

  @override
  State<TransactionInput> createState() => _TransactionnInputState();
}

class _TransactionnInputState extends State<TransactionInput> {
  final _controller = TextEditingController();
  late String? labelText;
  late String? hintText;
  late TextInputType? keyboardType;
  late FaIconData? icon;
  late int? maxLength;
  late bool? showCursor;

  @override
  void initState() {
    setState(() {
      super.initState();
      labelText = widget.labelText;
      hintText = widget.hintText;
      keyboardType = widget.keyboardType;
      icon = widget.icon;
      maxLength = widget.maxLength;
      showCursor = widget.showCursor;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: _controller,
      decoration: AppDecoration.textInput(
        context,
        labelText: labelText,
        hintText: hintText,
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      // initialValue: commerce,
      onSaved: (String? value) {
        // TODO: Agregar validación para los valores que se agregan
      },
      maxLength: maxLength ?? 75,
      showCursor: showCursor,
    );
  }
}
