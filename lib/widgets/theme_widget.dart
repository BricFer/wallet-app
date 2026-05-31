import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/theme/colors.dart';
import 'package:wallet_app/core/theme/theme_provider.dart';

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _selectedTheme = Provider.of<ThemeProvider>(context);

    return PopupMenuButton<AppThemeType>(
      icon: const FaIcon(AppIcons.themeIcon, size: AppDimens.mdIconSize),
      iconColor: Theme.of(context).colorScheme.onSurface,
      color: Theme.of(context).colorScheme.primary,
      elevation: AppDimens.xlElevation,
      shadowColor: AppColors.shadowColor,
      onSelected: _selectedTheme.setTheme,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: AppThemeType.light,
          child: Text(
            Strings.lightTheme,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        PopupMenuItem(
          value: AppThemeType.dark,
          child: Text(
            Strings.darkTheme,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        PopupMenuItem(
          value: AppThemeType.vibrant,
          child: Text(
            Strings.vibrantTheme,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        PopupMenuItem(
          value: AppThemeType.neutral,
          child: Text(
            Strings.neutralTheme,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      ],
    );
  }
}
