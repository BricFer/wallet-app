import 'package:flutter/material.dart';
import 'package:wallet_app/core/themes/app_theme.dart';

enum AppThemeType { light, dark, vibrant, neutral }

class ThemeProvider extends ChangeNotifier {
  AppThemeType _theme = AppThemeType.light;

  ThemeData get themeData {
    switch (_theme) {
      case AppThemeType.dark:
        return AppTheme.dark;

      case AppThemeType.vibrant:
        return AppTheme.vibrant;

      case AppThemeType.neutral:
        return AppTheme.neutral;

      case AppThemeType.light:
      // ignore: unreachable_switch_default
      default:
        return AppTheme.light;
    }
  }

  void setTheme(AppThemeType theme) {
    _theme = theme;
    notifyListeners();
  }
}
