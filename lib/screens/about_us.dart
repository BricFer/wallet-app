import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/widgets/widgets.dart';
import 'package:wallet_app/screens/about_us_info.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(pageName: Strings.aboutUsEn),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.smPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: AppDimens.lgSpacing,
          children: [
            CustomContainer(
              height: 64.0,
              padding: EdgeInsets.all(AppDimens.smPadding),
              child: GestureDetector(
                child: CustomRow(
                  text: Strings.aboutUsEn,
                  icon: AppIcons.aboutUs,
                  haveIconColor: true,
                ),
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
            CustomContainer(
              padding: EdgeInsets.all(AppDimens.smPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: AppDimens.mdSpacing,
                children: [
                  GestureDetector(
                    child: CustomRow(
                      text: Strings.portfolioEn,
                      icon: AppIcons.portfolio,
                      haveIconColor: true,
                    ),
                    onTap: () => _launchURL(Strings.portfoliobUrl),
                  ),
                  GestureDetector(
                    child: CustomRow(
                      text: Strings.github,
                      faIcon: AppIcons.github,
                      haveIconColor: true,
                    ),
                    onTap: () => _launchURL(Strings.githubUrl),
                  ),
                  GestureDetector(
                    child: CustomRow(
                      text: Strings.linkedin,
                      faIcon: AppIcons.linkedin,
                      haveIconColor: true,
                    ),
                    onTap: () => _launchURL(Strings.linkedinUrl),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri _url = Uri.parse(url);

    try {
      launchUrl(_url);
    } on Error catch (_, err) {
      throw 'Could not launch $_url, due to $err';
    }
  }
}
