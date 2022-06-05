import 'package:get/get.dart';
import 'package:trihai_admin_app/src/data/repositories/user_repository.dart';
import 'package:trihai_admin_app/src/utils/app_utils.dart';

import '../../../data/models/enums/load_status.dart';

class ChangePassController extends GetxController {
  final UserRepository _userRepo;
  ChangePassController(this._userRepo);

  final _oldPass = ''.obs;
  set oldPass(String value) => _oldPass.value = value;
  String get oldPass => _oldPass.value;

  final _newPass = ''.obs;
  set newPass(String value) => _newPass.value = value;
  String get newPass => _newPass.value;

  final loadStatus = LoadStatus.initial.obs;

  Future save() async {
    try {
      loadStatus.value = LoadStatus.loading;
      await _userRepo.changePassword(oldPass, newPass);
      Get.back();
      loadStatus.value = LoadStatus.success;
    } catch (e) {
      loadStatus.value = LoadStatus.failure;
      AppUtils.showError(e);
      rethrow;
    }
  }
}
