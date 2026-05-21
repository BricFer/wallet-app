import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/strings.dart';
import 'package:wallet_app/core/theme/theme_provider.dart';
import 'package:wallet_app/screens/about_us.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => ThemeProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appNameEn,
      theme: provider.themeData,
      home: const AboutUsPage(),
    );
  }
}
