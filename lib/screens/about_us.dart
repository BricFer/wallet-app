import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wallet_app/core/theme/colors.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/constants/icons.dart';
import 'package:wallet_app/core/constants/strings.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(AppIcons.menu),
        title: Text(Strings.appNameEn),
        actions: [
          CircleAvatar(child: Image.network('assets/img/default_pic.png')),
        ],
      ),
      body: Card(
        elevation: AppDimens.elevationLarge,
        shadowColor: AppColors.shadowColor,
        child: Container(
          padding: EdgeInsets.all(AppDimens.paddingStandard),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
            children: [
              Row(
                children: [
                  Icon(AppIcons.portfolio, color: Colors.deepPurpleAccent),
                  SizedBox(width: 8),
                  Text(
                    'Portfolio',
                    style: TextStyle(fontSize: AppDimens.fontSizeStandard),
                  ),
                ],
              ),
              Row(
                children: [
                  FaIcon(AppIcons.github, color: Colors.blueGrey),
                  SizedBox(width: 8),
                  Text(
                    'GitHub',
                    style: TextStyle(fontSize: AppDimens.fontSizeStandard),
                  ),
                ],
              ),
              Row(
                children: [
                  FaIcon(AppIcons.linkedin, color: Colors.blueAccent),
                  SizedBox(width: 8),
                  Text(
                    'Linkedin',
                    style: TextStyle(fontSize: AppDimens.fontSizeStandard),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
