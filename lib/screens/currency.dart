import 'package:flutter/material.dart';
import 'package:wallet_app/widgets/layout/custom_appbar.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(pageName: "Currencies"),
      body: Center(child: Text("Your are at the Currencies Page")),
    );
  }}