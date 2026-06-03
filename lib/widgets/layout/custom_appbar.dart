import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/widgets/theme/theme_widget.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.pageName, this.isDashboard});

  final String? pageName;
  final bool? isDashboard;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(AppDimens.height80);
}

class _CustomAppBarState extends State<CustomAppBar> {
  late String pageName;
  late bool isDashboard;

  @override
  void initState() {
    super.initState();
    pageName = widget.pageName ?? "";
    isDashboard = widget.isDashboard ?? false;
  }

  @override
  PreferredSizeWidget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      backgroundColor: _colorScheme.surface,
      toolbarHeight: AppDimens.height85,
      title: isDashboard
          ? Row(
              spacing: AppDimens.spacing24,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.all(
                    Radius.circular(AppDimens.radius8),
                  ),
                  child: Image(
                    image: AssetImage(Strings.profileUserImg),
                    height: AppDimens.size56,
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
            )
          : Text(pageName),
      centerTitle: true,
      actions: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          maxRadius: AppDimens.radius35,
          child: ThemeWidget(),
        ),
      ],
      elevation: AppDimens.elevation0,
      scrolledUnderElevation: AppDimens.elevation4,
      shadowColor: _colorScheme.shadow,
    );
  }
}
