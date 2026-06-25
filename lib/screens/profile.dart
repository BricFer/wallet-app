import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/providers/provider.dart';
import 'package:wallet_app/models/user/user_response.dart';
import 'package:wallet_app/widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = true;
  late UserResponse? user;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserProvider>().loadUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();
    final user = provider.user;

    if (provider.isLoading || user == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: CustomAppBar(title: Strings.profile),
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
                    label: Strings.username,
                    subtext: '\n${user.username ?? 'No nickname'}',
                    onSave: (value) async {
                      final userId = context.read<AuthProvider>().userId!;
                      await context.read<UserProvider>().updateUsername(
                        userId,
                        value,
                      );
                    },
                  ),
                  CustomProfileRow(
                    label: Strings.fullname,
                    subtext: '\n${user.fullname}',
                    onSave: (value) async {
                      final userId = context.read<AuthProvider>().userId!;
                      await context.read<UserProvider>().updateFullname(
                        userId,
                        value,
                      );
                    },
                  ),
                  CustomProfileRow(
                    label: Strings.address,
                    subtext: '\n${user.address}',
                    onSave: (value) async {
                      final userId = context.read<AuthProvider>().userId!;
                      await context.read<UserProvider>().updateAddress(
                        userId,
                        value,
                      );
                    },
                  ),
                  CustomProfileRow(
                    label: Strings.phoneNumber,
                    subtext: '\n${user.phoneNumber}',
                    onSave: (value) async {
                      final userId = context.read<AuthProvider>().userId!;
                      await context.read<UserProvider>().updatePhoneNumber(
                        userId,
                        value,
                      );
                    },
                  ),
                  CustomProfileRow(
                    label: Strings.email,
                    subtext: '\n${user.email}',
                    onSave: (value) async {
                      final userId = context.read<AuthProvider>().userId!;
                      //TODO: Implementar el updateEmail en el AuthProvider
                      await context.read<AuthProvider>().updateEmail(value);
                      //TODO: Implementar el updateEmail en el UserProvider
                      if (!context.mounted) return;
                      // await context.read<UserProvider>().updateEmail(userId, value);
                    },
                  ),
                  CustomProfileRow(
                    label: Strings.country,
                    subtext: '\n${user.country}',
                    onSave: (value) async {
                      final userId = context.read<AuthProvider>().userId!;
                      await context.read<UserProvider>().updateCountry(
                        userId,
                        value,
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: user.dateOfBirth,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );

                      if (picked != null && mounted) {
                        if (!context.mounted) return;

                        final userId = context.read<AuthProvider>().userId!;

                        await context.read<UserProvider>().updateDateOfBirth(
                          userId,
                          picked.toIso8601String(),
                        );
                      }
                    },
                    child: CustomProfileRow(
                      label: Strings.birth,
                      subtext:
                          '\n${DateFormat('dd/MM/yyy').format(user.dateOfBirth)}',
                      onSave: (value) async {},
                    ),
                  ),
                  CustomProfileRow(
                    label: Strings.defaultCurrency,
                    subtext: '\n${user.defaultCurrency}',
                    onSave: (value) async {
                      final userId = context.read<AuthProvider>().userId!;
                      await context.read<UserProvider>().updateCurrency(
                        userId,
                        value,
                      );
                    },
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
