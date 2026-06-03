import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/icons.dart';

enum TransactionTypeOpt { income, expense }

class TransactionType extends StatefulWidget {
  const TransactionType({super.key});

  @override
  State<TransactionType> createState() => _TransactionTypeState();
}

class _TransactionTypeState extends State<TransactionType> {
  TransactionTypeOpt? _transactionType = .expense;

  @override
  Widget build(BuildContext context) {
    return RadioGroup<TransactionTypeOpt>(
      // TODO: Evaluar cómo traer un valor de la base de datos y que llegue como TransactionTypeOpt
      groupValue: _transactionType,
      onChanged: (TransactionTypeOpt? value) {
        setState(() {
          _transactionType = value;
        });
      },
      child: Column(
        children: <Widget>[
          Row(
            children: [Icon(AppIcons.transferIcon), Text("Transaction type")],
          ),
          RadioListTile<TransactionTypeOpt>(
            value: TransactionTypeOpt.income,
            title: Text(
              "Income",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          RadioListTile<TransactionTypeOpt>(
            value: TransactionTypeOpt.expense,
            title: Text(
              "Expense",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
