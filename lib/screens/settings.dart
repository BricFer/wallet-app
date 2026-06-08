import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/providers/auth_provider.dart';
import 'package:wallet_app/core/themes/container_theme.dart';
import 'package:wallet_app/screens/personal_info.dart';
import 'package:wallet_app/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final containerTheme = Theme.of(context).extension<AppContainerTheme>()!;

    return Scaffold(
      appBar: CustomAppBar(title: Strings.settingsEn),
      body: SingleChildScrollView(
        padding: AppPaddings.paddingLTR16B106,
        child: CustomColumn(
          children: [
            SizedBox(height: AppDimens.spacing16),
            CircleAvatar(
              radius: AppDimens.size56,
              child: Image(
                image: AssetImage(Strings.imageProfileUrl),
                height: AppDimens.height75,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: AppDimens.spacing16,
              children: [
                CustomContainer(
                  width: AppDimens.width152,
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '€15.00\n',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: containerTheme.fontColorVariant,
                              ),
                        ),
                        TextSpan(
                          text: Strings.incomesEn,
                          style: TextStyle(
                            color: containerTheme.fontColorVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomContainer(
                  width: AppDimens.width152,
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '€35.00\n',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: containerTheme.fontColorVariant,
                              ),
                        ),
                        TextSpan(
                          text: Strings.expensesEn,
                          style: TextStyle(
                            color: containerTheme.fontColorVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimens.spacing16),
            GestureDetector(
              child: CustomRow(
                text: Strings.personalInformationEn,
                icon: AppIcons.personalInformationIcon,
                fontColor: containerTheme.fontColor,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => const PersonalInfoScreen(),
                  ),
                );
              },
            ),
            CustomRow(
              text: '${Strings.inboxEn}/${Strings.notificationsEn}',
              icon: AppIcons.notificationsIcon,
              fontColor: containerTheme.fontColor,
            ),
            CustomRow(
              text: Strings.privacyEn,
              icon: AppIcons.privacyIcon,
              fontColor: containerTheme.fontColor,
            ),
            CustomRow(
              text: Strings.languageEn,
              faIcon: AppIcons.languageFaIcon,
              fontColor: containerTheme.fontColor,
            ),
            GestureDetector(
              onTap: () async {
                context.read<AuthProvider>().logout();
              },
              child: CustomRow(
                text: Strings.logoutEn,
                icon: AppIcons.logoutIcon,
                fontColor: containerTheme.fontColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
