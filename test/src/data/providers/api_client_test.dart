import 'package:flutter/material.dart';
import 'package:trihai_admin_app/src/data/providers/api_client.dart';
import 'package:trihai_admin_app/src/data/services/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = MemoryStorageService();
  final http = await GetHttpService().init(
    storage,
    'https://vietwash.topnguyen.com',
  );
  final graphql = GraphQlService(
    storage,
    'https://vietwash.topnguyen.com',
  );

  final apiClient = ApiClient(http, graphql, storage);

  group('Test api about User:', () {
    test('check something', () async {
      print("Test something");
      apiClient.checkToken();
    });
  });
}
