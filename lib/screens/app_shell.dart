import 'package:flutter/material.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/providers/navigation_provider.dart';
import 'package:wallet_app/screens/screens.dart';
import 'package:wallet_app/widgets/navigation/glass_nav_content.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<NavigationProvider>();

    final List<Widget> _pages = const <Widget>[
      DashboardScreen(),
      CurrencyScreen(),
      TransactionsScreen(),
      SettingsScreen(),
      AboutUsScreen(),
    ];

    return SafeArea(
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
              width: MediaQuery.of(context).size.width - AppDimens.spacing8,
              height: AppDimens.height80,
              magnification: 1,
              distortion: 0.075,
              distortionWidth: AppDimens.radius50,
              position: LiquidGlassAlignPosition(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(bottom: AppDimens.spacing16),
              ),
              shape: const RoundedRectangleShape(
                lightDirection: 140,
                lightIntensity: 1.0,
                borderWidth: AppDimens.width2,
                borderType: OpticalBorder(
                  borderSaturation: 1,
                  ambientIntensity: 0,
                  borderSolidity: 0.3,
                ),
                cornerRadius: AppDimens.radius50,
              ),
              child: const GlassNavContent(),
            ),
          ],
        ),
      ),
    );
  }
}
