import 'package:flutter_base/src/base/app_config.dart';
import 'package:flutter_base/src/data/interfaces/storage_interface.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_base/src/constants/storage_key.dart';
import 'package:flutter_base/src/data/interfaces/http_interface.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

part 'get_http_service.dart';
part 'storage_services.dart';
part 'memory_storage_services.dart';

Future initServices() async {
  await Get.putAsync(() => StorageService().init());
  await Get.putAsync(() => GetHttpService().init(
        Get.find<StorageService>(),
        AppConfig.shared.apiUrl,
      ));
}