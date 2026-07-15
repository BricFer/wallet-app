import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/core/providers/user_provider.dart';

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
  @override
  PreferredSizeWidget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    final username = context.read<UserProvider>().user?.username;

    final displayedName = (username != null && username.isNotEmpty)
        ? username
        : context.read<UserProvider>().user?.fullname;

    return AppBar(
      backgroundColor: _colorScheme.surface,
      toolbarHeight: widget.toolbarHeight ?? AppDimens.height85,
      title: (widget.isDashboard ?? false)
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
          : Text(widget.title ?? ''),
      centerTitle: true,
      elevation: AppDimens.elevation0,
      scrolledUnderElevation: AppDimens.elevation4,
      shadowColor: _colorScheme.shadow,
    );
  }
}
