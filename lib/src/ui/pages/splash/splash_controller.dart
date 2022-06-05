import 'package:get/get.dart';

import '../../../controllers/system_controller.dart';

class SplashController extends GetxController {
  Future startApp() async {
    await Get.find<SystemController>().init();
  }
}
