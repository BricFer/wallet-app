import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/icons.dart';
import 'package:wallet_app/widgets/custom_app_bar.dart';

class EditExpensePage extends StatelessWidget {
  const EditExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(pageName: "Edit Expense", icon: AppIcons.home),
      body: Text("Your are at the Edit Expense Page"),
    );
  }}