import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/strings.dart';
import 'package:wallet_app/core/providers/navigation_provider.dart';
import 'package:wallet_app/core/theme/theme_provider.dart';
import 'package:wallet_app/screens/screens.dart';
import 'package:wallet_app/widgets/bottom_navigation.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ThemeProvider>();
    final nav = context.watch<NavigationProvider>();
    final List<Widget> _pages = const <Widget>[
      DashboardScreen(),
      CurrencyScreen(),
      ExpensesScreen(),
      SettingsScreen(),
      AboutUsScreen(),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: provider.themeData,
      home: SafeArea(
        child: Scaffold(
          // appBar: CustomAppBar(pageName: Strings.appName),
          // drawer: CustomDrawer(), //TODO: Corroborar que se puede eliminar el drawer
          bottomNavigationBar: CustomBottomNavigationBar(),
          body: _pages[nav.currentIndex],
        ),
      ),
    );
  }
}
