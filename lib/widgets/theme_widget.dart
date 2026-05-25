import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/barrel_file.dart';
import 'package:wallet_app/core/theme/colors.dart';
import 'package:wallet_app/core/theme/theme_provider.dart';

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _selectedTheme = Provider.of<ThemeProvider>(context);

    return PopupMenuButton<AppThemeType>(
      icon: const Icon(AppIcons.themeIcon, size: 25.0),
      iconColor: Theme.of(context).colorScheme.surface,
      color: Theme.of(context).colorScheme.primary,
      elevation: AppDimens.xlElevation,
      shadowColor: AppColors.shadowColor,
      onSelected: _selectedTheme.setTheme,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: AppThemeType.light,
          child: Text(
            "Light",
            style: TextStyle(color: Theme.of(context).colorScheme.surface),
          ),
        ),
        PopupMenuItem(
          value: AppThemeType.dark,
          child: Text(
            "Dark",
            style: TextStyle(color: Theme.of(context).colorScheme.surface),
          ),
        ),
        PopupMenuItem(
          value: AppThemeType.vibrant,
          child: Text(
            "Vibrant",
            style: TextStyle(color: Theme.of(context).colorScheme.surface),
          ),
        ),
        PopupMenuItem(
          value: AppThemeType.neutral,
          child: Text(
            "Neutral",
            style: TextStyle(color: Theme.of(context).colorScheme.surface),
          ),
        ),
      ],
    );
  }
}
