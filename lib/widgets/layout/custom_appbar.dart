import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/widgets/theme/theme_widget.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.pageName});

  final String? pageName;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      toolbarHeight: 85,
      title: Row(
        spacing: AppDimens.mdSpacing,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.all(
              Radius.circular(AppDimens.smRadius),
            ),
            child: Image(
              image: AssetImage(Strings.profileUserImg),
              height: AppDimens.xsSize,
            ),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "Welcome,",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextSpan(
                  text: "\nPepito Perez",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          maxRadius: 35.0,
          child: ThemeWidget(),
        ),
      ],
      scrolledUnderElevation: AppDimens.mdElevation,
      shadowColor: Theme.of(context).colorScheme.shadow,
    );
  }
}
