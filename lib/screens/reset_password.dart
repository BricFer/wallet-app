import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/providers/auth_provider.dart';
import 'package:wallet_app/widgets/widgets.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
            CustomHeader(title: 'Reset\nPassword,'),

            Padding(
              padding: AppPaddings.paddingAll16,
              child: Column(
                children: [
                  CustomFormInput(
                    controller: _emailController,
                    labelText: 'Email address',
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
                  SizedBox(
                    width: double.infinity,
                    height: AppDimens.height64,
                    child: CustomFormButton(
                      label: Strings.update,
                      onPressed: () async {
                        String pwd = _passwordController.text;

                        context.read<AuthProvider>().updateUserPassword(pwd);

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
