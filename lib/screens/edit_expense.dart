import 'package:flutter/material.dart';
import 'package:wallet_app/widgets/custom_appbar.dart';

class EditExpensedScreen extends StatelessWidget {
  const EditExpensedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(pageName: "Edit Expense"),
      body: Center(child: Text("Your are at the Edit Expense Page")),
    );
  }}