import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/widgets/widgets.dart';
import 'package:wallet_app/screens/information.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.aboutUs),
      body: Padding(
        padding: AppPaddings.paddingAll16,
        child: CustomColumn(
          children: [
            CustomContainer(
              height: AppDimens.height64,
              child: GestureDetector(
                child: CustomRow(
                  text: Strings.aboutUs,
                  icon: AppIcons.aboutUsIcon,
                  haveIconColor: true,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => const InformationScreen(),
                    ),
                  );
                },
              ),
            ),
            CustomContainer(
              child: CustomColumn(
                children: [
                  GestureDetector(
                    child: CustomRow(
                      text: Strings.portfolio,
                      icon: AppIcons.portfolioFaIcon,
                      haveIconColor: true,
                    ),
                    onTap: () => _launchURL(Strings.portfoliobUrl),
                  ),
                  GestureDetector(
                    child: CustomRow(
                      text: Strings.github,
                      faIcon: AppIcons.githubFaIcon,
                      haveIconColor: true,
                    ),
                    onTap: () => _launchURL(Strings.githubUrl),
                  ),
                  GestureDetector(
                    child: CustomRow(
                      text: Strings.linkedin,
                      faIcon: AppIcons.linkedinFaIcon,
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
