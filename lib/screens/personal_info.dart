import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_app/core/constants/constants.dart';
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
                      context.push('/profile');
                    },
                  ),
                  GestureDetector(
                    child: CustomRow(text: Strings.accessMethods),
                    onTap: () {
                      context.push('/account-access');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
