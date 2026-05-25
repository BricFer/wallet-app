import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/barrel_file.dart';
import 'package:wallet_app/widgets/custom_app_bar.dart';

// TODO: cambiar Dashboard a StatefullWidget
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(pageName: Strings.homeEn, icon: AppIcons.home),
      body: Text("Este es el Dashboard Page"),
    );
  }
}
