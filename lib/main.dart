import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:sentry/sentry.dart';

import 'src/app.dart';
import 'src/base/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var configuredApp = AppConfig(
    appName: 'Flutter Base',
    flavorName: AppFlavor.PRODUCTION,
    apiUrl: 'https://hienlh.com/api',
    sentry: SentryClient(
      SentryOptions(
        dsn:
            'https://22054fae83f14f0180e198172b3a4e9c@o494162.ingest.sentry.io/5564533',
      ),
    ),
    child: App(),
  );

  await runZonedGuarded<Future<void>>(() async {
    runApp(configuredApp);
  }, (error, stackTrace) {
    configuredApp.sentry?.captureException(
      error,
      stackTrace: stackTrace,
    );
  });
}
