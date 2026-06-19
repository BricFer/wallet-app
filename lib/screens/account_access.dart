import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/widgets/widgets.dart';

// TODO: Condicionar a que aunque sea un método de autenticación esté activo
class AccountAccessScreen extends StatelessWidget {
  const AccountAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Account Access'),
      body: Padding(
        padding: AppPaddings.paddingAll16,
        child: CustomColumn(
          children: [
            CustomContainer(
              child: Column(
                children: [
                  SwitchRow(label: Strings.password, isActive: true,),
                  SwitchRow(label: Strings.pattern),
                  SwitchRow(label: Strings.emailCode),
                  SwitchRow(label: Strings.phoneCode),
                  SwitchRow(label: Strings.mfa),
                ],
              ),
            ),
            CustomContainer(child: CustomRow(text: Strings.changePassword)),
          ],
        ),
      ),
    );
  }
}
