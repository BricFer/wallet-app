import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/icons.dart';
import 'package:wallet_app/core/constants/paddings.dart';
import 'package:wallet_app/core/themes/app_decoration.dart';
import 'package:wallet_app/core/themes/container_theme.dart';
import 'package:wallet_app/widgets/layout/custom_clipper.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    this.title,
    this.child,
    this.showReturnIcon = true,
  });

  final String? title;
  final Widget? child;
  final bool showReturnIcon;

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final _containerTheme = Theme.of(context).extension<AppContainerTheme>()!;

    return ClipPath(
      clipper: CustomClipperPath(),
      child: Container(
        padding: AppPaddings.paddingAll16,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        alignment: Alignment.centerLeft,
        decoration: AppDecoration.container(
          context,
          borderRadius: BorderRadius.zero,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (showReturnIcon)
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      AppIcons.backIcon,
                      color: _containerTheme.iconContainerColor,
                    ),
                  ),
                ],
              ),
            Expanded(
              child: Row(
                children: [
                  Text(
                    title ?? '',
                    style: _textTheme.headlineMedium?.copyWith(
                      color: _containerTheme.fontColorVariant,
                    ),
                  ),
                ],
              ),
            ),
            child ??
                Text(
                  title ?? '',
                  style: _textTheme.headlineMedium?.copyWith(
                    color: _containerTheme.fontColorVariant,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
