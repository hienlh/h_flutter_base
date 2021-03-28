import 'package:flutter/material.dart';

import 'base/app_config.dart';
import 'package:get/get.dart';

import 'routes.dart';
import 'screens/splash/splash_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner:
          AppConfig.instance.flavorName != AppFlavor.PRODUCTION,
      title: 'Cupizz',
      navigatorKey: AppConfig.navigatorKey,
      enableLog: false,
      popGesture: true,
      defaultTransition: Transition.cupertino,
      home: SplashScreen(),
      getPages: getPages,
    );
  }
}
