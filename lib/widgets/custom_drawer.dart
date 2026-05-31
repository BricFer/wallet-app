import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/screens/about_us.dart';
import 'package:wallet_app/screens/dashboard.dart';
import 'package:wallet_app/screens/expenses.dart';
import 'package:wallet_app/screens/profile.dart';
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
          // TODO: Agregar imagen de perfil en el drawer en caso de que se mantega el drawer
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

          // TODO: Eliminar este elemento, ya que la imagen debe conducir al profile
          GestureDetector(
            child: ListTileDrawer(
              icon: AppIcons.profile,
              text: Strings.profileEn,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),

          GestureDetector(
            child: ListTileDrawer(icon: AppIcons.home, text: Strings.homeEn),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashboardScreen()),
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
                MaterialPageRoute(builder: (context) => ExpensesScreen()),
              );
            },
          ),
          GestureDetector(
            child: ListTileDrawer(
              icon: AppIcons.currency,
              text: Strings.currencyEn,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExpensesScreen()),
              );
            },
          ),
          GestureDetector(
            child: ListTileDrawer(
              icon: AppIcons.aboutUs,
              text: Strings.aboutUsEn,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsScreen()),
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
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
