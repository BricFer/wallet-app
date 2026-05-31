import 'package:flutter/material.dart';
import 'package:wallet_app/widgets/custom_appbar.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(pageName: "Add Expense"),
      body: Center(child: Text("Your are at the Add Expense Page")),
    );
  }
}