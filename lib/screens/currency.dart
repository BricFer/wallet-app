import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/strings.dart';
import 'package:wallet_app/widgets/layout/custom_appbar.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.currency),
      body: Column(children: [
        
      ],),
    );
  }}