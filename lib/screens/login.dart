import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/constants/paddings.dart';
import 'package:wallet_app/core/themes/app_decoration.dart';
import 'package:wallet_app/core/providers/auth_provider.dart';
import 'package:wallet_app/core/themes/container_theme.dart';
import 'package:wallet_app/screens/reset_password.dart';
import 'package:wallet_app/screens/sign_up.dart';
import 'package:wallet_app/widgets/layout/custom_clipper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _containerTheme = Theme.of(context).extension<AppContainerTheme>()!;
    final _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Form(
        child: ListView(
          padding: AppPaddings.paddingBottom106,
          children: <Widget>[
            ClipPath(
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
                child: Text('Welcome\nBack,', style: _textTheme.headlineMedium),
              ),
            ),
            Padding(
              padding: AppPaddings.paddingAll16,
              child: Column(
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: AppDecoration.textInput(
                      context,
                      labelText: 'Email address',
                    ).copyWith(labelStyle: _textTheme.bodySmall),
                  ),
                  SizedBox(height: AppDimens.height24),
                  SensitiveContent(
                    sensitivity: ContentSensitivity.sensitive,
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: AppDecoration.textInput(
                        context,
                        labelText: 'Password',
                      ).copyWith(labelStyle: _textTheme.bodySmall),
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
                              builder: (_) => const ResetPasswordScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Forgot password?',
                          style: _textTheme.labelLarge?.copyWith(
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
                    child: ElevatedButton(
                      onPressed: () async {
                        String user = _usernameController.text;
                        String pwd = _passwordController.text;

                        context.read<AuthProvider>().signIn(user, pwd);

                        //   String? error = context
                        //       .read<AuthProvider>()
                        //       .errorMessage;

                        //   if (error != null) {
                        //     Fluttertoast.showToast(
                        //       msg: error,
                        //       toastLength: Toast.LENGTH_LONG,
                        //       gravity: ToastGravity.SNACKBAR,
                        //       backgroundColor: AppColors.errorColor,
                        //       textColor: AppColors.errorFontColor,
                        //     );
                        //   }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppDimens.radius12,
                          ),
                        ),
                      ),
                      child: Ink(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          gradient: _containerTheme.gradientColor,
                          borderRadius: BorderRadius.circular(
                            AppDimens.radius12,
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('Login', style: _textTheme.bodyLarge),
                        ),
                      ),
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
