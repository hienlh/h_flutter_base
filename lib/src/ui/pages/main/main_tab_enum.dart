import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_base/src/routes/routes.dart';
import 'package:flutter_base/src/ui/styles/theme.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart' hide VxContextExtensions;

import '../../../../generated/l10n.dart';
import '../../../controllers/auth_controller.dart';
import '../dev/dev_page.dart';

enum MainTabEnum { menu, home, setting }

extension HomeTabEnumExt on MainTabEnum {
  IconData get iconData {
    switch (this) {
      case MainTabEnum.menu:
        return Icons.menu;
      case MainTabEnum.home:
        return Icons.home_outlined;
      case MainTabEnum.setting:
        return Icons.settings_outlined;
    }
  }

  Widget getIconButton({
    bool isSelected = false,
    double iconSize = 24,
    Function()? onPressed,
  }) {
    final color = HTheme.d.textColor;

    Widget iconWidget = Icon(
      iconData,
      color: color,
      size: iconSize,
    );
    final authController = Get.find<AuthController>();

    return InkWell(
      onTap: onPressed,
      child: AnimatedSwitcher(
        duration: 300.milliseconds,
        child: Obx(() => Column(
              key: ValueKey(isSelected),
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Badge(
                  badgeStyle: BadgeStyle(
                    badgeColor: Colors.red,
                    elevation: 0,
                    padding: EdgeInsets.all(
                      authController.unreadNotiCount > 9 ? 2 : 4,
                    ),
                  ),
                  badgeAnimation: BadgeAnimation.fade(
                    animationDuration: Duration.zero,
                  ),
                  showBadge: authController.unreadNotiCount > 0 &&
                      authController.isAuth &&
                      this == MainTabEnum.setting,
                  position: BadgePosition.topStart(start: 16, top: -5),
                  badgeContent: Obx(() => Text(
                        authController.unreadNotiCount > 9
                            ? '9+'
                            : authController.unreadNotiCount.toString(),
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )),
                  child: AnimatedRotation(
                    turns: isSelected ? 1.0 / 8.0 : 0,
                    duration: const Duration(seconds: 1),
                    child: iconWidget,
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget get page {
    switch (this) {
      case MainTabEnum.menu:
        return Container(color: Colors.amber);
      case MainTabEnum.home:
        return Container(
          color: Colors.brown,
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                final auth = Get.find<AuthController>();
                if (auth.isAuth) {
                  auth.logout();
                } else {
                  Get.toNamed(Routes.login.p);
                }
              },
              child: Text(
                Get.find<AuthController>().isAuth
                    ? S.current.logout
                    : S.current.login,
              ),
            ),
          ),
        );
      case MainTabEnum.setting:
        return DevPage();
    }
  }
}
