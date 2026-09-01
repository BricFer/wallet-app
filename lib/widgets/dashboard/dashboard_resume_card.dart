import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/widgets/layout/custom_container.dart';

class DashboardResumeCard extends StatelessWidget {
  const DashboardResumeCard({
    super.key,
    required this.total,
    required this.defaultCurrency,
  });

  final double total;
  final String defaultCurrency;

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,##0.00');

    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Balance Total'),
          Center(
            child: Text(
              '${numberFormat.format(total)}${DefaultCurrency.byCode(defaultCurrency)?.symbol}',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
