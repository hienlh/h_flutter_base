import 'dart:convert';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class Env {
  // singleton instance of the Env class
  static final Env _env = Env._internal();

  // private constructor
  Env._internal();

  // factory constructor
  factory Env() => _env;

  final appName = const String.fromEnvironment(
    'APP_NAME',
    defaultValue: 'Hienlh Flutter',
  );

  final flavor = Flavor.values.byName(const String.fromEnvironment(
    'FLAVOR',
    defaultValue: 'production',
  ));

  var _apiUrl = const String.fromEnvironment(
    'API_URL',
    defaultValue: 'https://hienlh.com/api/v1/',
  );
  String get apiUrl => _apiUrl;

  var _isMaintaining = false;
  bool get isMaintaining => _isMaintaining;

  var _maintainingData = <String, dynamic>{};
  Map<String, dynamic> get maintainingData => _maintainingData;

  Future getRemoteConfig() async {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.setDefaults(<String, dynamic>{
        'API_URL': _apiUrl,
        'IS_MAINTAINING': false,
      });
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: flavor == Flavor.staging
            ? const Duration(minutes: 1)
            : const Duration(hours: 1),
      ));
      await remoteConfig.fetchAndActivate();

      _apiUrl = remoteConfig.getString('API_URL');
      _isMaintaining = remoteConfig.getBool('IS_MAINTAINING');
      _maintainingData = jsonDecode(remoteConfig.getString('MAINTAINING_DATA'));

      print('Remote config: ${remoteConfig.getAll().map(
            (key, value) => MapEntry(key, value.asString()),
          )}');
    } catch (e, stack) {
      FirebaseCrashlytics.instance.recordError(e, stack);
    }
  }
}

enum Flavor { staging, production }
