import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/src/data/services/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockHttpClient extends Mock implements http.Client {}

/// https://flutter.dev/docs/cookbook/persistence/reading-writing-files#testing
Future<void> mockApplicationDocumentsDirectory() async {
  // Create a temporary directory.
  final directory = await Directory.systemTemp.createTemp();

  // Mock out the MethodChannel for the path_provider plugin.
  const MethodChannel('plugins.flutter.io/path_provider')
      .setMockMethodCallHandler((MethodCall methodCall) async {
    // If you're getting the apps documents directory, return the path to the
    // temp directory on the test environment instead.
    if (methodCall.method == 'getApplicationDocumentsDirectory') {
      return directory.path;
    }
    return null;
  });
}

void main() {
  late final GraphQlService client;

  WidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    await mockApplicationDocumentsDirectory();
    await initHiveForFlutter();
    client = GraphQlService(
      MemoryStorageService(),
      'https://fakeql.com/graphql/bb32f684c1acebafeb5ad04e9439fa3e',
      null,
      null,
      LogService(),
    );
  });

  test('Test graphql with sample query', () async {
    final res = await client.query(queryString: '''{
      user (id: 1) {
          id
          firstname
      }
    }''');
    expect(res['user'] != null, true);
    expect(res['user']['id'] == '1', true);
  });

  test('Test graphql with sample mutation', () async {
    final res = await client.mutate(queryString: '''mutation {
      updateUser (id: 1, input: { firstname: "Hien Pro" }) {
        id
        firstname
      }
    }''');
    expect(res['updateUser'] != null, true);
    expect(res['updateUser']['id'] == '1', true);
    expect(res['updateUser']['firstname'] == 'Hien Pro', true);
  });
}
