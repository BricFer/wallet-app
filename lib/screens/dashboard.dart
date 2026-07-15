import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/strings.dart';
import 'package:wallet_app/core/providers/provider.dart';
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
      context.read<UserProvider>().loadUser();

      final userId = context.read<AuthProvider>().userId!;
      context.read<ExpenseProvider>().loadExpenses(userId, 'EUR');
    });
  }

  @override
  Widget build(BuildContext context) {
    final _user = context.watch<UserProvider>().user;

    final fullname = _user?.fullname ?? '';
    final expenseProvider = context.watch<ExpenseProvider>();

    if (expenseProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: CustomAppBar(title: Strings.home, isDashboard: true),
      body: Center(
        child: Column(
          children: [
            Text('Cuadro: Balance'),
            Text(
              'Spending performance: Grafico de barras por mes, visualización de un año',
            ),
            Text('Lista con las ultimas 5-10 transacciones'),
            Text('Hola, $fullname\nTotal de gastos: ${expenseProvider.total}'),
          ],
        ),
      ),
    );
  }
}
