class Env {
  static const String appName = String.fromEnvironment(
    'APP_NAME',
    defaultValue: 'Hienlh Flutter',
  );

  static const String packageNameSuffix =
      String.fromEnvironment('PACKAGE_NAME_SUFFIX');

  /// possible values: staging, production. defaults to production
  static Flavor flavor = Flavor.values.byName(const String.fromEnvironment(
    'FLAVOR',
    defaultValue: 'production',
  ));

  static const String apiUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'https://hienlh.com/api/v1/',
  );
}

enum Flavor { staging, production }
