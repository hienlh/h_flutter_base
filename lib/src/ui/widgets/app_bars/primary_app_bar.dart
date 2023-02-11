import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart' hide VxContextExtensions;

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final double? elevation;
  final Color? backgroundColor;
  final Color? textColor;
  final PreferredSizeWidget? bottom;
  final bool enableBack;

  const PrimaryAppBar({
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
    final textColor = this.textColor ?? context.theme.colorScheme.onPrimary;
    return AppBar(
      elevation: elevation ?? 1,
      backgroundColor: context.theme.colorScheme.primary,
      actions: actions,
      leading: Navigator.canPop(context) && enableBack
          ? IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.chevron_left_rounded,
                size: 24,
                color: textColor,
              ),
            )
          : null,
      centerTitle: false,
      title: title.text.bold
          .size(24)
          .color(context.theme.colorScheme.onPrimary)
          .make(),
      bottom: bottom,
    );
  }
}
