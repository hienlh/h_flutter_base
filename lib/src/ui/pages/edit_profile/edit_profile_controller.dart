import 'dart:io';

import 'package:get/get.dart';

import '../../../../generated/l10n.dart';
import '../../../controllers/auth_controller.dart';
import '../../../data/models/entities/user_entity.dart';
import '../../../data/models/enums/load_status.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../utils/app_utils.dart';

class EditProfileController extends GetxController {
  final UserRepository _userRepo;
  final AuthController _authController;

  EditProfileController(this._userRepo, this._authController)
      : _currentUser = Rx<UserEntity?>(_authController.currentUser) {
    _authController.addListener(() {
      _currentUser.value = _authController.currentUser;
    });
  }

  late final Rx<UserEntity?> _currentUser;
  UserEntity? get currentUser => _currentUser.value;

  final _isUploading = false.obs;
  bool get isUploading => _isUploading.value;

  final _percent = Rx<double>(0);
  double get percent => _percent.value;

  final loadStatus = LoadStatus.initial.obs;
  final uploadAvatarStatus = LoadStatus.initial.obs;

  void changeValue({
    String? fullName,
    DateTime? dateOfBirth,
    String? address,
    String? phone,
    String? email,
  }) {
    _currentUser.value = currentUser?.copyWith(
      fullName: fullName ?? currentUser!.fullName,
      dateOfBirth: dateOfBirth ?? currentUser!.dateOfBirth,
      address: address ?? currentUser!.address,
      phone: phone ?? currentUser!.phone,
      email: email ?? currentUser!.email,
    );
  }

  Future uploadAvatar(File file) async {
    try {
      uploadAvatarStatus.value = LoadStatus.loading;
      final res = await _userRepo.uploadAvatar(file);
      _currentUser.value = currentUser?.copyWith(avatarUrl: res.fileUrl);
      uploadAvatarStatus.value = LoadStatus.success;
    } catch (e) {
      uploadAvatarStatus.value = LoadStatus.failure;
      AppUtils.showError(e);
      rethrow;
    }
  }

  Future save() async {
    try {
      if (currentUser == null) return;
      loadStatus.value = LoadStatus.loading;

      await _userRepo.updateProfile(currentUser!);
      await _authController.fetchCurrentUserProfile();
      loadStatus.value = LoadStatus.success;
      AppUtils.showSuccess(S.current.success);
    } catch (e) {
      loadStatus.value = LoadStatus.failure;
      AppUtils.showError(e);
      rethrow;
    }
  }
}
