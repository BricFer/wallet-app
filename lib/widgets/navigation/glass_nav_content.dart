import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/dimens.dart';
import 'package:wallet_app/core/constants/icons.dart';
import 'package:wallet_app/core/constants/strings.dart';
import 'package:wallet_app/core/providers/navigation_provider.dart';

class GlassNavContent extends StatelessWidget {
  const GlassNavContent({super.key});

  static const _items = [
    (
      icon: AppIcons.home,
      selectedIcon: AppIcons.selectedHome,
      label: Strings.homeEn,
    ),
    (
      icon: AppIcons.otherExpenses,
      selectedIcon: AppIcons.otherExpenses,
      label: Strings.exchangeEn,
    ),
    (
      icon: AppIcons.transfer,
      selectedIcon: AppIcons.transfer,
      label: Strings.transactionEn,
    ),
    (
      icon: AppIcons.settings,
      selectedIcon: AppIcons.selectedSettings,
      label: Strings.settingsEn,
    ),
    (
      icon: AppIcons.aboutUs,
      selectedIcon: AppIcons.aboutUs,
      label: Strings.aboutUsEn,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<NavigationProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(_items.length, (index) {
        final item = _items[index];
        final isSelected = index == nav.currentIndex;

        return GestureDetector(
          onTap: () => context.read<NavigationProvider>().setIndex(index),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsetsGeometry.all(AppDimens.xsSpacing),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: AppDimens.xsSpacing,
              children: [
                Icon(
                  isSelected ? item.selectedIcon : item.icon,
                  color: isSelected
                      ? Theme.of(context).colorScheme.tertiary
                      : Theme.of(context).colorScheme.onSurface,
                ),
                Text(
                  item.label,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: isSelected
                        ? Theme.of(context).colorScheme.tertiary
                        : Theme.of(context).colorScheme.onSurface,
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
