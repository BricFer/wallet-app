import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/providers/user_provider.dart';
import 'package:wallet_app/core/themes/colors.dart';
import 'package:wallet_app/models/user/user_request.dart';
import 'package:wallet_app/widgets/widgets.dart';
import 'package:wallet_app/core/providers/auth_provider.dart';

class SignUpDetailsScreen extends StatefulWidget {
  const SignUpDetailsScreen({super.key});

  @override
  State<SignUpDetailsScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpDetailsScreen> {
  final _usernameController = TextEditingController();
  final _fullnameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
  DateTime? _selectedDateOfBirth;

  String? _selectedCurrency;
  String? _selectedCountry;

  @override
  void dispose() {
    _usernameController.dispose();
    _fullnameController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();

    super.dispose();
  }

  Future<void> _selectDateOfBirth() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() => _selectedDateOfBirth = picked);
    }
  }

  Future<void> _submit() async {
    if (_selectedDateOfBirth == null) {
      return;
    }

    final authProvider = context.read<AuthProvider>();
    final userProvider = context.read<UserProvider>();
    final email = authProvider.firebaseUser?.email ?? '';

    final dto = UserRequest(
      username: _usernameController.text,
      fullname: _fullnameController.text,
      phoneNumber: _phoneNumberController.text,
      dateOfBirth: _selectedDateOfBirth!,
      address: _addressController.text,
      email: email,
      country: _selectedCountry ?? '',
      defaultCurrency: _selectedCurrency ?? 'EUR',
    );

    try {
      await userProvider.saveUser(dto);

      await authProvider.checkBackendProfile();

      if (!mounted) return;

      // TODO: El error tiene que venir del UserProvider
      String? error = context.read<AuthProvider>().errorMessage;

      if (error != null) {
        Fluttertoast.showToast(
          msg: error,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: AppColors.errorColor,
          textColor: AppColors.errorFontColor,
        );
      }
    } catch (e, stacktrace) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: stacktrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: ListView(
          padding: AppPaddings.paddingBottom106,
          children: [
            CustomHeader(title: 'Create\na profile,'),
            Padding(
              padding: AppPaddings.paddingAll16,
              child: Column(
                children: <Widget>[
                  CustomFormInput(
                    labelText: Strings.fullname,
                    controller: _fullnameController,
                  ),
                  SizedBox(height: AppDimens.height24),
                  CustomFormInput(
                    labelText: Strings.username,
                    controller: _usernameController,
                  ),
                  SizedBox(height: AppDimens.height24),
                  CustomFormInput(
                    labelText: Strings.phoneNumber,
                    hintText: '+(##) ### ### ###',
                    controller: _phoneNumberController,
                  ),
                  SizedBox(height: AppDimens.height24),
                  CustomFormInput(
                    labelText: Strings.address,
                    controller: _addressController,
                  ),
                  SizedBox(height: AppDimens.height24),
                  GestureDetector(
                    onTap: _selectDateOfBirth,
                    child: Text(
                      _selectedDateOfBirth == null
                          ? 'Select date of birth'
                          : DateFormat(
                              'dd/MM/yyyy',
                            ).format(_selectedDateOfBirth!),
                    ),
                  ),
                  SizedBox(height: AppDimens.height24),
                  Row(
                    spacing: AppDimens.spacing8,
                    children: [
                      Text(Strings.country),
                      DropdownRegister(
                        onSelected: (value) {
                          setState(() => _selectedCountry = value);
                        },
                        dropdownMenuEntries: Country.countries.entries.map((
                          entry,
                        ) {
                          return DropdownMenuEntry(
                            value: entry.value,
                            label: entry.key,
                            style: ButtonStyle(),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(height: AppDimens.height24),
                  Row(
                    spacing: AppDimens.spacing8,
                    children: [
                      Text(
                        Strings.defaultCurrency,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      DropdownRegister(
                        onSelected: (value) {
                          setState(() => _selectedCurrency = value);
                        },
                        dropdownMenuEntries: [
                          for (final currency in DefaultCurrency.currencies)
                            DropdownMenuEntry(
                              value: currency.code,
                              label: currency.name,
                              style: ButtonStyle(),
                            ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: AppDimens.height24),
                  SizedBox(
                    width: double.infinity,
                    height: AppDimens.height64,
                    child: CustomFormButton(
                      label: Strings.register,
                      onPressed: _submit,
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
