import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/constants/strings.dart';
import 'package:wallet_app/widgets/layout/custom_appbar.dart';
import 'package:wallet_app/widgets/transactions/transaction_boxes.dart';
import 'package:wallet_app/widgets/transactions/transaction_row.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(pageName: Strings.transactionEn),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.smPadding),
        child: ListView(
          children: [
            TransactionBoxes(),
            Text(
              Strings.transactionsListEn,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            for (int i = 1; i <= 10; i++)
              Row(
                children: [
                  SizedBox(height: AppDimens.mdSpacing),
                  TransactionRow(amount: i as double, i: i),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
