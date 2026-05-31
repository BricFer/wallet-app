import 'package:flutter/material.dart';
import 'package:wallet_app/widgets/custom_appbar.dart';

class AccountAccessScreen extends StatelessWidget {
  const AccountAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(pageName: "Account Access"),
      body: Center(child: Text("Your are at the Account Access Page")),
    );
  }
}
