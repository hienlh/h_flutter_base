import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:local_auth/local_auth.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../generated/l10n.dart';
import '../constants/storage_key.dart';
import '../data/interfaces/logger_interface.dart';
import '../data/interfaces/notification_interface.dart';
import '../data/interfaces/storage_interface.dart';
import '../data/models/entities/user_entity.dart';
import '../data/models/enums/load_status.dart';
import '../data/repositories/user_repository.dart';
import '../exceptions/exceptions.dart';
import '../routes/routes.dart';
import '../utils/app_utils.dart';

const kEnableBiometric = false;

class AuthController extends GetxController {
  final IStorage _storage;
  final ILogger _log;
  final UserRepository _userRepo;
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  final NotificationInterface? _notificationService;

  AuthController(
    this._storage,
    this._log,
    this._userRepo, [
    this._notificationService,
  ]);

  Future<AuthController> init() async {
    try {
      await _setToken(await _storage.get<String>(StorageKey.token));
    } catch (e) {
      await _setToken(null);
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

  bool get canLocalAuth =>
      kEnableBiometric && isBiometricSupported && !token.isEmptyOrNull;

  final _isLocalAuth = Rx(false);
  bool get isAuth =>
      !token.isEmptyOrNull &&
      currentUser != null &&
      (canLocalAuth && _isLocalAuth.value || !canLocalAuth);

  Stream<String?> onTokenChange() => _token.stream;

  Future<bool> requireLoginAction({bool throwError = true}) async {
    if (!isAuth) {
      await Get.toNamed(Routes.login.p);
      if (!isAuth) {
        throw UnauthenticatedException();
      }
    }
    return isAuth;
  }

  Future verifyOtp(String phoneOrEmail, String otp) async {
    try {
      final signInRes = await _userRepo.verifyOtp(phoneOrEmail, otp);
      await _setToken(signInRes.jwt);
      update();
    } catch (e) {
      AppUtils.showError(e);
      rethrow;
    }
  }

  Future logout() async {
    await _setToken(null);
    update();
    Get.offAllNamed(Routes.main.p);
    _notificationService?.onLogout();
  }

  Future fetchCurrentUserProfile() async {
    if (loadUserStatus == LoadStatus.loading) return;

    try {
      _loadUserStatus.value = LoadStatus.loading;

      await loadLocalProfile();
      if (currentUser == null) {
        await loadRemoteProfile();
      } else {
        loadRemoteProfile();
      }

      if (currentUser != null) {
        _unreadNotiCount.value = await _userRepo.getCountNoti();
        _notificationService?.onLogin(currentUser!.id);
      }

      _loadUserStatus.value = LoadStatus.success;
    } catch (e) {
      _loadUserStatus.value = LoadStatus.failure;
      rethrow;
    }
  }

  Future<bool> loadLocalProfile() async {
    try {
      final localProfileJson = await _storage.get<String>(StorageKey.profile);
      if (localProfileJson?.isNotEmpty == true) {
        _currentUser.value = UserEntity.fromJson(jsonDecode(localProfileJson!));
        debugPrint('Loaded local profile.');
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> loadRemoteProfile() async {
    _currentUser.value = await _userRepo.getMe();

    if (_currentUser.value != null) {
      _storage.set<String>(
        StorageKey.profile,
        jsonEncode(_currentUser.value!.toJson()),
      );
    }
    return true;
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

      _isLocalAuth.value = isAuth;
      return isAuth;
    }
    return false;
  }

  Future deleteAccount() async {
    try {
      await _userRepo.deleteAccount();
      logout();
      AppUtils.showSuccess(S.current.deleteAccountSuccess);
    } catch (e) {
      AppUtils.showError(e);
      rethrow;
    }
  }
}
