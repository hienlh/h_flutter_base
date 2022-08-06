import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/env.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import '../generated/l10n.dart';
import 'ui/widgets/flavor_banner.dart';
import 'routes.dart';

class App extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const App({Key? key, this.savedThemeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          ),
        ),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => GetMaterialApp(
        smartManagement: SmartManagement.full,
        onGenerateTitle: (context) => S.current.appName,
        debugShowCheckedModeBanner: false,
        title: Env().appName,
        enableLog: kDebugMode,
        popGesture: true,
        defaultTransition: Transition.cupertino,
        getPages: getPages,
        theme: theme,
        darkTheme: darkTheme,
        initialRoute: Routes.splash,
        builder: (_, w) => FlavorBanner(
          enable: !kDebugMode || Env().flavor != Flavor.production,
          child: w ?? const SizedBox.shrink(),
        ),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
