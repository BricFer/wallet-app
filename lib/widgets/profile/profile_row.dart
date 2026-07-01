import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/constants/icons.dart';
import 'package:wallet_app/core/themes/container_theme.dart';
import 'package:wallet_app/widgets/profile/edit_dialog.dart';

class CustomProfileRow extends StatefulWidget {
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
  State<CustomProfileRow> createState() => _CustomProfileRowState();
}

class _CustomProfileRowState extends State<CustomProfileRow> {
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
                text: widget.label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: _containerTheme.fontColorVariant,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: widget.subtext,
                style: TextStyle(color: _containerTheme.fontColorVariant),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () async {
            final result = await showDialog(
              context: context,
              builder: (_) => EditProfileFileDialog(
                label: widget.label,
                initialValue: widget.subtext ?? '',
              ),
            );

            if (result != null) {
              await widget.onSave(result);
            }
          },
          icon: FaIcon(
            AppIcons.editFaIcon,
            color: _containerTheme.iconContainerColor,
            size: AppDimens.iconSize10,
          ),
        ),
      ],
    );
  }
}
