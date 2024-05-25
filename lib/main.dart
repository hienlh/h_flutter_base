import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base/src/controllers/controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'env.dart';
import 'src/app.dart';
import 'src/data/services/services.dart';
import 'src/exceptions/exception_handler.dart';

void main() async {
  await runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await ScreenUtil.ensureScreenSize();

    await Env().getRemoteConfig();

    await initServices();
    if (kIsWeb) {
      await initControllers();
    }
    final savedThemeMode = await AdaptiveTheme.getThemeMode();

    runApp(App(savedThemeMode: savedThemeMode));
  }, (error, stack) {
    ExceptionHandler().captureException(error, stackTrace: stack);
  });
}
