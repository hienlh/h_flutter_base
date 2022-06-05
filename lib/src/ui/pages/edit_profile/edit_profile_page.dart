import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:trihai_admin_app/src/base/extensions/context_ext.dart';
import 'package:trihai_admin_app/src/data/models/enums/load_status.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../generated/l10n.dart';
import '../../widgets/app_bars/back_app_bar.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/common/h_network_image.dart';
import '../../widgets/common/h_text_field.dart';
import '../../widgets/common/image_picker_action_sheet.dart';
import '../../widgets/common/primary_scaffold.dart';
import 'edit_profile_controller.dart';

class EditProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(
        () => EditProfileController(Get.find(), Get.find()));
  }
}

class EditProfilePage extends GetView<EditProfileController> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      appBar: BackAppBar(
        backgroundColor: context.colorScheme.primary,
        textColor: context.colorScheme.onPrimary,
        title: S.current.editAccount,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(
            () => PrimaryButton(
              text: S.current.saveChanges,
              isLoading: controller.loadStatus.value.isLoading,
              onPressed: () {
                FocusNode().unfocus();
                if (formKey.currentState!.validate()) {
                  controller.save();
                }
              },
            ),
          ),
        ),
      ),
      backgroundColor: context.colorScheme.background.withOpacity(0.97),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: Obx(
                      () => Stack(
                        children: [
                          Positioned.fill(
                            child: CustomNetworkImage(
                              controller.currentUser?.avatarUrl,
                              isAvatar: true,
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              height: 112,
                              width: 112,
                              child: CircularProgressIndicator(
                                value: controller
                                        .uploadAvatarStatus.value.isLoading
                                    ? null
                                    : 0,
                                backgroundColor: Colors.transparent,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    context.colorScheme.primary
                                        .withOpacity(0.5)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                4.heightBox,
                CupertinoButton(
                  child: 'Change photo'
                      .text
                      .fontWeight(FontWeight.bold)
                      .size(16)
                      .make(),
                  onPressed: () async {
                    final file = await showImagePickerActionSheet(context);
                    if (file != null) {
                      await controller.uploadAvatar(file);
                    }
                  },
                ),
                10.heightBox,
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: context.colorScheme.surface),
                    ),
                    color: context.colorScheme.background,
                  ),
                  child: Row(
                    children: [
                      S.current.lastName.text
                          .size(16)
                          .color(context.colorScheme.onSurface)
                          .make(),
                      10.widthBox,
                      Expanded(
                        child: CustomTextField(
                          fontSize: 16,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            isDense: true,
                          ),
                          initialValue: controller.currentUser?.fullName ?? '',
                          textAlign: TextAlign.right,
                          onChanged: (v) {
                            controller.changeValue(fullName: v);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: context.colorScheme.surface),
                    ),
                    color: context.colorScheme.background,
                  ),
                  child: Row(
                    children: [
                      S.current.birthDate.text
                          .size(16)
                          .color(context.colorScheme.onSurface)
                          .make(),
                      10.widthBox,
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate:
                                  controller.currentUser?.dateOfBirth ??
                                      DateTime.now(),
                              firstDate: DateTime(1910),
                              lastDate: DateTime.now(),
                            );

                            controller.changeValue(dateOfBirth: date);
                          },
                          child: IgnorePointer(
                            child: Obx(
                              () => CustomTextField(
                                key: ValueKey<DateTime?>(
                                    controller.currentUser?.dateOfBirth),
                                fontSize: 16,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                  isDense: true,
                                ),
                                initialValue: controller
                                            .currentUser?.dateOfBirth !=
                                        null
                                    ? DateFormat('dd/MM/yyyy').format(
                                        controller.currentUser!.dateOfBirth!)
                                    : '',
                                textAlign: TextAlign.right,
                                enabled: false,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: context.colorScheme.surface),
                    ),
                    color: context.colorScheme.background,
                  ),
                  child: Row(
                    children: [
                      S.current.address.text
                          .size(16)
                          .color(context.colorScheme.onSurface)
                          .make(),
                      10.widthBox,
                      Expanded(
                        child: CustomTextField(
                          fontSize: 16,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            isDense: true,
                          ),
                          initialValue: controller.currentUser?.address ?? '',
                          textAlign: TextAlign.right,
                          onChanged: (v) {
                            controller.changeValue(address: v);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: context.colorScheme.surface),
                    ),
                    color: context.colorScheme.background,
                  ),
                  child: Row(
                    children: [
                      S.current.phoneNumber.text
                          .size(16)
                          .color(context.colorScheme.onSurface)
                          .make(),
                      10.widthBox,
                      Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: CustomTextField(
                            fontSize: 16,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                              isDense: true,
                            ),
                            initialValue: controller.currentUser?.phone ?? '',
                            textAlign: TextAlign.right,
                            onChanged: (v) {
                              controller.changeValue(phone: v);
                            },
                            keyboardType: TextInputType.phone,
                            validator: (v) {
                              if (v != null && !GetUtils.isPhoneNumber(v)) {
                                return S.current.errorPhoneIncorrect;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: context.colorScheme.surface),
                    ),
                    color: context.colorScheme.background,
                  ),
                  child: Row(
                    children: [
                      S.current.email.text
                          .size(16)
                          .color(context.colorScheme.onSurface)
                          .make(),
                      10.widthBox,
                      Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: CustomTextField(
                            fontSize: 16,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                              isDense: true,
                            ),
                            initialValue: controller.currentUser?.email ?? '',
                            textAlign: TextAlign.right,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (v) {
                              controller.changeValue(email: v);
                            },
                            validator: (v) {
                              if (v != null && !GetUtils.isEmail(v)) {
                                return S.current.errorEmailIncorrect;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
