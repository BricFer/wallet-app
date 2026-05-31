import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/themes/container_theme.dart';
import 'package:wallet_app/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final containerTheme = Theme.of(context).extension<AppContainerTheme>()!;

    return Scaffold(
      appBar: CustomAppBar(pageName: Strings.settingsEn),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.mdPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: AppDimens.mdSpacing,
          children: [
            SizedBox(height: AppDimens.mdSpacing),
            CircleAvatar(
              radius: AppDimens.xsSize,
              child: Image(
                image: AssetImage(Strings.imageProfileUrl),
                height: 75.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: AppDimens.mdSpacing,
              children: [
                CustomContainer(
                  width: 152.0,
                  height: 56.0,
                  alignment: Alignment.center,
                  child: Text(
                    "${Strings.incomesEn} €0.00", // TODO: Buscar cómo representar los ingresos más amigablemente
                    style: TextStyle(color: containerTheme.fontColorVariant),
                  ),
                ),
                CustomContainer(
                  width: 152.0,
                  height: 56.0,
                  alignment: Alignment.center,
                  child: Text(
                    "${Strings.expensesEn} €0.00", // TODO: buscar cómo representar los egresos más amigablemente
                    style: TextStyle(color: containerTheme.fontColorVariant),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimens.mdSpacing),
            CustomRow(
              text: Strings.personalInformationEn,
              icon: AppIcons.personalInformation,
              fontColor: containerTheme.fontColor,
            ),
            CustomRow(
              text: "${Strings.inboxEn}/${Strings.notificationsEn}",
              icon: AppIcons.notifications,
              fontColor: containerTheme.fontColor,
            ),
            CustomRow(
              text: Strings.privacyEn,
              icon: AppIcons.privacy,
              fontColor: containerTheme.fontColor,
            ),
            CustomRow(
              text: Strings.languageEn,
              faIcon: AppIcons.language,
              fontColor: containerTheme.fontColor,
            ),
            CustomRow(
              text: Strings.logoutEn,
              icon: AppIcons.logout,
              fontColor: containerTheme.fontColor,
            ),
          ],
        ),
      ),
    );
  }
}
