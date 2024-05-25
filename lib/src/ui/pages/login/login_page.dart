import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/ui/styles/size.dart';
import 'package:flutter_base/src/ui/styles/theme.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart' hide VxContextExtensions;

import '../../../../generated/l10n.dart';
import '../../../controllers/auth_controller.dart';
import '../../../data/interfaces/logger_interface.dart';
import '../../../data/models/enums/load_status.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../data/services/services.dart';
import '../../../routes/routes.dart';
import '../../../ui/widgets/buttons/primary_button.dart';
import '../../../ui/widgets/common/primary_scaffold.dart';
import '../../../utils/app_utils.dart';
import '../../widgets/app_bars/back_app_bar.dart';
import '../../widgets/common/h_text_field.dart';
import '../otp/otp_page.dart';

part 'login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        Get.find<LogService>(),
        Get.find(),
        Get.find(),
        nextPage: Get.arguments is Routing ? Get.arguments : null,
      ),
    );
  }
}

class LoginPage extends GetView<LoginController> {
  final formPhoneKey = GlobalKey<FormState>();
  final formNameKey = GlobalKey<FormState>();

  LoginPage() {
    Get.find<AuthController>().canFaceId().then((value) {
      if (value) controller.localAuth();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => PrimaryScaffold(
          appBar: BackAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            textColor: HTheme.d.textColor,
          ),
          body: _buildBody(context),
        ));
  }

  Widget _buildBody(BuildContext context) {
    final agreePrivacy =
        S.current.agreePrivacy(S.current.privacy, S.current.termsAndConditions);
    return Padding(
      padding: EdgeInsets.all(16).copyWith(top: 0),
      child: Form(
        key: formPhoneKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            S.current.login.text.bold.make(),
            30.heightBox,
            CustomTextField(
              borderColor: Color(0xffDADEE3),
              initialValue: controller.phoneNumberOrEmail.value,
              hintText: S.current.enterEmail,
              validator: (v) {
                if (!GetUtils.isPhoneNumber(v ?? '') &&
                    !GetUtils.isEmail(v ?? '')) {
                  return S.current.errorEmailIncorrect;
                }
                return null;
              },
              onChanged: controller.onChangePhoneOrEmail,
              keyboardType: TextInputType.text,
            ),
            16.heightBox,
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: HTheme.d.textColor,
                  fontSize: HTextSize.hNormal,
                ),
                children: [
                  TextSpan(
                    text:
                        agreePrivacy.split(S.current.termsAndConditions).first,
                  ),
                  TextSpan(
                    text: S.current.termsAndConditions,
                    style: TextStyle(color: context.theme.colorScheme.primary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = AppUtils.openTerms,
                  ),
                  TextSpan(
                    text: agreePrivacy
                        .split(S.current.termsAndConditions)
                        .last
                        .split(S.current.privacy)
                        .first,
                  ),
                  TextSpan(
                    text: S.current.privacy,
                    style: TextStyle(color: context.theme.colorScheme.primary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = AppUtils.openTerms,
                  ),
                  TextSpan(text: agreePrivacy.split(S.current.privacy).last),
                ],
              ),
            ),
            20.heightBox,
            PrimaryButton(
              text: S.current.login,
              onPressed: () {
                if (formPhoneKey.currentState?.validate() ?? false) {
                  controller.signInPhoneOrEmail();
                }
              },
              isLoading: controller.loadStatus.value == LoadStatus.loading,
            ),
            5.heightBox,
            10.heightBox,
            S.current.orLoginWith.toLowerCase().text.bold.makeCentered(),
            30.heightBox,
            Spacer(),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: S.current.or.toLowerCase()),
                    TextSpan(
                      text: ' ${S.current.useAsGuest}',
                      style:
                          TextStyle(color: context.theme.colorScheme.primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          if (Navigator.canPop(context)) {
                            Get.back();
                          } else {
                            Get.offAllNamed(Routes.main.p);
                          }
                        },
                    ),
                  ],
                ),
              ),
            ),
            MediaQuery.of(context).padding.bottom.heightBox,
          ],
        ),
      ),
    );
  }
}
