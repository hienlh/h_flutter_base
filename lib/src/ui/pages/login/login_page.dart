import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:velocity_x/velocity_x.dart' hide VxContextExtensions;

import '../../../../generated/l10n.dart';
import '../../../controllers/auth_controller.dart';
import '../../../data/interfaces/logger_interface.dart';
import '../../../data/models/enums/load_status.dart';
import '../../../data/models/enums/social_provider.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../data/services/services.dart';
import '../../../routes.dart';
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
            textColor: context.theme.colorScheme.onBackground,
          ),
          body: _buildBody(context),
        ));
  }

  Widget _buildBody(BuildContext context) {
    final socialList = SocialProvider.values
        .where((e) => Platform.isIOS || e != SocialProvider.apple)
        .toList();
    final agreePrivacy =
        S.current.agreePrivacy(S.current.privacy, S.current.termsAndConditions);
    return Padding(
      padding: EdgeInsets.all(16).copyWith(top: 0),
      child: Form(
        key: formPhoneKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            S.current.login.text
                .headline4(context)
                .color(context.theme.colorScheme.onBackground)
                .bold
                .make(),
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
                style: context.textTheme.bodySmall!
                    .copyWith(color: context.theme.colorScheme.onBackground),
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
            10.heightBox,
            ...socialList
                .asMap()
                .map(
                  (i, e) => MapEntry(
                    i,
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: PrimaryButton(
                        icon: SvgPicture.asset(e.icon, width: 24, height: 24),
                        text: e.title,
                        onPressed: () {
                          controller.loginSns(e);
                        },
                        backgroundColor: e.color,
                      ),
                    ),
                  ),
                )
                .values
                ,
            30.heightBox,
            Spacer(),
            Center(
              child: RichText(
                text: TextSpan(
                  style: context.textTheme.bodyMedium!
                      .copyWith(color: context.theme.colorScheme.onBackground),
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
                            Get.offAllNamed(Routes.main);
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
