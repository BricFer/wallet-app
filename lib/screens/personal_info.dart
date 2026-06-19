import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/screens/account_access.dart';
import 'package:wallet_app/screens/profile.dart';
import 'package:wallet_app/widgets/widgets.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: AppPaddings.paddingAll16,
        child: CustomColumn(
          spacing: AppDimens.spacing24,
          children: [
            CustomContainer(
              child: CustomColumn(
                children: [
                  GestureDetector(
                    child: CustomRow(text: Strings.yourInfo),
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
                    child: CustomRow(text: Strings.accessMethods),
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
              height: AppDimens.height64,
              child: CustomRow(text: 'Account name'),
            ),
          ],
        ),
      ),
    );
  }
}
