import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/models/group/group_request.dart';
import 'package:wallet_app/widgets/forms/form_input.dart';

class AddGroupDialog extends StatefulWidget {
  const AddGroupDialog({super.key, required this.onSubmit});

  final Future<int?> Function(GroupRequest dto) onSubmit;

  @override
  State<AddGroupDialog> createState() => _AddGroupDialogState();
}

class _AddGroupDialogState extends State<AddGroupDialog> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _budgetLimitController = TextEditingController();

  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _budgetLimitController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_isSubmitting) return;

    final name = _nameController.text.trim();
    final description = _descriptionController.text;
    final budgetLimit = double.tryParse(_budgetLimitController.text);

    if (name.isEmpty) return;

    if (description.isEmpty) {
      debugPrint('Invalid  description.');
      return;
    }

    if (budgetLimit == null) {
      debugPrint('Invalid budget limit.');
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    final dto = GroupRequest(
      name: name,
      description: description,
      budgetLimit: budgetLimit,
    );

    try {
      final createdGroupId = await widget.onSubmit(dto);
      if (!mounted) return;
      context.pop(createdGroupId);
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
      title: Text(Strings.addGroup),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomFormInput(
              labelText: Strings.groupName,
              controller: _nameController,
            ),
            SizedBox(height: AppDimens.height18),
            CustomFormInput(
              labelText: Strings.groupDescription,
              controller: _descriptionController,
            ),
            SizedBox(height: AppDimens.height18),
            CustomFormInput(
              labelText: Strings.groupBudgetLimit,
              controller: _budgetLimitController,
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
