import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_base/src/base/app_config.dart';
import 'package:flutter_base/src/data/interfaces/connectivity_interface.dart';
import 'package:flutter_base/src/data/interfaces/graphql_interface.dart';
import 'package:flutter_base/src/data/interfaces/logger_interface.dart';
import 'package:flutter_base/src/data/interfaces/storage_interface.dart';
import 'package:flutter_base/src/exceptions/exceptions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_base/src/constants/storage_key.dart';
import 'package:flutter_base/src/data/interfaces/http_interface.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:graphql_flutter/graphql_flutter.dart' hide UnknownException;
import 'package:logger/logger.dart';
import 'package:pedantic/pedantic.dart';
import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;
import 'package:sentry/sentry.dart';

part 'get_http_service.dart';
part 'storage_service.dart';
part 'memory_storage_service.dart';
part 'connectivity_service.dart';
part 'graphql_service.dart';
part 'log_service.dart';

Future initServices() async {
  Get.put(LogService());
  Get.put(ConnectivityService());
  await Get.putAsync(() => StorageService().init());
  await Get.putAsync(
    () => GetHttpService().init(
      Get.find<StorageService>(),
      AppConfig.shared.apiUrl,
      Get.find<ConnectivityService>(),
    ),
  );
  await Get.putAsync(
    () => GraphQlService().init(
      Get.find<StorageService>(),
      AppConfig.shared.apiUrl,
    ),
  );
}
