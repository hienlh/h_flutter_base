import 'package:get/get.dart';

import '../routes.dart';
import 'auth_controller.dart';

class SystemController extends GetxController {
  final AuthController _authController;
  SystemController(this._authController);

  Future init() async {
    Get.offAllNamed(_authController.isAuth ? Routes.main : Routes.login);
  }
}
