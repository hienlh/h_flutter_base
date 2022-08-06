import 'package:get/get.dart';

import 'system_controller.dart';

Future initControllers() async {
  Get.put(SystemController(Get.find()), permanent: true);
}
