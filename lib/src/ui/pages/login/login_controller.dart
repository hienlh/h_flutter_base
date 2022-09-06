part of 'login_page.dart';

class LoginController extends GetxController {
  final auth = FirebaseAuth.instance;
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

  Future loginSns(SocialProvider socialProvider) async {
    AuthCredential authCredential;
    try {
      snsLoadStatus.value = LoadStatus.loading;
      switch (socialProvider) {
        case SocialProvider.google:
          // throw 'Error';
          authCredential = await _signInWithGoogle();
          break;
        case SocialProvider.apple:
          authCredential = await _signInWithApple();
          break;
        case SocialProvider.facebook:
          authCredential = await _signInWithFacebook();
      }
      await _onVerificationCompleted(authCredential);
      snsLoadStatus.value = LoadStatus.success;
    } catch (e) {
      snsLoadStatus.value = LoadStatus.failure;
      if (e.toString().isNotEmpty) {
        AppUtils.showError(e.toString());
      }
      rethrow;
    }
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

  Future _onVerificationCompleted(AuthCredential credential) async {
    try {
      await _authController.signIn(credential);
      _goToNextPage();
    } catch (e) {
      loadStatus.value = LoadStatus.failure;
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

  Future<AuthCredential> _signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn(
        scopes: ['profile', 'email'],
      ).signIn();
      final googleAuth = await googleUser?.authentication;
      if (googleAuth == null) throw '';

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? S.current.unknownError;
    } catch (e) {
      throw e.toString();
    } finally {
      GoogleSignIn().signOut();
    }
  }

  Future<AuthCredential> _signInWithFacebook() async {
    try {
      final loginResult = await FacebookAuth.instance.login(
        permissions: ['public_profile', 'email'],
        loginBehavior: LoginBehavior.nativeWithFallback,
      );
      assert(loginResult.accessToken != null, '');

      if (loginResult.accessToken == null) {
        throw '';
      }
      return FacebookAuthProvider.credential(loginResult.accessToken!.token);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? S.current.unknownError;
    } on AssertionError catch (e) {
      throw e.message ?? S.current.unknownError;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<AuthCredential> _signInWithApple() async {
    try {
      final rawNonce = _generateNonce();
      final nonce = _sha256ofString(rawNonce);

      final result = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final credential = OAuthProvider('apple.com').credential(
        idToken: result.identityToken,
        rawNonce: rawNonce,
      );
      return credential;
    } on SignInWithAppleAuthorizationException catch (e) {
      switch (e.code) {
        case AuthorizationErrorCode.canceled:
          throw '';
        case AuthorizationErrorCode.notHandled:
        case AuthorizationErrorCode.unknown:
          throw S.current.unknownError;
        default:
          throw e.message;
      }
    } on FirebaseAuthException catch (e) {
      throw e.message ?? S.current.unknownError;
    } catch (e) {
      throw e.toString();
    }
  }

  String _generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
