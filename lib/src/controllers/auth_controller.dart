import 'dart:async';

import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:local_auth/local_auth.dart';
import 'package:trihai_admin_app/src/utils/app_utils.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/storage_key.dart';
import '../data/interfaces/logger_interface.dart';
import '../data/interfaces/storage_interface.dart';
import '../data/models/entities/user_entity.dart';
import '../data/models/enums/load_status.dart';
import '../data/repositories/user_repository.dart';
import '../exceptions/exceptions.dart';
import '../routes.dart';

class AuthController extends GetxController {
  final IStorage _storage;
  final ILogger _log;
  final UserRepository _userRepo;
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  AuthController(this._storage, this._log, this._userRepo);

  Future<AuthController> init() async {
    try {
      await _setToken(await _storage.get<String?>(StorageKey.token));
    } catch (e) {
      await logout();
    }

    _localAuthentication
        .isDeviceSupported()
        .then((value) => _isBiometricSupported.value = value);

    return this;
  }

  final _token = Rx<String?>(null);
  String? get token => _token.value;
  Future _setToken(String? value) async {
    if (_token.value == value) return;

    _log('User changed token: $value');
    _token.value = value;
    if (value == null || JwtDecoder.isExpired(value)) {
      await _storage.delete(StorageKey.token);
      _currentUser.value = null;
    } else {
      await _storage.set<String>(StorageKey.token, value);
      await fetchCurrentUserProfile();
    }
  }

  final _currentUser = Rx<UserEntity?>(null);
  UserEntity? get currentUser => _currentUser.value;

  final _unreadNotiCount = 0.obs;
  int get unreadNotiCount => currentUser != null ? _unreadNotiCount.value : 0;

  final _loadUserStatus = Rx<LoadStatus>(LoadStatus.initial);
  LoadStatus get loadUserStatus => _loadUserStatus.value;

  final _isBiometricSupported = Rx(false);
  bool get isBiometricSupported => _isBiometricSupported.value;

  bool get canLocalAuth => isBiometricSupported && !token.isEmptyOrNull;

  bool get isAuth => !token.isEmptyOrNull && currentUser != null;

  Stream<String?> onTokenChange() => _token.stream;

  Future<bool> requireLoginAction({bool throwError = true}) async {
    if (!isAuth) {
      await Get.toNamed(Routes.login);
      if (!isAuth) {
        throw UnauthenticatedException();
      }
    }
    return isAuth;
  }

  Future signIn(String accessToken) async {
    try {
      if (!accessToken.isEmptyOrNull) {
        await _setToken(accessToken);
        update();
      }
    } catch (e) {
      AppUtils.showError(e);
      rethrow;
    }
  }

  Future verifyOtp(String phoneOrEmail, String otp) async {
    final signInRes = await _userRepo.verifyOtp(phoneOrEmail, otp);
    await _setToken(signInRes.accessToken);
    update();
  }

  Future logout() async {
    await _setToken(null);
    update();
    Get.offAllNamed(Routes.login);
  }

  Future fetchCurrentUserProfile() async {
    if (loadUserStatus == LoadStatus.loading) return;

    try {
      _loadUserStatus.value = LoadStatus.loading;
      _currentUser.value = await _userRepo.getMe();
      if (currentUser != null) {
        // TODO: load unread notifications
      }
      _loadUserStatus.value = LoadStatus.success;
      _log('Fetched current user profile ${currentUser?.id}');
    } catch (e) {
      _loadUserStatus.value = LoadStatus.failure;
      rethrow;
    }
  }

  Future<bool> canFaceId() async {
    List<BiometricType> availableBiometrics =
        await _localAuthentication.getAvailableBiometrics();
    return canLocalAuth && availableBiometrics.contains(BiometricType.face);
  }

  Future<bool> localAuth({String? reason}) async {
    if (canLocalAuth) {
      List<BiometricType> availableBiometrics =
          await _localAuthentication.getAvailableBiometrics();

      final isAuth = await _localAuthentication.authenticate(
        localizedReason: reason ?? 'Please complete the biometrics to proceed.',
        options: AuthenticationOptions(
          biometricOnly: availableBiometrics.isNotEmpty,
        ),
      );

      return isAuth;
    }
    return false;
  }
}
