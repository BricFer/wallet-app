import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/themes/colors.dart';
import 'package:wallet_app/core/themes/container_theme.dart';
import 'package:wallet_app/screens/add_edit_expense.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key, required this.amount, required this.i});
  final double amount;
  final int i;

  @override
  Widget build(BuildContext context) {
    final containerTheme = Theme.of(context).extension<AppContainerTheme>()!;
    final _colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: Card(
        color: _colorScheme.primary,
        child: Padding(
          padding: AppPaddings.paddingAll16,
          child: Slidable(
            endActionPane: ActionPane(
              motion: const BehindMotion(),
              children: [
                SizedBox(width: AppDimens.width12),
                SlidableAction(
                  onPressed: (_) {
                    Navigator.push(
                      context,
                      // TODO: AddEditExpense tiene que recibir los datos para poder editar
                      MaterialPageRoute(builder: (_) => AddEditExpenseScreen()),
                    );
                  },
                  backgroundColor: _colorScheme.secondary,
                  foregroundColor: containerTheme.iconColor,
                  icon: AppIcons.editIcon,
                  label: Strings.editEn,
                  borderRadius: BorderRadius.circular(AppDimens.radius12),
                ),

                SizedBox(width: AppDimens.width12),
                SlidableAction(
                  onPressed: (_) {},
                  backgroundColor: AppColors.alertColor,
                  foregroundColor: containerTheme.iconColor,
                  icon: AppIcons.deleteIcon,
                  label: Strings.deleteEn,
                  borderRadius: BorderRadius.circular(AppDimens.radius12),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "Comercio $i",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 20.0,
                          color: containerTheme.fontColorVariant,
                        ),
                      ),
                      TextSpan(
                        text: "\nConcepto $i",
                        style: TextStyle(
                          color: containerTheme.fontColorVariant,
                        ),
                      ),
                      TextSpan(
                        text: "\nFecha $i",
                        style: TextStyle(
                          color: containerTheme.fontColorVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "€${amount}0",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: containerTheme.fontColorVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
