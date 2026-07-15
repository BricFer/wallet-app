import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/themes/colors.dart';
import 'package:wallet_app/core/providers/theme_provider.dart';
import 'package:wallet_app/core/themes/container_theme.dart';

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _selectedTheme = Provider.of<ThemeProvider>(context);
    final _colorScheme = Theme.of(context).colorScheme;
    final _containerTheme = Theme.of(context).extension<AppContainerTheme>()!;

    return Row(
      children: [
        FaIcon(AppIcons.themeFaIcon, color: _colorScheme.onSurface),
        SizedBox(width: AppDimens.width12),
        PopupMenuButton<AppThemeType>(
          color: _containerTheme.backgroundColor,
          elevation: AppDimens.elevation24,
          shadowColor: AppColors.shadowColor,
          onSelected: _selectedTheme.setTheme,
          itemBuilder: (context) => [
            PopupMenuItem(
              value: AppThemeType.light,
              child: Text(
                Strings.lightTheme,
                style: TextStyle(color: _containerTheme.fontColorVariant),
              ),
            ),
            PopupMenuItem(
              value: AppThemeType.dark,
              child: Text(
                Strings.darkTheme,
                style: TextStyle(color: _containerTheme.fontColorVariant),
              ),
            ),
            PopupMenuItem(
              value: AppThemeType.vibrant,
              child: Text(
                Strings.vibrantTheme,
                style: TextStyle(color: _containerTheme.fontColorVariant),
              ),
            ),
            PopupMenuItem(
              value: AppThemeType.neutral,
              child: Text(
                Strings.neutralTheme,
                style: TextStyle(color: _containerTheme.fontColorVariant),
              ),
            ),
          ],
          child: Text(Strings.theme),
        ),
      ],
    );
  }
}
