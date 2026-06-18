import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/strings.dart';
import 'package:wallet_app/core/providers/auth_provider.dart';
import 'package:wallet_app/core/providers/expense_provider.dart';
import 'package:wallet_app/core/providers/navigation_provider.dart';
import 'package:wallet_app/core/providers/theme_provider.dart';
import 'package:wallet_app/core/routes/router.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final authProvider = AuthProvider();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => ExpenseProvider()),
        ChangeNotifierProvider.value(value: authProvider),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AuthProvider _authProvider;
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _authProvider = AuthProvider();
    _router = buildRouter(_authProvider);
  }

  @override
  void dispose() {
    super.dispose();
    _router.dispose();
    _authProvider.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ThemeProvider>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: provider.themeData,
      routerConfig: _router,
    );
  }
}
