import 'package:get/get.dart';

import '../../../../env.dart';
import '../../../controllers/system_controller.dart';
import '../../../routes.dart';

class SplashController extends GetxController {
  Future startApp() async {
    await Get.find<SystemController>().init().whenComplete(() {
      Get.offNamed(Env().isMaintaining ? Routes.maintenance : Routes.main);
    });
  }
}
