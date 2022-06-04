import 'package:flutter/material.dart';
import 'package:trihai_admin_app/src/data/interfaces/connectivity_interface.dart';
import 'package:trihai_admin_app/src/data/providers/api_client.dart';
import 'package:trihai_admin_app/src/data/services/services.dart';
import 'package:trihai_admin_app/src/exceptions/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';

class TestFalseConnectivity implements IConnectivity {
  @override
  Future<bool> checkConnected() async {
    return false;
  }
}

class TestTrueConnectivity implements IConnectivity {
  @override
  Future<bool> checkConnected() async {
    return true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final graphql = GraphQlService(MemoryStorageService(), '');

  test('Throw no network connection', () async {
    final storage = MemoryStorageService();
    final http = await GetHttpService().init(
      storage,
      '',
      TestFalseConnectivity(),
    );
    final apiClient = ApiClient(http, graphql, storage);
    try {
      await apiClient.getExternalIp();
    } catch (e) {
      expect(e is NoNetworkConnectionException, true);
    }
  });

  test('Test cache data in GetHttpService', () async {
    final storage = MemoryStorageService();
    var http = await GetHttpService().init(storage, '', TestTrueConnectivity());
    var apiClient = ApiClient(http, graphql, storage);
    final res = await apiClient.getExternalIp();

    http = await GetHttpService().init(storage, '', TestFalseConnectivity());
    apiClient = ApiClient(http, graphql, storage);
    final resFromCache = await apiClient.getExternalIp();
    expect(res, resFromCache);
  });
}