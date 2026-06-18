import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/models/user/user_response.dart';
import 'package:wallet_app/service/user_service.dart';
import 'package:wallet_app/widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserService _service = UserService();

  late UserResponse? user;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    user = await _service.getUserInfo();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CircularProgressIndicator();
    }

    return Scaffold(
      appBar: CustomAppBar(title: Strings.profileEn),
      body: Padding(
        padding: AppPaddings.paddingAll16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: AppDimens.spacing24,
          children: [
            SizedBox(height: AppDimens.spacing16),
            CustomContainer(
              child: Column(
                spacing: AppDimens.spacing16,
                children: [
                  CustomProfileRow(
                    label: Strings.usernameEn,
                    subtext: '\n${user?.username}',
                    onSave: (value) async {
                      // TODO: Implementar al tener la base de datos
                      
                    },
                  ),
                  CustomProfileRow(
                    label: Strings.fullnameEn,
                    subtext: '\n${user?.fullname}',
                    onSave: (value) async {
                      // TODO: Implementar al tener la base de datos
                      
                    },
                  ),
                  CustomProfileRow(
                    label: Strings.addressEn,
                    subtext: '\n${user?.address}',
                    onSave: (value) async {},
                  ),
                  CustomProfileRow(
                    label: Strings.phoneNumberEn,
                    subtext: '\n${user?.phoneNumber}',
                    onSave: (value) async {},
                  ),
                  CustomProfileRow(
                    label: Strings.emailEn,
                    subtext: '\n${user?.email}',
                    onSave: (value) async {},
                  ),
                  CustomProfileRow(
                    label: Strings.countryEn,
                    subtext: '\n${user?.country}',
                    onSave: (value) async {},
                  ),
                  CustomProfileRow(
                    label: Strings.birthEn,
                    subtext: '\n${user?.dateOfBirth}',
                    onSave: (value) async {},
                  ),
                  CustomProfileRow(
                    label: Strings.defaultCurrencyEn,
                    subtext: '\n${user?.defaultCurrency}',
                    onSave: (value) async {},
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
