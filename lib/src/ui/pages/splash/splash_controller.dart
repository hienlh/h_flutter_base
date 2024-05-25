import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../controllers/controller.dart';
import '../../../controllers/system_controller.dart';
import '../../../routes/routes.dart';

class SplashController extends GetxController {
  Future startApp() async {
    await initControllers().then((_) {
      final system = Get.find<SystemController>();
      if (system.isMaintenance) {
        Get.offNamed(Routes.maintenance.p);
      } else {
        if (Get.find<AuthController>().isAuth) {
          Get.offNamed(Routes.main.p);
        } else {
          Get.offNamed(Routes.login.p);
        }
      }
    });
  }
}
