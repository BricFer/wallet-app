import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/widgets/layout/custom_appbar.dart';
import 'package:wallet_app/widgets/transactions/transaction_boxes.dart';
import 'package:wallet_app/widgets/transactions/transaction_card.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.transactionEn),
      body: Padding(
        padding: AppPaddings.paddingAll16,
        child: ListView(
          padding: AppPaddings.paddingBottom106,
          children: [
            TransactionBoxes(),
            SizedBox(height: AppDimens.elevation16),
            Text(
              Strings.transactionsListEn,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            for (int i = 1; i <= 10; i++)
              Row(
                children: [
                  SizedBox(height: AppDimens.spacing16),
                  TransactionCard(
                    amount: i.toDouble(),
                    i: i,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
