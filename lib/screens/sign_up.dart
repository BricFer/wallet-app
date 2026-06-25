import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/strings.dart';
import 'package:wallet_app/core/providers/auth_provider.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/constants/paddings.dart';
import 'package:wallet_app/core/themes/colors.dart';
import 'package:wallet_app/widgets/forms/form_button.dart';
import 'package:wallet_app/widgets/forms/form_input.dart';
import 'package:wallet_app/widgets/layout/custom_header.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: ListView(
          padding: AppPaddings.paddingBottom106,
          children: <Widget>[
            CustomHeader(title: 'Create an\naccount,'),
            Padding(
              padding: AppPaddings.paddingAll16,
              child: Column(
                children: <Widget>[
                  SizedBox(height: AppDimens.height24),
                  CustomFormInput(
                    labelText: Strings.email,
                    controller: _emailController,
                  ),
                  SizedBox(height: AppDimens.height24),
                  SensitiveContent(
                    sensitivity: ContentSensitivity.sensitive,
                    child: CustomFormInput(
                      labelText: Strings.password,
                      controller: _passwordController,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: AppDimens.height48),
                  SizedBox(
                    width: double.infinity,
                    height: AppDimens.height64,
                    child: CustomFormButton(
                      label: Strings.register,
                      onPressed: () async {
                        String user = _emailController.text;
                        String pwd = _passwordController.text;

                        await context.read<AuthProvider>().signUp(user, pwd);

                        if (!context.mounted) return;

                        String? error = context
                            .read<AuthProvider>()
                            .errorMessage;

                        if (error != null) {
                          Fluttertoast.showToast(
                            msg: error,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.SNACKBAR,
                            backgroundColor: AppColors.errorColor,
                            textColor: AppColors.errorFontColor,
                            webPosition: "center",
                          );
                        }
                      },
                    ),
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
