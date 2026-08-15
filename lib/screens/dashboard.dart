import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/providers/provider.dart';
import 'package:wallet_app/widgets/widgets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<UserProvider>().loadUser();

      if (!mounted) return;

      final _user = context.read<UserProvider>().user;

      if (_user == null) return;

      await context.read<ExpenseProvider>().loadExpenses(
        _user.userId,
        _user.defaultCurrency,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final expenseProvider = context.watch<ExpenseProvider>();
    final userProvider = context.watch<UserProvider>();

    if (userProvider.user == null || expenseProvider.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final expenses = expenseProvider.expenses;

    final int maxNumberOfExpenseShown = expenses.length > 5
        ? 5
        : expenses.length;
    final total = expenseProvider.total;

    final defaultCurrency = userProvider.user?.defaultCurrency;

    return Scaffold(
      appBar: CustomAppBar(title: Strings.home, isDashboard: true),
      body: Padding(
        padding: AppPaddings.paddingAll16,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: DashboardResumeCard(
                total: total,
                defaultCurrency: defaultCurrency ?? 'EUR',
              ),
            ),
            Text(
              '\nSpending performance: Grafico de barras por mes, visualización de un año',
            ),
            if (expenses.isNotEmpty)
              for (int i = 0; i < maxNumberOfExpenseShown; i++)
                Padding(
                  padding: AppPaddings.paddingBottom16,
                  child: TransactionCard(expense: expenses[i]),
                ),

            if (expenses.isEmpty)
              Padding(
                padding: AppPaddings.paddingAll16,
                child: Center(child: Text('No expenses found.')),
              ),
          ],
        ),
      ),
    );
  }
}
