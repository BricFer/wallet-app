import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/themes/app_decoration.dart';

class EditDialog extends StatefulWidget {
  const EditDialog({
    required this.label,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  final String label;
  final TextEditingController controller;
  final Future<void> Function(String) onSave;
  final VoidCallback onCancel;

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Edit ${widget.label.toLowerCase()}"),
      content: TextField(
        controller: widget.controller,
        autofocus: true,
        decoration: AppDecoration.textInput(
          context,
          hintText: "New ${widget.label.toLowerCase()}",
        ),
      ),
      actions: [
        IconButton(
          onPressed: _isLoading ? null : widget.onCancel,
          icon: Icon(AppIcons.cancelIcon),
        ),
        IconButton(
          onPressed: _isLoading ? null : _handleSave,
          icon: _isLoading
              ? SizedBox(
                  width: AppDimens.width18,
                  height: AppDimens.height18,
                  child: CircularProgressIndicator(
                    strokeWidth: AppDimens.width2,
                  ),
                )
              : Icon(AppIcons.saveIcon),
        ),
      ],
    );
  }

  Future<void> _handleSave() async {
    final newValue = widget.controller.text.trim();
    if (newValue.isEmpty || newValue == "") return;

    setState(() => _isLoading = true);

    try {
      await widget.onSave(newValue);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
