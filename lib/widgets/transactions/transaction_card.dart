import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:string_capitalize/string_capitalize.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/providers/provider.dart';
import 'package:wallet_app/core/themes/colors.dart';
import 'package:wallet_app/core/themes/container_theme.dart';
import 'package:wallet_app/models/expense/expense_resume_response.dart';
import 'package:wallet_app/widgets/transactions/confirm_delete_dialog.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key, required this.expense});

  final ExpenseResumeResponse expense;

  @override
  Widget build(BuildContext context) {
    final containerTheme = Theme.of(context).extension<AppContainerTheme>()!;
    final _colorScheme = Theme.of(context).colorScheme;

    final currencies = DefaultCurrency.currencies;

    final numberFormat = NumberFormat('#,##0.00');
    final dateFormat = DateFormat('dd-MMMM-yyyy');

    return Card(
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
                  context.push('/expense-details/${expense.expenseId}');
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
                  context.push('/edit-expense/${expense.expenseId}');
                },
                backgroundColor: _colorScheme.secondary,
                foregroundColor: containerTheme.iconColor,
                icon: AppIcons.editIcon,
                label: Strings.edit,
                borderRadius: BorderRadius.circular(AppDimens.radius12),
              ),

              SizedBox(width: AppDimens.width12),
              SlidableAction(
                onPressed: (_) async {
                  final confirmed = await showConfirmDeleteDialog(context);

                  if (!confirmed) return;
                  if (!context.mounted) return;

                  final userId = context.read<UserProvider>().user?.userId;

                  if (userId == null) return;

                  await context.read<ExpenseProvider>().deleteExpense(
                    userId,
                    expense.expenseId,
                    expense.currency,
                  );
                },

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
                        text: '${expense.categoryName?.capitalizeEach()} · ',
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(color: containerTheme.fontColorVariant),
                      ),
                    if (expense.concept != null)
                      TextSpan(
                        text: expense.concept,
                        style: TextStyle(
                          color: containerTheme.fontColorVariant,
                          height: AppDimens.height2,
                        ),
                      ),
                    TextSpan(
                      text: '\n${dateFormat.format(expense.date!)}',
                      style: TextStyle(
                        color: containerTheme.fontColorVariant,
                        height: AppDimens.height2,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${numberFormat.format(expense.amount)}${currencies.firstWhere((c) => (expense.currency.isNotEmpty) && (c.code == expense.currency)).symbol}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: containerTheme.fontColorVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
