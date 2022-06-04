import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import '../generated/l10n.dart';
import 'base/app_config.dart';
import 'routes.dart';
import 'ui/pages/splash/splash_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateTitle: (context) => S.current.appName,
      debugShowCheckedModeBanner: AppConfig.shared.flavor != AppFlavor.prod,
      title: 'Hien Flutter Base',
      enableLog: AppConfig.shared.isDev,
      popGesture: true,
      defaultTransition: Transition.cupertino,
      home: SplashScreen(),
      getPages: getPages,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
