import 'package:get/get.dart';

import '../data/repositories/system_repository.dart';
import '../models/app_configs_model.dart';

class SystemController extends GetxController {
  final SystemRepository repository;
  SystemController(this.repository);

  final _appConfigs = <AppConfigModel>[].obs;

  bool get isMaintenance =>
      _appConfigs
          .firstWhereOrNull((element) => element.type == 'IS_MAINTENANCE')
          ?.value ??
      false;

  Future init() async {
    await Future.wait([
      _loadAppConfigs(),
    ]);
  }

  Future _loadAppConfigs() async {
    // _appConfigs.value = await repository.getAppConfigs();
    // TODO: Uncomment the line above and remove the line below
  }
}
