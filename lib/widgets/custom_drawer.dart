import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/barrel_file.dart';
import 'package:wallet_app/screens/dashboard.dart';
import 'package:wallet_app/screens/expenses.dart';
import 'package:wallet_app/screens/settings.dart';
import 'package:wallet_app/widgets/list_tile_drawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.menuEn,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(AppIcons.back),
                  color: Theme.of(context).colorScheme.surface,
                ),
              ],
            ),
          ),

          GestureDetector(
            child: ListTileDrawer(icon: AppIcons.home, text: Strings.homeEn),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashboardPage()),
              );
            },
          ),
          GestureDetector(
            child: ListTileDrawer(
              icon: AppIcons.otherExpenses,
              text: Strings.expensesEn,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExpensesPage()),
              );
            },
          ),
          GestureDetector(
            child: ListTileDrawer(
              // TODO: Comprobar como puedo usar uno de FontAwesome
              icon: AppIcons.currency,
              text: Strings.expensesEn,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExpensesPage()),
              );
            },
          ),
          GestureDetector(
            child: ListTileDrawer(
              icon: AppIcons.settings,
              text: Strings.settingsEn,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
