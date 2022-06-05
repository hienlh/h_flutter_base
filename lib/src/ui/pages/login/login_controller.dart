part of 'login_page.dart';

enum LoginPageType { phoneNumber, otp }

class LoginController extends GetxController {
  final AuthController _authController;
  final UserRepository _userRepo;
  final ILogger _log;
  final Routing? nextPage;
  LoginController(this._log, this._authController, this._userRepo,
      {this.nextPage});

  final loadStatus = Rx(LoadStatus.initial);
  final snsLoadStatus = Rx(LoadStatus.initial);

  final currentPage = Rx(LoginPageType.phoneNumber);
  final recaptchaToken = ''.obs;
  final sessionInfo = ''.obs;
  final forceResendingToken = Rx<int?>(null);
  final verificationId = Rx<String?>(null);
  final isFirstLogin = false.obs;

  final phoneNumberOrEmail = (kReleaseMode ? '' : 'hienlh1298@gmail.com').obs;
  final name = ''.obs;
  final otp = ''.obs;

  void onBack() {
    if (currentPage.value == LoginPageType.otp) {
      currentPage.value = LoginPageType.phoneNumber;
    }
  }

  void onChangePhoneOrEmail(String phone) {
    phoneNumberOrEmail.value = phone;
  }

  void onChangeName(String nameInput) {
    name.value = nameInput;
  }

  void onChangeOtp(String otpInput) {
    otp.value = otpInput;
  }

  Future signInPhoneOrEmail() async {
    try {
      await _sendVerificationCode();
    } catch (e) {
      loadStatus.value = LoadStatus.failure;
      AppUtils.showError(e.toString());
      rethrow;
    }
  }

  Future verifyOtp() async {
    try {
      loadStatus.value = LoadStatus.loading;
      await _authController.verifyOtp(phoneNumberOrEmail.value, otp.value);
      loadStatus.value = LoadStatus.success;
      _goToNextPage();
    } catch (e) {
      loadStatus.value = LoadStatus.failure;
      AppUtils.showError(e.toString());
      rethrow;
    }
  }

  Future resendOtp() async {
    otp.value = '';
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

      Get.rawSnackbar(message: S.current.sendingOtp.tr);
      _log('Sending verification code to $phoneOrEmail');
      final otpInfo = await _userRepo.signInPhoneOrEmail(phoneOrEmail);
      // currentPage.value = LoginPageType.otp;
      await Get.toNamed(
        Routes.otp,
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
      Get.offAllNamed(Routes.main);
    }
  }
}
