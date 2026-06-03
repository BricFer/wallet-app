import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/constants/icons.dart';
import 'package:wallet_app/core/constants/paddings.dart';
import 'package:wallet_app/core/constants/strings.dart';
import 'package:wallet_app/core/providers/navigation_provider.dart';

class GlassNavContent extends StatelessWidget {
  const GlassNavContent({super.key});

  static const _items = [
    (
      icon: AppIcons.homeIcon,
      selectedIcon: AppIcons.selectedHomeIcon,
      label: Strings.homeEn,
    ),
    (
      icon: AppIcons.otherExpensesIcon,
      selectedIcon: AppIcons.otherExpensesIcon,
      label: Strings.exchangeEn,
    ),
    (
      icon: AppIcons.transferIcon,
      selectedIcon: AppIcons.transferIcon,
      label: Strings.transactionEn,
    ),
    (
      icon: AppIcons.settingsIcon,
      selectedIcon: AppIcons.selectedSettingsIcon,
      label: Strings.settingsEn,
    ),
    (
      icon: AppIcons.aboutUsIcon,
      selectedIcon: AppIcons.aboutUsIcon,
      label: Strings.aboutUsEn,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<NavigationProvider>();
    final _colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(_items.length, (index) {
        final item = _items[index];
        final isSelected = index == nav.currentIndex;

        return GestureDetector(
          onTap: () => context.read<NavigationProvider>().setIndex(index),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: AppPaddings.paddingAll4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: AppDimens.spacing4,
              children: [
                Icon(
                  isSelected ? item.selectedIcon : item.icon,
                  color: isSelected
                      ? _colorScheme.tertiary
                      : _colorScheme.onSurface,
                ),
                Text(
                  item.label,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: isSelected
                        ? _colorScheme.tertiary
                        : _colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
