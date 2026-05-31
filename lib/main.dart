import 'package:flutter/material.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/providers/navigation_provider.dart';
import 'package:wallet_app/core/themes/theme_provider.dart';
import 'package:wallet_app/screens/screens.dart';
import 'package:wallet_app/widgets/navigation/glass_nav_content.dart';

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
          extendBody: true,
          body: LiquidGlassView(
            backgroundWidget: _pages[nav.currentIndex],
            pixelRatio: 1,
            useSync: true,
            realTimeCapture: true,
            refreshRate: LiquidGlassRefreshRate.deviceRefreshRate,
            children: [
              LiquidGlass(
                width: MediaQuery.of(context).size.width - AppDimens.smSpacing,
                height: 80.0,
                magnification: 1,
                distortion: 0.075,
                distortionWidth: 50,
                position: LiquidGlassAlignPosition(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.only(bottom: AppDimens.mdSpacing),
                ),
                shape: const RoundedRectangleShape(
                  lightDirection: 140,
                  lightIntensity: 1.0,
                  borderWidth: 2,
                  borderType: OpticalBorder(
                    borderSaturation: 1,
                    ambientIntensity: 0,
                    borderSolidity: 0.3,
                  ),
                  cornerRadius: 50,
                ),
                // color: Color.fromARGB(15, 255, 255, 255),
                child: const GlassNavContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
