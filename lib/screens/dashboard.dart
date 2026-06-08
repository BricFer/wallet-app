import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/strings.dart';
import 'package:wallet_app/widgets/layout/custom_appbar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.homeEn, isDashboard: true),
      body: Center(child: Text("Este es el Dashboard Page")),
    );
  }
}
