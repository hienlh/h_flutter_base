import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trihai_admin_app/src/base/extensions/context_ext.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../generated/l10n.dart';
import '../../../constants/assets.dart';
import '../../../controllers/auth_controller.dart';
import '../../../data/interfaces/logger_interface.dart';
import '../../../data/models/enums/load_status.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../data/services/services.dart';
import '../../../routes.dart';
import '../../../ui/widgets/common/primary_scaffold.dart';
import '../../../utils/app_utils.dart';
import '../../widgets/app_bars/back_app_bar.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/common/h_text_field.dart';
import '../../widgets/common/header_logo.dart';
import '../../widgets/pin_code/pin_code_fields.dart';
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
  final formKey = GlobalKey<FormState>();

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
            textColor: context.colorScheme.onPrimary,
          ),
          backgroundColor: context.colorScheme.primary,
          isLoading: controller.snsLoadStatus.value == LoadStatus.loading,
          body: Column(
            children: [
              HeaderLogo(),
              32.heightBox,
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: context.colorScheme.background,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40)),
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          duration: 500.milliseconds,
                          child: Obx(
                            () => AnimatedSwitcher(
                              duration: 500.milliseconds,
                              reverseDuration: 500.milliseconds,
                              transitionBuilder: (child, animation) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                              child: Container(
                                key: ValueKey(controller.currentPage.value),
                                child: _buildBody(context),
                              ),
                            ),
                          ),
                        ),
                        15.heightBox,
                        Obx(() => Center(
                              child: Visibility(
                                visible: controller.currentPage.value !=
                                    LoginPageType.phoneNumber,
                                maintainState: true,
                                maintainSize: true,
                                maintainAnimation: true,
                                child: InkWell(
                                  onTap: controller.onBack,
                                  child: Icon(Icons.chevron_left),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildBody(BuildContext context) {
    switch (controller.currentPage.value) {
      case LoginPageType.phoneNumber:
        return _buildPhoneOrEmail(context);
      case LoginPageType.otp:
        return _buildOtp();
    }
  }

  Widget _buildPhoneOrEmail(BuildContext context) {
    // return _buildInputForm(
    //   initialValue: controller.username.value,
    //   label: S.current.login,
    //   keyboardType: TextInputType.text,
    //   buttonText: S.current.login,
    //   formKey: formPhoneKey,
    //   hint: S.current.enterPhoneNumberOrEmail.tr,
    //   isLoading: controller.loadStatus.value == LoadStatus.loading,
    //   onChanged: controller.onChangeUsername,
    //   onButtonPressed: () {
    //     if (formPhoneKey.currentState?.validate() ?? false) {
    //       controller.signIn();
    //     }
    //   },
    //   validator: (v) {
    //     if (!GetUtils.isPhoneNumber(v ?? '') && !GetUtils.isEmail(v ?? '')) {
    //       return S.current.errorPhoneOrEmailIncorrect;
    //     }
    //     return null;
    //   },
    // );

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          S.current.login.text
              .size(24)
              .fontWeight(FontWeight.w600)
              .makeCentered(),
          40.heightBox,
          CustomTextField(
            initialValue: controller.username.value,
            hintText: S.current.username,
            validator: (v) {
              if (v.isEmptyOrNull) {
                return S.current.errorEmptyField;
              }
              return null;
            },
            onChanged: controller.onChangeUsername,
          ),
          20.heightBox,
          CustomTextField(
            initialValue: controller.password.value,
            hintText: S.current.password,
            validator: (v) {
              if (v.isEmptyOrNull) {
                return S.current.errorEmptyField;
              }
              return null;
            },
            onChanged: controller.onChangePass,
            obscureText: true,
          ),
          20.heightBox,
          PrimaryButton(
            text: S.current.login,
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                controller.signIn();
              }
            },
            isLoading: controller.loadStatus.value.isLoading,
          ),
          15.heightBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              20.heightBox,
              Obx(
                () => Get.find<AuthController>().canLocalAuth
                    ? Column(
                        children: [
                          20.heightBox,
                          Align(
                            alignment: Alignment.center,
                            child: CupertinoButton(
                              onPressed: controller.localAuth,
                              color: context.colorScheme.primary,
                              borderRadius: BorderRadius.circular(90),
                              padding: EdgeInsets.all(14),
                              minSize: 0,
                              child: SvgPicture.asset(
                                Assets.icons.faceId,
                                color: context.colorScheme.onPrimary,
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildOtp() {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          Image.asset(Assets.images.logo, fit: BoxFit.fitWidth),
          8.heightBox,
          S.current.enterOtp.text.align(TextAlign.center).makeCentered(),
          20.heightBox,
          PinCodeTextField(
            appContext: Get.context!,
            length: 4,
            animationType: AnimationType.fade,
            cursorColor: Colors.black,
            animationDuration: Duration(milliseconds: 300),
            keyboardType: TextInputType.number,
            onCompleted: (v) {
              controller.verifyOtp();
            },
            onChanged: controller.onChangeOtp,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(10),
              fieldHeight: 44,
              fieldWidth: 46,
              borderWidth: 1,
              activeFillColor: Colors.transparent,
              inactiveFillColor: Colors.transparent,
              inactiveColor: Color(0xff979BB5),
            ),
          ),
          30.heightBox,
          S.current.didNotReceiveOtp.tr.text
              .align(TextAlign.center)
              .makeCentered(),
          10.heightBox,
          InkWell(
            onTap: controller.resendOtp,
            child: S.current.resendOtp.text
                .color(Colors.red)
                .align(TextAlign.center)
                .makeCentered(),
          ),
          30.heightBox,
        ],
      ),
    );
  }
}
