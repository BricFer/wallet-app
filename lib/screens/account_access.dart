import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/widgets/widgets.dart';

// TODO: Condicionar a que aunque sea un método de autenticación esté activo
class AccountAccessScreen extends StatelessWidget {
  const AccountAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(pageName: "Account Access"),
      body: Padding(
        padding: AppPaddings.paddingAll16,
        child: CustomColumn(
          children: [
            CustomContainer(
              child: Column(
                children: [
                  SwitchRow(label: Strings.passwordEn),
                  SwitchRow(label: Strings.patternEn),
                  SwitchRow(label: Strings.emailCodeEn),
                  SwitchRow(label: Strings.phoneCodeEn),
                  SwitchRow(label: Strings.mfa),
                ],
              ),
            ),
            CustomContainer(child: CustomRow(text: Strings.changePasswordEn)),
          ],
        ),
      ),
    );
  }
}
