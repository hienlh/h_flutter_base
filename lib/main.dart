import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:sentry/sentry.dart';

import 'src/app.dart';
import 'src/base/app_config.dart';
import 'src/data/services/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppConfig(
    appName: 'Flutter Base',
    flavor: AppFlavor.PROD,
    apiUrl: 'https://hienlh.com/api',
    sentry: SentryClient(
      SentryOptions(
        dsn:
            'https://7bcd66b105624b7989e336259b625fb5@o494162.ingest.sentry.io/5711915',
      ),
    ),
  );
  
  await initServices();

  await runZonedGuarded<Future<void>>(() async {
    runApp(App());
  }, (error, stackTrace) {
    AppConfig.shared.sentry?.captureException(
      error,
      stackTrace: stackTrace,
    );
  });
}
