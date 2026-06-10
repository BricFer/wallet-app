import 'package:flutter/material.dart';
import 'package:wallet_app/core/themes/app_decoration.dart';

class CustomFormInput extends StatefulWidget {
  const CustomFormInput({
    super.key,
    this.controller,
    this.initialValue,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.obscureText,
    this.enabled,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? enabled;

  @override
  State<CustomFormInput> createState() => _CustomFormInputState();
}

class _CustomFormInputState extends State<CustomFormInput> {
  late TextEditingController? controller;
  late String? initialValue;
  late String? labelText;
  late String? hintText;
  late TextInputType? keyboardType;
  late bool obscureText;
  late bool enabled;

  @override
  void initState() {
    setState(() {
      super.initState();
      controller = widget.controller;
      initialValue = widget.initialValue;
      labelText = widget.labelText;
      hintText = widget.hintText;
      keyboardType = widget.keyboardType;
      obscureText = widget.obscureText ?? false;
      enabled = widget.enabled ?? true;
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: AppDecoration.textInput(context, labelText: labelText),
      style: Theme.of(context).textTheme.bodyMedium,
      obscureText: obscureText,
      enabled: enabled,
    );
  }
}
