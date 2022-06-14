import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sentry/sentry.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'src/app.dart';
import 'src/base/app_config.dart';
import 'src/data/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "dev.env");
  print('=======> Env: ${dotenv.env}');

  AppConfig(
    appName: 'Hienlh Flutter dev',
    flavor: AppFlavor.dev,
    apiUrl: 'https://hienlh.com/api',
    sentry: SentryClient(
      SentryOptions(
        dsn:
            'https://7bcd66b105624b7989e336259b625fb5@o494162.ingest.sentry.io/5711915',
      ),
    ),
  );

  await initHiveForFlutter();
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
