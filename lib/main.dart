import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'env.dart';
import 'firebase_options.dart';
import 'firebase_options_stg.dart';
import 'src/app.dart';
import 'src/data/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Firebase.apps.isEmpty) {
    FirebaseOptions? firebaseOptions;
    if (Env.flavor != Flavor.production) {
      firebaseOptions = DefaultFirebaseOptionsStg.currentPlatform;
    } else {
      firebaseOptions = DefaultFirebaseOptions.currentPlatform;
    }
    await Firebase.initializeApp(
      options: firebaseOptions,
      name: Env.flavor.name,
    );
  } else {
    Firebase.app();
  }

  await initHiveForFlutter();
  await initServices();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  runZonedGuarded<Future<void>>(() async {
    runApp(App());
  }, (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  });
}
