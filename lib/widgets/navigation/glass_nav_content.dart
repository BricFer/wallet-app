import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/providers/navigation_provider.dart';

class GlassNavContent extends StatelessWidget {
  const GlassNavContent({super.key});

  static const _items = [
    (
      icon: AppIcons.homeIcon,
      selectedIcon: AppIcons.selectedHomeIcon,
      label: Strings.home,
    ),
    (
      icon: AppIcons.expensesIcon,
      selectedIcon: AppIcons.expensesIcon,
      label: Strings.exchange,
    ),
    (
      icon: AppIcons.transferIcon,
      selectedIcon: AppIcons.transferIcon,
      label: Strings.transaction,
    ),
    (
      icon: AppIcons.settingsIcon,
      selectedIcon: AppIcons.selectedSettingsIcon,
      label: Strings.settings,
    ),
    (
      icon: AppIcons.aboutUsIcon,
      selectedIcon: AppIcons.aboutUsIcon,
      label: Strings.aboutUs,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<NavigationProvider>();
    final _colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Row(
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
      ),
    );
  }
}
