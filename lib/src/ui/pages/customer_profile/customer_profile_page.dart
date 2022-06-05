import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:trihai_admin_app/src/base/extensions/context_ext.dart';
import 'package:trihai_admin_app/src/data/models/entities/customer_entity.dart';
import 'package:trihai_admin_app/src/routes.dart';
import 'package:trihai_admin_app/src/ui/pages/point_history/point_history_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../generated/l10n.dart';
import '../../widgets/app_bars/back_app_bar.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/common/h_network_image.dart';
import '../../widgets/common/h_text_field.dart';
import '../../widgets/common/primary_scaffold.dart';
import 'customer_profile_controller.dart';

class CustomerProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerProfileController>(() => CustomerProfileController());
  }
}

class CustomerProfileArgs {
  final CustomerEntity data;

  CustomerProfileArgs(this.data);
}

class CustomerProfilePage extends GetView<CustomerProfileController> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as CustomerProfileArgs?;
    final data = args?.data ?? CustomerEntity(id: 'id');

    return PrimaryScaffold(
      appBar: BackAppBar(
        backgroundColor: context.colorScheme.primary,
        textColor: context.colorScheme.onPrimary,
        title: S.current.customerInformation,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: PrimaryButton(
            text: S.current.pointHistory,
            onPressed: () {
              Get.toNamed(
                Routes.pointHistory,
                arguments: PointHistoryArgs(data),
              );
            },
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
                    child: CustomNetworkImage(
                      data.avatarUrl,
                      isAvatar: true,
                    ),
                  ),
                ),
                14.heightBox,
                (data.fullName ?? '').text.xl.bold.makeCentered(),
                4.heightBox,
                (data.phone ?? '').text.medium.makeCentered(),
                14.heightBox,
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
                          initialValue: data.fullName,
                          textAlign: TextAlign.right,
                          enabled: false,
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
                        child: CustomTextField(
                          fontSize: 16,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            isDense: true,
                          ),
                          initialValue: data.dateOfBirth != null
                              ? DateFormat('dd/MM/yyyy')
                                  .format(data.dateOfBirth!)
                              : '',
                          textAlign: TextAlign.right,
                          enabled: false,
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
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: CustomTextField(
                            fontSize: 16,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                              isDense: true,
                            ),
                            initialValue: data.address,
                            textAlign: TextAlign.right,
                            enabled: false,
                            keyboardType: TextInputType.phone,
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
                            initialValue: data.phone,
                            textAlign: TextAlign.right,
                            enabled: false,
                            keyboardType: TextInputType.phone,
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
                            initialValue: data.email,
                            textAlign: TextAlign.right,
                            keyboardType: TextInputType.emailAddress,
                            enabled: false,
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
