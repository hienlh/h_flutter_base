import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/env.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import '../generated/l10n.dart';
import 'base/flavor_banner.dart';
import 'routes.dart';
import 'ui/pages/splash/splash_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateTitle: (context) => S.current.appName,
      debugShowCheckedModeBanner: Env.flavor != Flavor.production,
      title: Env.appName,
      enableLog: kDebugMode,
      popGesture: true,
      defaultTransition: Transition.cupertino,
      home: FlavorBanner(child: SplashScreen()),
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
