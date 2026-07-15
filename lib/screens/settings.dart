import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/providers/provider.dart';
import 'package:wallet_app/core/themes/container_theme.dart';
import 'package:wallet_app/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final userId = context.read<AuthProvider>().userId!;
      final expenseProvider = context.read<ExpenseProvider>();

      await context.read<UserProvider>().loadUser();

      if (!mounted) return;

      final defaultCurrency = context
          .read<UserProvider>()
          .user
          ?.defaultCurrency;

      if (expenseProvider.expenses.isEmpty) {
        context.read<ExpenseProvider>().loadTotal(
          userId,
          defaultCurrency ?? 'EUR',
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _containerTheme = Theme.of(context).extension<AppContainerTheme>()!;
    final _colorScheme = Theme.of(context).colorScheme;
    final provider = context.watch<ExpenseProvider>();
    final numberFormat = NumberFormat('#,##0.00');

    final currencies = DefaultCurrency.currencies;

    final userProvider = context.watch<UserProvider>();
    final defaultCurrency = userProvider.user?.defaultCurrency;

    final currencySymbol = currencies
        .firstWhere((c) => c.code == defaultCurrency)
        .symbol;

    return Scaffold(
      appBar: CustomAppBar(title: Strings.settings),
      body: Padding(
        padding: AppPaddings.paddingLTR16B106,
        child: SingleChildScrollView(
          child: CustomColumn(
            children: [
              SizedBox(height: AppDimens.spacing16),
              CircleAvatar(
                radius: AppDimens.size56,
                child: Image(
                  image: AssetImage(Strings.imageProfileUrl),
                  height: AppDimens.height75,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: AppDimens.spacing16,
                children: [
                  CustomContainer(
                    width: AppDimens.width152,
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '15.00$currencySymbol\n',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: _containerTheme.fontColorVariant,
                                ),
                          ),
                          TextSpan(
                            text: Strings.incomes,
                            style: TextStyle(
                              color: _containerTheme.fontColorVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomContainer(
                    width: AppDimens.width152,
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                '${numberFormat.format(provider.total)}$currencySymbol\n',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: _containerTheme.fontColorVariant,
                                ),
                          ),
                          TextSpan(
                            text: Strings.expenses,
                            style: TextStyle(
                              color: _containerTheme.fontColorVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppDimens.spacing16),
              GestureDetector(
                child: CustomRow(
                  text: Strings.personalInformation,
                  icon: AppIcons.personalInformationIcon,
                  fontColor: _colorScheme.onSurface,
                ),
                onTap: () {
                  context.push('/profile');
                },
              ),
              CustomRow(
                text: '${Strings.inbox}/${Strings.notifications}',
                icon: AppIcons.notificationsIcon,
                fontColor: _colorScheme.onSurface,
              ),
              CustomRow(
                text: Strings.privacy,
                icon: AppIcons.privacyIcon,
                fontColor: _colorScheme.onSurface,
              ),
              CustomRow(
                text: Strings.language,
                faIcon: AppIcons.languageFaIcon,
                fontColor: _colorScheme.onSurface,
              ),
              ThemeWidget(),
              GestureDetector(
                onTap: () async {
                  await context.read<AuthProvider>().logout();
                },
                child: CustomRow(
                  text: Strings.logout,
                  icon: AppIcons.logoutIcon,
                  fontColor: _colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
