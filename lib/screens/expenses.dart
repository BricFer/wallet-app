import 'package:flutter/material.dart';
import 'package:wallet_app/widgets/layout/custom_appbar.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(pageName: "Expenses"),
      body: Center(child: Text("Your are at the Expenses Page")),
    );
  }
}