import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart' hide UnknownException;
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../env.dart';
import '../../constants/storage_key.dart';
import '../../exceptions/exceptions.dart';
import '../interfaces/connectivity_interface.dart';
import '../interfaces/graphql_interface.dart';
import '../interfaces/http_interface.dart';
import '../interfaces/logger_interface.dart';
import '../interfaces/storage_interface.dart';
import '../repositories/repositories.dart';

part 'connectivity_service.dart';
part 'get_http_service.dart';
part 'graphql_service.dart';
part 'log_service.dart';
part 'memory_storage_service.dart';
part 'storage_service.dart';

Future initServices() async {
  Get.put(LogService());
  Get.put(ConnectivityService());
  await Get.putAsync(() => StorageService().init());
  await Get.putAsync(
    () => GetHttpService().init(
      Get.find<StorageService>(),
      Env.apiUrl,
      Get.find<ConnectivityService>(),
    ),
  );
  Get.put(GraphQlService(
    Get.find<StorageService>(),
    '${Env.apiUrl}/graphql',
    null,
    null,
    Get.find<LogService>(),
  ));

  await initRepos();
}
