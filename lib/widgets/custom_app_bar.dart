import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/barrel_file.dart';
import 'package:wallet_app/widgets/theme_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String pageName;
  final IconData icon;

  const CustomAppBar({required this.pageName, required this.icon, super.key});

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.surface,
      toolbarHeight: 85,
      // leading: Icon(AppIcons.menu),
      title: Text(pageName),
      centerTitle: true,
      actions: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          maxRadius: 35.0,
          child: ThemeWidget(),
        ),
        Padding(
          padding: const EdgeInsets.all(AppDimens.xsPadding),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            maxRadius: 25.0,
            child: Image.network(Strings.imageProfileUrl),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
