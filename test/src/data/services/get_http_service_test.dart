import 'package:flutter/material.dart';
import 'package:flutter_base/src/data/interfaces/connectivity_interface.dart';
import 'package:flutter_base/src/data/providers/api_client.dart';
import 'package:flutter_base/src/data/services/index.dart';
import 'package:flutter_base/src/exceptions/exceptions.dart';
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

  test('Throw no network connection', () async {
    final http = await GetHttpService().init(
      MemoryStorageService(),
      '',
      TestFalseConnectivity(),
    );
    final apiClient = ApiClient(http);
    try {
      await apiClient.getExternalIp();
    } catch (e) {
      expect(e is NoNetworkConnectionException, true);
    }
  });

  test('Test cache data in GetHttpService', () async {
    final storage = MemoryStorageService();
    var http = await GetHttpService().init(storage, '', TestTrueConnectivity());
    var apiClient = ApiClient(http);
    final res = await apiClient.getExternalIp();

    http = await GetHttpService().init(storage, '', TestFalseConnectivity());
    apiClient = ApiClient(http);
    final resFromCache = await apiClient.getExternalIp();
    expect(res, resFromCache);
  });
}
