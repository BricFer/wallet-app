import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/strings.dart';
import 'package:wallet_app/core/providers/auth_provider.dart';
import 'package:wallet_app/core/providers/expense_provider.dart';
import 'package:wallet_app/widgets/layout/custom_appbar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // addPostFrameCallback espera a que termine el primer build antes de ejecutar el código
      final userId = context.read<AuthProvider>().userId!;
      context.read<ExpenseProvider>().loadExpenses(userId, 'EUR');
    });
  }

  @override
  Widget build(BuildContext context) {
    final fullname = context.watch<AuthProvider>().fullname;
    final expenseProvider = context.watch<ExpenseProvider>();

    if (expenseProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: CustomAppBar(title: Strings.home, isDashboard: true),
      body: Center(
        child: Text(
          'Hola, $fullname\nTotal de gastos: ${expenseProvider.total}',
        ),
      ),
    );
  }
}
