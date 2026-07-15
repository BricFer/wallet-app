import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/providers/provider.dart';
import 'package:wallet_app/core/themes/colors.dart';
import 'package:wallet_app/widgets/widgets.dart';

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
      final _user = context.read<UserProvider>().user;
      final userId = _user?.userId;
      final defaultCurrency = _user?.defaultCurrency;

      if (userId == null) return;

      context.read<ExpenseProvider>().loadExpenses(userId, defaultCurrency!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final expenseProvider = context.watch<ExpenseProvider>();
    final expenses = expenseProvider.expenses;

    if (expenseProvider.isLoading) {
      return Scaffold(body: const Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: CustomAppBar(title: Strings.transaction),
      body: Padding(
        padding: AppPaddings.paddingAll16,
        child: ListView(
          padding: AppPaddings.paddingBottom106,
          children: [
            TransactionBoxes(expensesTotal: expenseProvider.total),
            SizedBox(height: AppDimens.height36),
            Text(
              Strings.transactionsList,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Divider(color: AppColors.shadowColor),
            SizedBox(height: AppDimens.height18),
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
