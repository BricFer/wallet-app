import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/providers/auth_provider.dart';
import 'package:wallet_app/core/providers/group_provider.dart';
import 'package:wallet_app/core/themes/app_decoration.dart';
import 'package:wallet_app/models/group/group_request.dart';
import 'package:wallet_app/widgets/transactions/add_group_dialog.dart';

class TransactionGroupDropdown extends StatefulWidget {
  const TransactionGroupDropdown({
    super.key,
    required this.selectedGroupId,
    required this.onChanged,
    this.controller,
  });

  final int? selectedGroupId;
  final ValueChanged<int?> onChanged;
  final TextEditingController? controller;

  @override
  State<TransactionGroupDropdown> createState() =>
      _TransactionGroupDropdownState();
}

class _TransactionGroupDropdownState extends State<TransactionGroupDropdown> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadGroups();
    });
  }

  Future<void> _loadGroups() async {
    final userId = context.read<AuthProvider>().userId!;

    await context.read<GroupProvider>().loadActiveGroups(userId);
  }

  Future<void> _showAddGroupDialog() async {
    final createGroupId = await showDialog<int>(
      context: context,
      builder: (_) {
        return AddGroupDialog(
          onSubmit: (GroupRequest dto) async {
            final userId = context.read<AuthProvider>().userId!;

            final group = await context.read<GroupProvider>().saveGroup(
              userId,
              dto,
              null,
            );

            return group?.groupId;
          },
        );
      },
    );

    if (createGroupId != null) {
      widget.onChanged(createGroupId);

      if (!mounted) return;

      widget.controller?.text =
          context.read<GroupProvider>().getById(createGroupId)?.name ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    final _textTheme = Theme.of(context).textTheme;
    final groups = context.watch<GroupProvider>().groups;

    return Row(
      spacing: AppDimens.spacing8,
      children: [
        Text('Groups', style: Theme.of(context).textTheme.bodyMedium),

        Expanded(
          child: DropdownMenu<int>(
            initialSelection: widget.selectedGroupId ?? -1,
            controller: widget.controller,
            width: AppDimens.width245,
            textStyle: _textTheme.bodyMedium,
            menuStyle: MenuStyle(
              backgroundColor: WidgetStateProperty.all(_colorScheme.surface),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.radius12),
                  side: BorderSide(
                    color: _colorScheme.secondary,
                    width: AppDimens.width2,
                  ),
                ),
              ),
            ),

            dropdownMenuEntries: [
              ...groups.map((g) {
                return DropdownMenuEntry(value: g.groupId, label: g.name);
              }),
              DropdownMenuEntry(value: -1, label: Strings.addGroup),
            ],

            inputDecorationTheme: AppDecoration.radioInput(context),
            onSelected: (value) {
              if (value == null) return;

              if (value == -1) {
                _showAddGroupDialog();
                return;
              }
              widget.onChanged(value);
            },
          ),
        ),
      ],
    );
  }
}
