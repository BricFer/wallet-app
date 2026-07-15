import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/strings.dart';

Future<bool> showConfirmDeleteDialog(BuildContext context) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Delete'),
      content: Text('Are you sure you want to delete this item?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx, false),
          child: Text(Strings.cancel),
        ),
        TextButton(
          onPressed: () => Navigator.pop(ctx, true),
          child: Text(Strings.delete),
        ),
      ],
    ),
  );
  return confirmed ?? false;
}
