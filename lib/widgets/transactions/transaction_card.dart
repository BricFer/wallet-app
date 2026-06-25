import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/themes/colors.dart';
import 'package:wallet_app/core/themes/container_theme.dart';
import 'package:wallet_app/models/expense/expense_resume_response.dart';
import 'package:wallet_app/screens/add_edit_expense.dart';
import 'package:wallet_app/screens/expense_details.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key, required this.expense});

  final ExpenseResumeResponse expense;

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
                      MaterialPageRoute<void>(
                        builder: (_) =>
                            ExpenseDetails(expenseId: expense.expenseId),
                      ),
                    );
                  },
                  backgroundColor: _colorScheme.secondary,
                  foregroundColor: containerTheme.iconColor,
                  icon: AppIcons.viewIcon,
                  label: Strings.view,
                  borderRadius: BorderRadius.circular(AppDimens.radius12),
                ),

                SizedBox(width: AppDimens.width12),
                SlidableAction(
                  onPressed: (_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            AddEditExpenseScreen(expenseId: expense.expenseId),
                      ),
                    );
                  },
                  backgroundColor: _colorScheme.secondary,
                  foregroundColor: containerTheme.iconColor,
                  icon: AppIcons.editIcon,
                  label: Strings.edit,
                  borderRadius: BorderRadius.circular(AppDimens.radius12),
                ),

                SizedBox(width: AppDimens.width12),
                SlidableAction(
                  onPressed: (_) {},
                  backgroundColor: AppColors.alertColor,
                  foregroundColor: containerTheme.iconColor,
                  icon: AppIcons.deleteIcon,
                  label: Strings.delete,
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
                        text: ('${expense.commerce}\n'),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 20.0,
                          color: containerTheme.fontColorVariant,
                        ),
                      ),
                      if (expense.categoryName != null)
                        TextSpan(
                          text: '${expense.categoryName} · ',
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                color: containerTheme.fontColorVariant,
                              ),
                        ),

                      if (expense.concept != null)
                        TextSpan(
                          text: expense.concept,
                          style: TextStyle(
                            color: containerTheme.fontColorVariant,
                          ),
                        ),
                      TextSpan(
                        text: '\n${expense.date}',
                        style: TextStyle(
                          color: containerTheme.fontColorVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${expense.amount} ${expense.currency}',
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
