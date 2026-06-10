import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/constants/paddings.dart';
import 'package:wallet_app/core/providers/auth_provider.dart';
import 'package:wallet_app/core/themes/colors.dart';
import 'package:wallet_app/screens/reset_password.dart';
import 'package:wallet_app/screens/sign_up.dart';
import 'package:wallet_app/widgets/forms/form_button.dart';
import 'package:wallet_app/widgets/forms/form_input.dart';
import 'package:wallet_app/widgets/layout/custom_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    return Scaffold(
      body: Form(
        child: ListView(
          padding: AppPaddings.paddingBottom106,
          children: <Widget>[
            CustomHeader(title: 'Welcome\nback,', showReturnIcon: false),
            Padding(
              padding: AppPaddings.paddingAll16,
              child: Column(
                children: [
                  CustomFormInput(
                    labelText: 'Email address',
                    controller: _emailController,
                  ),
                  SizedBox(height: AppDimens.height24),
                  SensitiveContent(
                    sensitivity: ContentSensitivity.sensitive,
                    child: CustomFormInput(
                      controller: _passwordController,
                      labelText: 'Password',
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: AppDimens.height48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: AppDimens.spacing16,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              // Pasar _emailController.text
                              builder: (_) => const ResetPasswordScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Forgot password?',
                          style: _textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            decoration: TextDecoration.underline,
                            decorationColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (_) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Create an account',
                          style: _textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            decoration: TextDecoration.underline,
                            decorationColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppDimens.height18),
                  SizedBox(
                    width: double.infinity,
                    height: AppDimens.height64,
                    child: CustomFormButton(
                      label: 'Login',
                      onPressed: () async {
                        String user = _emailController.text;
                        String pwd = _passwordController.text;

                        context.read<AuthProvider>().signIn(user, pwd);

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
                          );
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(
                          //     content: Text(
                          //       error,
                          //       style: TextStyle(
                          //         color: AppColors.errorFontColor,
                          //       ),
                          //     ),
                          //     backgroundColor: AppColors.errorColor,
                          //     duration: Duration(seconds: 3),
                          //     elevation: AppDimens.elevation4,
                          //   ),
                          // );
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
