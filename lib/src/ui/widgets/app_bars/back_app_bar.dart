import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trihai_admin_app/src/base/extensions/context_ext.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constants/assets.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final double? elevation;
  final Color? backgroundColor;
  final Color? textColor;
  final PreferredSizeWidget? bottom;
  final bool enableBack;

  const BackAppBar({
    Key? key,
    this.title = '',
    this.actions,
    this.elevation,
    this.backgroundColor,
    this.textColor,
    this.bottom,
    this.enableBack = true,
  }) : super(key: key);

  @override
  Size get preferredSize =>
      Size.fromHeight(56 + (bottom != null ? bottom!.preferredSize.height : 0));

  @override
  Widget build(BuildContext context) {
    final textColor = this.textColor ?? context.colorScheme.onBackground;
    return AppBar(
      elevation: elevation,
      backgroundColor: backgroundColor ?? context.colorScheme.background,
      actions: actions,
      leading: Navigator.canPop(context) && enableBack
          ? IconButton(
              onPressed: () => Get.back(),
              icon: SvgPicture.asset(
                Assets.icons.arrowLeft,
                color: textColor,
                width: 24,
                height: 24,
              ),
            )
          : null,
      centerTitle: true,
      title: title.text
          .size(16)
          .bold
          .overflow(TextOverflow.ellipsis)
          .color(textColor)
          .make(),
      bottom: bottom,
    );
  }
}
