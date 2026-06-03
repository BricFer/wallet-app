import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(pageName: Strings.profileEn),
      body: Padding(
        padding: AppPaddings.paddingAll16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: AppDimens.spacing24,
          children: [
            SizedBox(height: AppDimens.spacing16),
            CustomContainer(
              padding: AppPaddings.paddingAll16,
              child: Column(
                spacing: AppDimens.spacing16,
                children: [
                  CustomProfileRow(
                    label: Strings.fullnameEn,
                    subtext: "\nPepito Perez",
                    onSave: (value) async {
                      // TODO: Implementar al tener la base de datos
                      // TODO: Implementar el provider de usuario
                      // await conttext.read<ProfileProvider>().updateUsername(value);
                    },
                  ),
                  CustomProfileRow(
                    label: Strings.addressEn,
                    subtext: "\nAv. del aprendizaje 1",
                    onSave: (value) async {},
                  ),
                  CustomProfileRow(
                    label: Strings.phoneNumberEn,
                    subtext: "\n+34 123 456 789",
                    onSave: (value) async {},
                  ),
                  CustomProfileRow(
                    label: Strings.emailEn,
                    subtext: "\naprendizaje@example.com",
                    onSave: (value) async {},
                  ),
                  CustomProfileRow(
                    label: Strings.countryEn,
                    subtext: "\nSpain",
                    onSave: (value) async {},
                  ),
                  CustomProfileRow(
                    label: Strings.birthEn,
                    subtext: "\n01-01-1991",
                    onSave: (value) async {},
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
