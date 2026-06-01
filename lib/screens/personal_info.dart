import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/screens/account_access.dart';
import 'package:wallet_app/screens/profile.dart';
import 'package:wallet_app/widgets/layout/custom_column.dart';
import 'package:wallet_app/widgets/widgets.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.smPadding),
        child: CustomColumn(
          spacing: AppDimens.lgSpacing,
          children: [
            CustomContainer(
              child: CustomColumn(
                children: [
                  GestureDetector(
                    child: CustomRow(text: Strings.yourInfoEn),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (_) => const ProfileScreen(),
                        ),
                      );
                    },
                  ),
                  GestureDetector(
                    child: CustomRow(text: Strings.accessMethodsEn),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AccountAccessScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            CustomContainer(
              height: AppDimens.minHeight,
              child: CustomRow(text: "Account name"),
            ),
          ],
        ),
      ),
    );
  }
}
