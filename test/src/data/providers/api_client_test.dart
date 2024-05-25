import 'package:flutter/material.dart';
import 'package:flutter_base/src/data/interfaces/graphql_interface.dart';
import 'package:flutter_base/src/data/providers/api_client.dart';
import 'package:flutter_base/src/data/services/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = MemoryStorageService();
  final http = await GetHttpService().init(
    storage,
    'https://hienle.tech/api',
  );
  final graphql = FakeGraphQlClient();

  final apiClient = ApiClient(http, graphql, storage);

  group('Test api about User:', () {
    test('check something', () async {
      print("Test something");
      apiClient.checkToken();
    });
  });
}
