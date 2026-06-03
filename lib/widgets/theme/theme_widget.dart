import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/themes/colors.dart';
import 'package:wallet_app/core/themes/theme_provider.dart';

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _selectedTheme = Provider.of<ThemeProvider>(context);
    final _colorScheme = Theme.of(context).colorScheme;

    return PopupMenuButton<AppThemeType>(
      icon: const FaIcon(AppIcons.themeFaIcon, size: AppDimens.iconSize36),
      iconColor: _colorScheme.onSurface,
      color: _colorScheme.primary,
      elevation: AppDimens.elevation24,
      shadowColor: AppColors.shadowColor,
      onSelected: _selectedTheme.setTheme,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: AppThemeType.light,
          child: Text(
            Strings.lightTheme,
            style: TextStyle(color: _colorScheme.onPrimary),
          ),
        ),
        PopupMenuItem(
          value: AppThemeType.dark,
          child: Text(
            Strings.darkTheme,
            style: TextStyle(color: _colorScheme.onPrimary),
          ),
        ),
        PopupMenuItem(
          value: AppThemeType.vibrant,
          child: Text(
            Strings.vibrantTheme,
            style: TextStyle(color: _colorScheme.onPrimary),
          ),
        ),
        PopupMenuItem(
          value: AppThemeType.neutral,
          child: Text(
            Strings.neutralTheme,
            style: TextStyle(color: _colorScheme.onPrimary),
          ),
        ),
      ],
    );
  }
}
