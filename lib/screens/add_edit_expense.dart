import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/constants/icons.dart';
import 'package:wallet_app/core/constants/paddings.dart';
import 'package:wallet_app/core/themes/app_decoration.dart';
import 'package:wallet_app/core/themes/container_theme.dart';
import 'package:wallet_app/widgets/widgets.dart';

class AddEditExpenseScreen extends StatefulWidget {
  const AddEditExpenseScreen({super.key});

  @override
  State<AddEditExpenseScreen> createState() => _AddEditExpenseScreenState();
}

class _AddEditExpenseScreenState extends State<AddEditExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    final containerTheme = Theme.of(context).extension<AppContainerTheme>()!;
    final _colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: CustomAppBar(title: 'Add Expense'),
      body: ListView(
        padding: AppPaddings.paddingLTR16B106,
        children: [
          TransactionGroup(),
          TransactionInput(
            labelText: 'Commerce',
            hintText: 'Ex. Mercadona',
            icon: AppIcons.groceryFaIcon,
          ),
          TransactionInput(labelText: 'Concept', hintText: 'Ex. Weekly buying'),
          TransactionInput(
            labelText: 'Amount',
            hintText: 'Ex. 0,00€',
            keyboardType: TextInputType.number,
            icon: AppIcons.euroFaIcon,
          ),
          //
          TransactionType(),
          TransactionInput(labelText: 'Note', maxLength: 150, showCursor: true),
          SizedBox(height: AppDimens.height48),
          CustomContainer(
            decoration: AppDecoration.container(
              context,
              containerBackgroud: _colorScheme.tertiary,
              showGradient: false,
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(AppIcons.calendarIcon),
                Text(
                  'Payment Method',
                  style: TextStyle(color: containerTheme.fontColorTransaction),
                ),
                Icon(AppIcons.cameraIcon),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
