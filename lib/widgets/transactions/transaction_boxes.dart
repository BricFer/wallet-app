import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/themes/container_theme.dart';

class TransactionBoxes extends StatefulWidget {
  const TransactionBoxes({super.key});

  @override
  State<TransactionBoxes> createState() => _TransactionBoxesState();
}

class _TransactionBoxesState extends State<TransactionBoxes> {
  bool _firstContainerActive = true;

  @override
  Widget build(BuildContext context) {
    final containerTheme = Theme.of(context).extension<AppContainerTheme>()!;

    final double size1 = _firstContainerActive
        ? AppDimens.mdBoxSize
        : AppDimens.smBoxSize;

    final double size2 = _firstContainerActive
        ? AppDimens.smBoxSize
        : AppDimens.mdBoxSize;

    final Color color1 = _firstContainerActive
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.tertiary;

    final Color color2 = _firstContainerActive
        ? Theme.of(context).colorScheme.tertiary
        : Theme.of(context).colorScheme.primary;

    final TextStyle textStyle1 = _firstContainerActive
        ? TextStyle(
            color: containerTheme.fontColorVariant,
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          )
        : TextStyle(color: containerTheme.fontColor);

    final TextStyle textStyle2 = _firstContainerActive
        ? TextStyle(color: containerTheme.fontColor)
        : TextStyle(
            color: containerTheme.fontColorVariant,
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20.0,
      children: [
        GestureDetector(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: size1,
            height: size1,
            decoration: BoxDecoration(
              color: color1,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(child: Text("€53.49+", style: textStyle1)),
          ),
          onTap: () {
            setState(() {
              _firstContainerActive = true;
            });
          },
        ),
        GestureDetector(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: size2,
            height: size2,
            decoration: BoxDecoration(
              color: color2,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(child: Text("€93.25-", style: textStyle2)),
          ),
          onTap: () {
            setState(() {
              _firstContainerActive = false;
            });
          },
        ),
      ],
    );
  }
}
