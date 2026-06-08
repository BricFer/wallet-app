import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/icons.dart';
import 'package:wallet_app/core/constants/paddings.dart';
import 'package:wallet_app/core/themes/app_decoration.dart';
import 'package:wallet_app/widgets/layout/custom_clipper.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: ClipPath(
        clipper: CustomClipperPath(),
        child: Container(
          padding: AppPaddings.paddingAll16,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          alignment: Alignment.centerLeft,
          decoration: AppDecoration.container(
            context,
            borderRadius: BorderRadius.zero,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(AppIcons.backIcon),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      'Create an\naccount,',
                      style: _textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
