import 'package:flutter/material.dart';
import 'package:wallet_app/core/themes/container_theme.dart';

class TransactionDetailsRow extends StatelessWidget {
  const TransactionDetailsRow({
    super.key,
    required this.label,
    required this.subtext,
  });

  final String label;
  final String subtext;

  @override
  Widget build(BuildContext context) {
    final _containerTheme = Theme.of(context).extension<AppContainerTheme>()!;
    final _textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: label,
                style: _textTheme.bodyMedium?.copyWith(
                  color: _containerTheme.fontColorVariant,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: subtext,
                style: _textTheme.bodyMedium?.copyWith(
                  color: _containerTheme.fontColorVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
