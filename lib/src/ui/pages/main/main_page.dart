import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trihai_admin_app/src/base/extensions/context_ext.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../generated/l10n.dart';
import '../../../constants/assets.dart';
import '../../../controllers/auth_controller.dart';
import '../../../routes.dart';
import '../../widgets/app_bars/back_app_bar.dart';
import '../../widgets/buttons/rounded_button.dart';
import '../../widgets/common/h_network_image.dart';
import '../../widgets/common/primary_scaffold.dart';

class MainPage extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();

    return PrimaryScaffold(
      appBar: BackAppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        textColor: context.colorScheme.onPrimary,
      ),
      backgroundColor: context.colorScheme.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: CustomNetworkImage(
                null,
                isAvatar: true,
              ),
            ),
          ),
          12.heightBox,
          Obx(
            () => (auth.currentUser?.name ?? '')
                .text
                .fontWeight(FontWeight.w600)
                .size(20)
                .color(Colors.white)
                .makeCentered(),
          ),
          Obx(
            () =>
                (auth.currentUser?.phoneNumber ?? auth.currentUser?.email ?? '')
                    .text
                    .fontWeight(FontWeight.w400)
                    .color(Colors.white)
                    .size(14)
                    .makeCentered(),
          ),
          24.heightBox,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: context.colorScheme.background,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: ListView(
                padding: EdgeInsets.all(24),
                children: [
                  // _buildRowItem(
                  //   context,
                  //   Assets.icons.user,
                  //   S.current.editAccount,
                  //   () => Get.toNamed(Routes.editProfile),
                  // ),
                  // 20.heightBox,
                  _buildRowItem(
                    context,
                    Assets.icons.qr,
                    S.current.scanQrCode,
                    () => Get.toNamed(Routes.scanQrCode),
                  ),
                  20.heightBox,
                  _buildRowItem(
                    context,
                    Assets.icons.key,
                    S.current.changePassword,
                    () => Get.toNamed(Routes.changePassword),
                  ),
                  // 20.heightBox,
                  // _buildRowItem(
                  //   context,
                  //   Assets.icons.history,
                  //   S.current.bookingHistory,
                  //   () => Get.toNamed(Routes.main),
                  // ),
                  20.heightBox,
                  RoundedButton.outlined(
                    title: S.current.logout,
                    backgroundColor: context.colorScheme.background,
                    textColor: context.colorScheme.onBackground,
                    borderColor: context.colorScheme.onSurface,
                    onPressed: Get.find<AuthController>().logout,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRowItem(
    BuildContext context,
    String icon,
    String title, [
    Function()? onPressed,
  ]) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            color: context.colorScheme.primary,
            width: 24,
            height: 24,
          ),
          12.widthBox,
          Expanded(
            child: title.text.size(16).fontWeight(FontWeight.w400).make(),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: SvgPicture.asset(
              Assets.icons.arrowRight,
              color: context.colorScheme.onBackground,
              width: 24,
              height: 24,
            ),
          )
        ],
      ),
    );
  }
}
