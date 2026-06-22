import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/providers/auth_provider.dart';
import 'package:wallet_app/core/providers/expense_provider.dart';
import 'package:wallet_app/widgets/layout/custom_appbar.dart';
import 'package:wallet_app/widgets/transactions/transaction_boxes.dart';
import 'package:wallet_app/widgets/transactions/transaction_card.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userId = context.read<AuthProvider>().userId!;
      context.read<ExpenseProvider>().loadExpenses(userId, 'EUR');
    });
  }

  @override
  Widget build(BuildContext context) {
    final expenseProvider = context.watch<ExpenseProvider>();
    final expenses = expenseProvider.expenses;

    if (expenseProvider.isLoading) {
      return const CircularProgressIndicator();
    }

    return Scaffold(
      appBar: CustomAppBar(title: Strings.transaction),
      body: Padding(
        padding: AppPaddings.paddingAll16,
        child: ListView(
          padding: AppPaddings.paddingBottom106,
          children: [
            TransactionBoxes(),
            SizedBox(height: AppDimens.elevation16),
            Text(
              Strings.transactionsList,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            if (expenses.isNotEmpty)
              for (final expense in expenses)
                Padding(
                  padding: AppPaddings.paddingBottom16,
                  child: TransactionCard(expense: expense),
                ),

            if (expenses.isEmpty)
              Padding(
                padding: AppPaddings.paddingAll16,
                child: Center(child: Text('No expenses found.')),
              ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: AppPaddings.paddingBottom106,
        child: FloatingActionButton(
          onPressed: () {
            context.push('/add-expense');
          },
          child: const FaIcon(FontAwesomeIcons.plus),
        ),
      ),
    );
  }
}
