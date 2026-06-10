import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/constants/paddings.dart';
import 'package:wallet_app/core/constants/strings.dart';
import 'package:wallet_app/core/providers/auth_provider.dart';
import 'package:wallet_app/widgets/forms/form_button.dart';
import 'package:wallet_app/widgets/forms/form_input.dart';
import 'package:wallet_app/widgets/layout/custom_header.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, this.initialValue});

  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    final _passwordController = TextEditingController();

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
                    initialValue: initialValue,
                    labelText: 'Email address',
                    enabled: false,
                  ),
                  SizedBox(height: AppDimens.height24),
                  CustomFormInput(
                    controller: _passwordController,
                    labelText: 'Password',
                    obscureText: true,
                  ),
                  SizedBox(height: AppDimens.height48),
                  SizedBox(
                    width: double.infinity,
                    height: AppDimens.height64,
                    child: CustomFormButton(
                      label: Strings.updateEn,
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
