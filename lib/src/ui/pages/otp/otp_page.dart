import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trihai_admin_app/src/base/extensions/context_ext.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../generated/l10n.dart';
import '../../../data/models/responses/sign_in_phone_email.dart';
import '../../widgets/app_bars/back_app_bar.dart';
import '../../widgets/common/primary_scaffold.dart';
import '../../widgets/pin_code/pin_code_fields.dart';

class OtpPageArgs<T> {
  final String phoneOrEmail;
  final Future<T> Function(String otp) onVerifyOtp;
  final DateTime? expireAt;
  final DateTime? allowReSendAt;
  final Future<SignInPhoneEmailRes> Function()? onResendOtp;

  OtpPageArgs(
    this.phoneOrEmail,
    this.onVerifyOtp, {
    this.expireAt,
    this.allowReSendAt,
    this.onResendOtp,
  });
}

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  bool isLoading = false;
  String otp = "";
  DateTime now = DateTime.now();
  Timer? timer;
  bool isExpired = false;
  DateTime? allowReSendAt;
  DateTime? expireAt;

  @override
  void initState() {
    super.initState();

    final OtpPageArgs? args =
        Get.arguments is OtpPageArgs ? Get.arguments : null;
    expireAt = args?.expireAt;
    allowReSendAt = args?.allowReSendAt;

    // timer = Timer.periodic(1.seconds, (timer) {
    //   setState(() {
    //     now = DateTime.now();
    //   });
    //   if (expireAt != null && now.isAfter(expireAt!)) {
    //     setState(() {
    //       isExpired = true;
    //     });
    //     AppUtils.showError(Strings.errorOtpIsExpired.tr);
    //   }
    // });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final OtpPageArgs? args =
        Get.arguments is OtpPageArgs ? Get.arguments : null;
    final phoneOrEmail = args?.phoneOrEmail ?? '';
    final onVerifyOtp = args?.onVerifyOtp;
    final onResendOtp = args?.onResendOtp;

    return PrimaryScaffold(
      isLoading: isLoading,
      appBar: BackAppBar(
        title:
            '${S.current.confirm} ${(phoneOrEmail.isEmail ? S.current.email : S.current.phoneNumber).toLowerCase()}',
      ),
      backgroundColor: context.colorScheme.surface,
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            '${S.current.sentOtpTo.tr} $phoneOrEmail'
                .text
                .size(16)
                .align(TextAlign.center)
                .makeCentered(),
            24.heightBox,
            PinCodeTextField(
              appContext: Get.context!,
              length: 4,
              animationType: AnimationType.fade,
              cursorColor: Colors.black,
              autoFocus: true,
              mainAxisAlignment: WrapAlignment.center,
              animationDuration: Duration(milliseconds: 300),
              keyboardType: TextInputType.number,
              onCompleted: (v) {
                setState(() {
                  isLoading = true;
                });

                onVerifyOtp?.call(otp).whenComplete(() => setState(() {
                      isLoading = false;
                    }));
              },
              onChanged: (v) {
                otp = v;
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(90),
                fieldHeight: 44,
                fieldWidth: 46,
                borderWidth: 1,
                selectedColor: context.colorScheme.primary,
                activeFillColor: Colors.transparent,
                inactiveFillColor: Colors.transparent,
                inactiveColor: Color(0xff979BB5),
              ),
            ),
            10.heightBox,
            if (allowReSendAt != null && onResendOtp != null)
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    color: context.colorScheme.onBackground,
                  ),
                  children: [
                    TextSpan(text: '${S.current.doNotReceiveOtp.tr} '),
                    TextSpan(
                      text: now.isAfter(allowReSendAt!)
                          ? S.current.resendOtp.tr
                          : '${S.current.resendOtpAfter.tr} ${allowReSendAt!.difference(now).inSeconds}s',
                      style: TextStyle(color: Colors.red),
                      recognizer: TapGestureRecognizer()
                        ..onTap = now.isAfter(allowReSendAt!)
                            ? () {
                                isLoading = true;
                                setState(() {});

                                onResendOtp()
                                    .then((value) => setState(() {
                                          expireAt = value.expireAt;
                                          isExpired = expireAt != null &&
                                              now.isAfter(expireAt!);
                                          allowReSendAt = value
                                              .nextTimeAllowSendOtp
                                              ?.add(10.seconds);
                                        }))
                                    .whenComplete(() {
                                  isLoading = false;
                                  setState(() {});
                                });
                              }
                            : null,
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
