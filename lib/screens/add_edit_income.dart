import 'package:flutter/material.dart';
import 'package:wallet_app/widgets/layout/custom_appbar.dart';

class AddEditIncomeScreen extends StatelessWidget {
  const AddEditIncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Edit Income'),
      body: Center(child: Text('Your are at the Add/Edit Income Page')),
    );
  }}