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
    this.controller,
  });

  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final FaIconData? icon;
  final int? maxLength;
  final bool? showCursor;
  final TextEditingController? controller;

  @override
  State<TransactionInput> createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      decoration: AppDecoration.textInput(
        context,
        labelText: widget.labelText,
        hintText: widget.hintText,
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      maxLength: widget.maxLength,
      showCursor: widget.showCursor,
    );
  }
}
