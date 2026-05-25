import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/icons.dart';
import 'package:wallet_app/widgets/custom_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(pageName: "Settings", icon: AppIcons.home),
      body: Text("Your are at the Settings Page"),
    );
  }}