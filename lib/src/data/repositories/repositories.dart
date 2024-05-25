import 'package:get/get.dart';

import '../interfaces/graphql_interface.dart';
import '../providers/api_client.dart';
import '../services/services.dart';
import 'system_repository.dart';
import 'user_repository.dart';

Future initRepos() async {
  Get.put(ApiClient(
    Get.find<GetHttpService>(),
    Get.find<FakeGraphQlClient>(),
    Get.find<StorageService>(),
    () async {
      throw UnimplementedError();
    },
  ));
  Get.put(SystemRepository());
  Get.put(UserRepository(Get.find()));
}
