import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/constants/icons.dart';
import 'package:wallet_app/core/themes/container_theme.dart';
import 'package:wallet_app/widgets/profile/edit_dialog.dart';

class CustomProfileRow extends StatelessWidget {
  const CustomProfileRow({
    super.key,
    required this.label,
    this.subtext,
    required this.onSave,
  });

  final String label;
  final String? subtext;
  final Future<void> Function(String value) onSave;

  @override
  Widget build(BuildContext context) {
    final _containerTheme = Theme.of(context).extension<AppContainerTheme>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: _containerTheme.fontColorVariant,
                ),
              ),
              TextSpan(
                text: subtext,
                style: TextStyle(color: _containerTheme.fontColorVariant),
              ),
            ],
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _showEditDialog(context),
          child: FaIcon(
            AppIcons.editFaIcon,
            color: _containerTheme.iconContainerColor,
            size: AppDimens.iconSize10,
          ),
        ),
      ],
    );
  }

  void _showEditDialog(BuildContext context) {
    TextEditingController controller = TextEditingController(text: subtext);

    showDialog(
      barrierDismissible: false,
      barrierColor: Theme.of(context).colorScheme.primary,
      context: context,
      builder: (dialogContext) => EditDialog(
        label: label,
        controller: controller,
        onSave: (value) async {
          await onSave(value);
          if (dialogContext.mounted) Navigator.pop(dialogContext);
        },
        onCancel: () => Navigator.pop(dialogContext),
      ),
    );
  }
}
