import 'package:flutter/material.dart';
import 'package:wallet_app/core/themes/app_decoration.dart';

class CustomFormInput extends StatefulWidget {
  const CustomFormInput({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.obscureText,
    this.enabled,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? enabled;

  @override
  State<CustomFormInput> createState() => _CustomFormInputState();
}

class _CustomFormInputState extends State<CustomFormInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      decoration: AppDecoration.textInput(context, labelText: widget.labelText),
      style: Theme.of(context).textTheme.bodyMedium,
      obscureText: widget.obscureText ?? false,
      enabled: widget.enabled ?? true,
    );
  }
}
