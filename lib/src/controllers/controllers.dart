import 'package:get/get.dart';

import '../data/services/services.dart';
import 'auth_controller.dart';
import 'system_controller.dart';

Future initControllers() async {
  await Get.putAsync(
    () => AuthController(
      Get.find<StorageService>(),
      Get.find<LogService>(),
      Get.find(),
    ).init(),
    permanent: true,
  );
  Get.put(SystemController(Get.find()), permanent: true);
}
