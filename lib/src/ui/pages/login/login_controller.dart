part of 'login_page.dart';

class LoginController extends GetxController {
  final AuthController _authController;
  final UserRepository _userRepo;
  final ILogger _log;
  final Routing? nextPage;
  LoginController(this._log, this._authController, this._userRepo,
      {this.nextPage});

  final loadStatus = Rx(LoadStatus.initial);
  final snsLoadStatus = Rx(LoadStatus.initial);

  final recaptchaToken = ''.obs;
  final sessionInfo = ''.obs;
  final forceResendingToken = Rx<int?>(null);
  final verificationId = Rx<String?>(null);
  final isFirstLogin = false.obs;

  // Nhập từ UI
  final phoneNumberOrEmail = (kReleaseMode ? '' : 'hienlh1298@gmail.com').obs;

  void onChangePhoneOrEmail(String phone) {
    phoneNumberOrEmail.value = phone;
  }

  Future signInPhoneOrEmail() async {
    await _sendVerificationCode();
  }

  Future localAuth() async {
    if (await _authController.localAuth()) {
      _goToNextPage();
    }
  }

  Future _sendVerificationCode() async {
    try {
      loadStatus.value = LoadStatus.loading;
      final phoneOrEmail = phoneNumberOrEmail.value;

      AppUtils.showMessage(S.current.sendingOtp);
      _log('Sending verification code to $phoneOrEmail');
      final otpInfo = await _userRepo.signInPhoneOrEmail(phoneOrEmail);
      await Get.toNamed(
        Routes.otp.p,
        arguments: OtpPageArgs(
          phoneOrEmail,
          (otp) async {
            await _authController.verifyOtp(phoneOrEmail, otp);
            Get.back();
            _goToNextPage();
          },
          allowReSendAt: otpInfo.nextTimeAllowSendOtp?.add(10.seconds),
          expireAt: otpInfo.expireAt,
          onResendOtp: () {
            return _userRepo.signInPhoneOrEmail(phoneOrEmail);
          },
        ),
      );
      loadStatus.value = LoadStatus.success;
    } catch (e) {
      loadStatus.value = LoadStatus.failure;
      AppUtils.showError(e.toString());
      rethrow;
    }
  }

  void _goToNextPage() {
    if (nextPage != null) {
      Get.offNamed(nextPage!.current, arguments: nextPage!.args);
    } else if (Navigator.canPop(Get.context!)) {
      Get.back();
    } else {
      Get.offAllNamed(Routes.main.p);
    }
  }
}
