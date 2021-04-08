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
            'https://7bcd66b105624b7989e336259b625fb5@o494162.ingest.sentry.io/5711915',
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
