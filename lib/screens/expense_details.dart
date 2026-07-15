import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/providers/provider.dart';
import 'package:wallet_app/models/expense/expense_detail_response.dart';
import 'package:wallet_app/service/expense_service.dart';
import 'package:wallet_app/widgets/widgets.dart';

class ExpenseDetails extends StatefulWidget {
  const ExpenseDetails({super.key, required this.expenseId});

  final int expenseId;

  @override
  State<ExpenseDetails> createState() => _ExpenseDetailsState();
}

class _ExpenseDetailsState extends State<ExpenseDetails> {
  final ExpenseService _service = ExpenseService();

  ExpenseDetailResponse? expense;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserProvider>().loadUser();
      _loadExpense();
    });
  }

  Future<void> _loadExpense() async {
    try {
      final userId = context.read<UserProvider>().user?.userId;
      final expenseId = widget.expenseId;

      final result = await _service.getExpenseInfo(userId, expenseId);

      setState(() {
        expense = result;
        isLoading = false;
      });
    } catch (e, stack) {
      debugPrint('>>> ERROR: $e');
      debugPrint('>>> STACK: $stack');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }
    final _textTheme = Theme.of(context).textTheme;

    final alias =
        expense?.paymentMethodAlias ?? expense?.paymentMethodType?.typeName;

    final currencies = DefaultCurrency.currencies;
    final currencySymbol = currencies
        .firstWhere((c) => c.code == expense?.currency)
        .symbol;
    final numberFormat = NumberFormat('#,##0.00');

    return Scaffold(
      appBar: CustomAppBar(title: Strings.expenseDetails),
      body: Padding(
        padding: AppPaddings.paddingAll16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: AppDimens.spacing24,
          children: [
            SizedBox(height: AppDimens.spacing16),
            CustomGradientOutlinedContainer(
              child: Column(
                spacing: AppDimens.spacing16,
                children: [
                  TransactionDetailsRow(
                    label: 'Group\n',
                    subtext: expense?.groupName ?? 'No group assigned',
                  ),
                  TransactionDetailsRow(
                    label: 'Category\n',
                    subtext: expense?.categoryName ?? 'No category assigned',
                  ),
                  TransactionDetailsRow(
                    label: 'Commerce\n',
                    subtext: expense?.commerce ?? '',
                  ),
                  TransactionDetailsRow(
                    label: 'Concept\n',
                    subtext: expense?.concept ?? 'No concept',
                  ),
                  TransactionDetailsRow(
                    label: 'Amount\n',
                    subtext:
                        '${numberFormat.format(expense?.amount)}$currencySymbol',
                  ),
                  TransactionDetailsRow(
                    label: 'Payment Method\n',
                    subtext: alias ?? '',
                  ),
                  TransactionDetailsRow(
                    label: 'Note\n',
                    subtext: expense?.note ?? '',
                  ),
                ],
              ),
            ),
            Row(
              spacing: AppDimens.spacing16,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomGradientOutlinedButton(
                  onPressed: () {
                    context.push('/edit-expense/${expense?.expenseId}');
                  },
                  child: Text(
                    Strings.edit,
                    style: _textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CustomGradientOutlinedButton(
                  onPressed: () async {
                    final confirmed = await showConfirmDeleteDialog(context);

                    if (!confirmed) return;
                    if (!context.mounted) return;

                    final userId = context.read<UserProvider>().user?.userId;

                    if (userId == null) return;

                    final expenseId = expense?.expenseId;
                    final currency = expense?.currency;

                    if (expenseId != null && currency != null) {
                      await context.read<ExpenseProvider>().deleteExpense(
                        userId,
                        expenseId,
                        currency,
                      );

                      // Sin la comprobación, context.go intentaría usar un context de un widget que ya no existe en el árbol, lo que causaría un error en runtime.
                      if (!context.mounted) return;

                      context.pop();
                    }
                  },
                  child: Text(
                    Strings.delete,
                    style: _textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
