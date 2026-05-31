import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/widgets/theme_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({this.pageName, super.key});

  final String? pageName;

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      // // backgroundColor: Theme.of(context).colorScheme.primary,
      // foregroundColor: Theme.of(context).colorScheme.onSurface,
      toolbarHeight: 85,
      title: Row(
        spacing: AppDimens.smSpacing,
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
                  text:
                      "\nPepito Perez", // TODO: Acá ha de ir el nombre del usuario que se recupera de la base de datos al hacer el login
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
