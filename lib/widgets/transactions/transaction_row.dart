import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/themes/container_theme.dart';

class TransactionRow extends StatelessWidget {
  const TransactionRow({super.key, required this.amount, required this.i});

  final double amount;
  final int i;

  @override
  Widget build(BuildContext context) {
    final containerTheme = Theme.of(context).extension<AppContainerTheme>()!;

    return Expanded(
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.smPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Comercio $i",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 20.0,
                        color: containerTheme.fontColorVariant,
                      ),
                    ),
                    TextSpan(
                      text: "\nConcepto $i",
                      style: TextStyle(color: containerTheme.fontColorVariant),
                    ),
                    TextSpan(
                      text: "\nFecha $i",
                      style: TextStyle(color: containerTheme.fontColorVariant),
                    ),
                  ],
                ),
              ),
              Text(
                "€$amount.00",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: containerTheme.fontColorVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
