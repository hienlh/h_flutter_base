import 'package:flutter/material.dart';

import 'base/app_config.dart';
import 'package:get/get.dart';

import 'routes.dart';
import 'translations/app_translations.dart';
import 'ui/pages/splash/splash_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: AppConfig.shared.flavor != AppFlavor.PROD,
      title: 'Hien Flutter Base',
      enableLog: false,
      popGesture: true,
      defaultTransition: Transition.cupertino,
      home: SplashScreen(),
      getPages: getPages,
      locale: Locale('vi', 'VI'),
      fallbackLocale: Locale('vi', 'VI'),
      translationsKeys: AppTranslation.translations,
    );
  }
}
