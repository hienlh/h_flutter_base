import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sentry/sentry.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'src/app.dart';
import 'src/base/app_config.dart';
import 'src/controllers/controllers.dart';
import 'src/data/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  print('=======> Env: ${dotenv.env}');

  final apiUrl = dotenv.get('API_URL', fallback: 'https://hienlh.com');
  final sentryDsn = dotenv.get('SENTRY_DSN', fallback: '');

  AppConfig(
    appName: 'Trí Hải',
    flavor: AppFlavor.prod,
    apiUrl: apiUrl,
    sentry: sentryDsn.isNotEmpty
        ? SentryClient(SentryOptions(dsn: sentryDsn))
        : null,
  );

  await initHiveForFlutter();
  await initServices();
  await initControllers();

  await runZonedGuarded<Future<void>>(() async {
    runApp(App());
  }, (error, stackTrace) {
    AppConfig.shared.sentry?.captureException(
      error,
      stackTrace: stackTrace,
    );
  });
}
