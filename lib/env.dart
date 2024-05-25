import 'src/exceptions/exception_handler.dart';

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

  final _apiUrl = const String.fromEnvironment(
    'API_URL',
    defaultValue: 'https://hienle.tech/api/v1/',
  );
  String get apiUrl => _apiUrl;

  final _isMaintaining = false;
  bool get isMaintaining => _isMaintaining;

  final _maintainingData = <String, dynamic>{};
  Map<String, dynamic> get maintainingData => _maintainingData;

  Future getRemoteConfig() async {
    try {
      // TODO: fetch remote config from server
    } catch (e, stack) {
      ExceptionHandler.instance.captureException(e, stackTrace: stack);
    }
  }
}

enum Flavor { staging, production }
