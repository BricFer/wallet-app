import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/icons.dart';
import 'package:wallet_app/widgets/custom_app_bar.dart';

class AddExpensePage extends StatelessWidget {
  const AddExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(pageName: "Add Expense", icon: AppIcons.home),
      body: Text("Your are at the Add Expense Page"),
    );
  }
}