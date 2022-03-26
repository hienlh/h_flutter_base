import 'package:get/get.dart';

import '../providers/api_client.dart';
import '../services/services.dart';
import 'user_repository.dart';

Future initRepos() async {
  Get.put(ApiClient(
    Get.find<GetHttpService>(),
    Get.find<GraphQlService>(),
    Get.find<StorageService>(),
    () async {
      throw UnimplementedError();
    },
  ));
  Get.put(UserRepository(Get.find()));
}
