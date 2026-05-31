import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/widgets/profile_row.dart';
import 'package:wallet_app/widgets/widgets.dart';

// TODO: Como la información se pretende que se edite on the spot, hay que convertirlo a StatefulWidget
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(pageName: Strings.profileEn),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.smPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: AppDimens.lgSpacing,
          children: [
            SizedBox(height: AppDimens.mdSpacing),
            Text(
              "Personal",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.left,
            ),
            CustomContainer(
              padding: EdgeInsets.all(AppDimens.smPadding),
              child: Column(
                spacing: AppDimens.smSpacing,
                children: [
                  CustomProfileRow(text: Strings.fullnameEn),
                  CustomProfileRow(text: Strings.addressEn),
                  CustomProfileRow(text: Strings.phoneNumberEn),
                  CustomProfileRow(text: Strings.emailEn),
                  CustomProfileRow(text: Strings.countryEn),
                  CustomProfileRow(text: Strings.birthEn),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
