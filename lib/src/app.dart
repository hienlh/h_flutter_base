import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../generated/l10n.dart';
import 'base/app_config.dart';
import 'routes.dart';
import 'styles/color_scheme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.smartManagement = SmartManagement.keepFactory;

    return GetMaterialApp(
      onGenerateTitle: (context) => S.current.appName,
      debugShowCheckedModeBanner: AppConfig.shared.flavor != AppFlavor.prod,
      title: 'Trí Hải',
      enableLog: AppConfig.shared.isDev,
      popGesture: true,
      defaultTransition: Transition.cupertino,
      initialRoute: Routes.splash,
      getPages: getPages,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routingCallback: handlePrivateRoutes,
      theme: ThemeData(
        primaryColor: defaultColorScheme.primary,
        colorScheme: defaultColorScheme,
        backgroundColor: defaultColorScheme.background,
        hintColor: Color(0xff8e8e8e),
        textTheme: GoogleFonts.varelaRoundTextTheme(),
      ),
    );
  }
}
