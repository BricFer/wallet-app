import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/providers/auth_provider.dart';
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

  late ExpenseDetailResponse expense;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadExpense();
  }

  Future<void> _loadExpense() async {
    final userId = context.read<AuthProvider>().userId;
    expense = await _service.getExpenseInfo(userId, widget.expenseId);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.expenses),
      body: Padding(
        padding: AppPaddings.paddingAll16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: AppDimens.spacing24,
          children: [
            SizedBox(height: AppDimens.spacing16),
            CustomContainer(
              child: Column(
                spacing: AppDimens.spacing16,
                children: [
                  Row(
                    spacing: AppDimens.spacing8,
                    children: [Text('Group'), Text('${expense.groupId}')],
                  ),
                  Row(
                    spacing: AppDimens.spacing8,
                    children: [
                      Text('Category'),
                      Text('${expense.categoryName}'),
                    ],
                  ),
                  Row(
                    spacing: AppDimens.spacing8,
                    children: [Text('Commerce'), Text(expense.commerce)],
                  ),
                  Row(
                    spacing: AppDimens.spacing8,
                    children: [Text('Concept'), Text('${expense.concept}')],
                  ),
                  Row(
                    spacing: AppDimens.spacing8,
                    children: [
                      Text('Amount'),
                      Text('${expense.amount}${expense.currency}'),
                    ],
                  ),
                  Row(
                    spacing: AppDimens.spacing8,
                    children: [
                      Text('Payment Method'),
                      Text('${expense.paymentMethodAlias}'),
                    ],
                  ),
                  Row(
                    spacing: AppDimens.spacing8,
                    children: [Text('Note'), Text('${expense.note}')],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
