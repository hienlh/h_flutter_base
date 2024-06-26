import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/ui/styles/size.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart' hide VxContextExtensions;

import '../../../../generated/l10n.dart';
import '../../../data/models/responses/sign_in_phone_email.dart';
import '../../../utils/app_utils.dart';
import '../../styles/theme.dart';
import '../../widgets/app_bars/back_app_bar.dart';
import '../../widgets/common/primary_scaffold.dart';
import '../../widgets/pin_code/pin_code_fields.dart';

class OtpPageArgs<T> {
  final String phoneOrEmail;
  final Future<T> Function(String otp) onVerifyOtp;
  final DateTime? expireAt;
  final DateTime? allowReSendAt;
  final Future<SignInPhoneEmailRes> Function()? onResendOtp;
  final String? title;

  OtpPageArgs(
    this.phoneOrEmail,
    this.onVerifyOtp, {
    this.expireAt,
    this.allowReSendAt,
    this.onResendOtp,
    this.title,
  });
}

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

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

    timer = Timer.periodic(1.seconds, (timer) {
      setState(() {
        now = DateTime.now();
      });
      if (expireAt != null && now.isAfter(expireAt!)) {
        setState(() {
          isExpired = true;
        });
        AppUtils.showError(S.current.errorOtpIsExpired);
        timer.cancel();
      }
    });
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
      appBar: BackAppBar(
        title: args?.title ??
            '${S.current.confirm} ${(phoneOrEmail.isEmail ? S.current.email.tr : S.current.phoneNumber).toLowerCase()}',
      ),
      backgroundColor: context.theme.colorScheme.surface,
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            '${S.current.sentOtpTo} $phoneOrEmail'
                .text
                .size(16)
                .align(TextAlign.center)
                .makeCentered(),
            24.heightBox,
            PinCodeTextField(
              appContext: Get.context!,
              length: 6,
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

                onVerifyOtp?.call(otp).whenComplete(() {
                  setState(() {
                    isLoading = false;
                  });
                });
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
                selectedColor: context.theme.colorScheme.primary,
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
                    fontSize: HTextSize.hNormal,
                    color: HTheme.d.textColor,
                  ),
                  children: [
                    TextSpan(text: '${S.current.dontReceiveOtp} '),
                    TextSpan(
                      text: now.isAfter(allowReSendAt!)
                          ? S.current.resendOtp
                          : '${S.current.resendOtpAfter} ${allowReSendAt!.difference(now).inSeconds}s',
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
