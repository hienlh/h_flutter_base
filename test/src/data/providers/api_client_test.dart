import 'package:flutter/material.dart';
import 'package:flutter_base/src/data/providers/api_client.dart';
import 'package:flutter_base/src/data/services/index.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final http = await GetHttpService().init(
    MemoryStorageService(),
    'https://coviland.com'
  );
  final apiClient = ApiClient(http);

  group('Test api about User:', () {
    test('check user phone number', () async {
      final res = await apiClient.checkUserPhone('0971963777');
      expect(res.data.phone, '0971963777');
    });
  });
}
