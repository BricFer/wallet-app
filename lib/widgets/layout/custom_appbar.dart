// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/widgets/theme/theme_widget.dart';
import 'package:wallet_app/core/providers/auth_provider.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.isDashboard,
    this.toolbarHeight,
  });

  final String? title;
  final bool? isDashboard;
  final double? toolbarHeight;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(AppDimens.height80);
}

class _CustomAppBarState extends State<CustomAppBar> {
  late String title;
  late bool isDashboard;
  late double toolbarHeight;

  @override
  void initState() {
    super.initState();
    title = widget.title ?? "";
    isDashboard = widget.isDashboard ?? false;
    toolbarHeight = widget.toolbarHeight ?? AppDimens.height85;
  }

  @override
  PreferredSizeWidget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    final fullname = context.watch<AuthProvider>().fullname;
    final username = context.watch<AuthProvider>().username;

    final displayedName = username ?? fullname;

    return AppBar(
      backgroundColor: _colorScheme.surface,
      toolbarHeight: toolbarHeight,
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
                        text: "Welcome,\n",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      TextSpan(
                        text: displayedName,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Text(title),
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
