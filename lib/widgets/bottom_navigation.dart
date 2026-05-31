import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/providers/navigation_provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<NavigationProvider>();

    // TODO: Agregar el efecto glassmorphism
    return NavigationBar(
      onDestinationSelected: (index) =>
          context.read<NavigationProvider>().setIndex(index),
      indicatorColor: Theme.of(context).colorScheme.primary,
      selectedIndex: nav.currentIndex, // TOOD: averiguar para qué sirve esto
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(AppIcons.selectedHome),
          icon: Icon(AppIcons.home),
          label: Strings.homeEn,
        ),
        NavigationDestination(
          icon: Icon(AppIcons.otherExpenses),
          label: Strings.exchangeEn,
        ),
        NavigationDestination(
          icon: Icon(AppIcons.transfer),
          label: Strings.transactionEn,
        ),
        NavigationDestination(
          selectedIcon: Icon(AppIcons.selectedSettings),
          icon: Icon(AppIcons.settings),
          label: Strings.settingsEn,
        ),
        NavigationDestination(
          icon: Icon(
            AppIcons.aboutUs,
          ), // TODO: reemplazar el ícono por el logo de la "marca/app"
          label: Strings.aboutUsEn,
        ),
      ],
    );
  }
}
