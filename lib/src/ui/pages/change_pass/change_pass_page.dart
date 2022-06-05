import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trihai_admin_app/src/base/extensions/context_ext.dart';
import 'package:trihai_admin_app/src/data/models/enums/load_status.dart';
import 'package:trihai_admin_app/src/ui/widgets/app_bars/back_app_bar.dart';
import 'package:trihai_admin_app/src/ui/widgets/buttons/primary_button.dart';
import 'package:trihai_admin_app/src/ui/widgets/common/h_text_field.dart';
import 'package:trihai_admin_app/src/ui/widgets/common/primary_scaffold.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../generated/l10n.dart';
import 'change_pass_controller.dart';

class ChangePassBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePassController>(() => ChangePassController(Get.find()));
  }
}

class ChangePassPage extends GetView<ChangePassController> {
  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      appBar: BackAppBar(
        backgroundColor: context.colorScheme.primary,
        textColor: context.colorScheme.onPrimary,
        title: S.current.changePassword,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Obx(
            () => PrimaryButton(
              text: S.current.saveChanges,
              onPressed: controller.save,
              isLoading: controller.loadStatus.value.isLoading,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              borderRadius: BorderRadius.circular(10),
              borderColor: context.colorScheme.surface,
              hintText: S.current.oldPassword,
              onChanged: (v) => controller.oldPass = v,
              initialValue: controller.oldPass,
              obscureText: true,
              validator: (v) {
                if (v.isEmptyOrNull) {
                  return S.current.errorEmptyField;
                }
                return null;
              },
            ),
            20.heightBox,
            CustomTextField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              borderRadius: BorderRadius.circular(10),
              borderColor: context.colorScheme.surface,
              hintText: S.current.newPassword,
              onChanged: (v) => controller.newPass = v,
              obscureText: true,
              initialValue: controller.newPass,
              validator: (v) {
                if (v.isEmptyOrNull) {
                  return S.current.errorEmptyField;
                } else if (v == controller.oldPass) {
                  return S.current.errorNewPasswordSameWithOldPassword;
                }
                return null;
              },
            ),
            20.heightBox,
            CustomTextField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              borderRadius: BorderRadius.circular(10),
              borderColor: context.colorScheme.surface,
              hintText: S.current.reEnterNewPassword,
              obscureText: true,
              validator: (v) {
                if (v != controller.newPass) {
                  return '';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
