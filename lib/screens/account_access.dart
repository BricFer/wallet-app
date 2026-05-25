import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/icons.dart';
import 'package:wallet_app/widgets/custom_app_bar.dart';

class AccountAccessPage extends StatelessWidget {
  const AccountAccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(pageName: "Account Access", icon: AppIcons.home),
      body: Text("Your are at the Account Access Page"),
    );
  }
}
