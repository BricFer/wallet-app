import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:wallet_app/core/constants/country.dart';
import 'package:wallet_app/core/constants/default_currency.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/constants/paddings.dart';
import 'package:wallet_app/core/constants/strings.dart';
import 'package:wallet_app/models/user/user_request.dart';
import 'package:wallet_app/service/user_service.dart';
import 'package:wallet_app/widgets/forms/dropdown_register.dart';
import 'package:wallet_app/widgets/forms/form_button.dart';
import 'package:wallet_app/widgets/forms/form_input.dart';
import 'package:wallet_app/widgets/layout/custom_header.dart';
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
  final _countryController = TextEditingController();
  final _defaultCurrencyController = TextEditingController();
  DateTime? _selectedDateOfBirth;

  @override
  void dispose() {
    _usernameController.dispose();
    _fullnameController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _countryController.dispose();
    _defaultCurrencyController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserService _userService = UserService();

    Future<void> _selectDateOfBirth() async {
      final picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
      );

      if (picked != null) {
        setState(() => _selectedDateOfBirth = picked);
      }
    }

    Future<void> _submit() async {
      debugPrint("SUBMIT");
      
      if (_selectedDateOfBirth == null) return;

      final authProvider = context.read<AuthProvider>();
      final email = authProvider.firebaseUser?.email ?? '';

      final dto = UserRequest(
        username: _usernameController.text,
        fullname: _fullnameController.text,
        phoneNumber: _phoneNumberController.text,
        dateOfBirth: _selectedDateOfBirth!,
        address: _addressController.text,
        email: email,
        country: _countryController.text,
        defaultCurrency: _defaultCurrencyController.text,
      );

      try {
        await _userService.saveUser(dto);

        if (!mounted) return;
        await authProvider.checkBackendProfile();

        if (!mounted) return;

        context.go('/dashboard');
      } catch (e, stacktrace) {
        debugPrint(e.toString());
        debugPrintStack(stackTrace: stacktrace);
      }
    }

    return Scaffold(
      body: Form(
        child: ListView(
          padding: AppPaddings.paddingBottom106,
          children: [
            CustomHeader(title: 'Create\nprofile,'),
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
                          : _selectedDateOfBirth!.toIso8601String(),
                    ),
                  ),
                  SizedBox(height: AppDimens.height24),
                  Row(
                    spacing: AppDimens.spacing8,
                    children: [
                      Text(Strings.country),
                      DropdownRegister(
                        controller: _countryController,
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
                        controller: _defaultCurrencyController,
                        dropdownMenuEntries: DefaultCurrency.currencies.entries
                            .map((entry) {
                              return DropdownMenuEntry(
                                value: entry.value,
                                label: entry.key,
                                style: ButtonStyle(),
                              );
                            })
                            .toList(),
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
