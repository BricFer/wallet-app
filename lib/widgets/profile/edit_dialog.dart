import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/themes/app_decoration.dart';

class EditProfileFileDialog extends StatefulWidget {
  const EditProfileFileDialog({
    super.key,
    required this.label,
    this.initialValue,
  });

  final String label;
  final String? initialValue;

  @override
  State<EditProfileFileDialog> createState() => _EditProfileFileDialogState();
}

class _EditProfileFileDialogState extends State<EditProfileFileDialog> {
  bool _isSubmitting = false;
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Edit ${widget.label.toLowerCase()}"),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: AppDecoration.textInput(
          context,
          hintText: "New ${widget.label.toLowerCase()}",
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text(Strings.cancel),
        ),
        TextButton(
          onPressed: _isSubmitting
              ? null
              : () {
                  final value = _controller.text.trim();

                  if (value.isEmpty) return;

                  context.pop(value);
                },
          child: _isSubmitting
              ? SizedBox(
                  width: AppDimens.width18,
                  height: AppDimens.height18,
                  child: CircularProgressIndicator(
                    strokeWidth: AppDimens.width2,
                  ),
                )
              : Text(Strings.save),
        ),
      ],
    );
  }
}
