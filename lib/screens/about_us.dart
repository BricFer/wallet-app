import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/barrel_file.dart';
import 'package:wallet_app/core/theme/colors.dart';
import 'package:wallet_app/screens/about_us_info.dart';
import 'package:wallet_app/widgets/custom_drawer.dart';
import 'package:wallet_app/widgets/custom_row.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: ya que todas las pantallas usan un AppBar, buscar como simplificar esto.
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        foregroundColor: Theme.of(context).colorScheme.surface,
        toolbarHeight: 85,
        title: Text(Strings.appNameEn),
        centerTitle: true,
        actions: [
          // TODO: Resolver el problema de la imagen desbordada
          Padding(
            padding: const EdgeInsets.all(AppDimens.smPadding),
            child: CircleAvatar(
              maxRadius: 35.0,
              child: Image.network(Strings.imageProfileUrl),
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: AppDimens.lgSpacing),
          Container(
            padding: EdgeInsets.all(AppDimens.smPadding),
            margin: EdgeInsets.all(AppDimens.smSpacing),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(AppDimens.mdRadius),
              ),
              border: Border(
                top: BorderSide(color: AppColors.surfaceVariantLight),
                bottom: BorderSide(color: AppColors.surfaceVariantLight),
                left: BorderSide(color: AppColors.surfaceVariantLight),
                right: BorderSide(color: AppColors.surfaceVariantLight),
              ),
            ),
            child: GestureDetector(
              child: CustomRow(text: Strings.aboutUsEn),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => const AboutUsInfoPage(),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: AppDimens.smSpacing),
          Container(
            padding: EdgeInsets.all(AppDimens.smSpacing),
            margin: EdgeInsets.all(AppDimens.smSpacing),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(AppDimens.mdRadius),
              ),
              border: Border(
                top: BorderSide(color: AppColors.surfaceVariantLight),
                bottom: BorderSide(color: AppColors.surfaceVariantLight),
                left: BorderSide(color: AppColors.surfaceVariantLight),
                right: BorderSide(color: AppColors.surfaceVariantLight),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 16,
              children: [
                CustomRow(text: Strings.portfolioEn, icon: AppIcons.portfolio),
                CustomRow(text: Strings.github, faIcon: AppIcons.github),
                CustomRow(text: Strings.linkedin, faIcon: AppIcons.linkedin),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
