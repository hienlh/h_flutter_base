import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/env.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../generated/l10n.dart';
import 'exceptions/exception_handler.dart';
import 'routes/routes.dart';
import 'ui/widgets/flavor_banner.dart';
import 'utils/screen_util.dart';

class App extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const App({super.key, this.savedThemeMode});

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
        fontFamily: GoogleFonts.varelaRound().fontFamily,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        fontFamily: GoogleFonts.varelaRound().fontFamily,
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => GetMaterialApp(
        smartManagement: SmartManagement.full,
        onGenerateTitle: (context) => S.current.appName,
        debugShowCheckedModeBanner: false,
        title: Env().appName,
        enableLog: kDebugMode,
        popGesture: !kIsWeb,
        defaultTransition: kIsWeb ? Transition.fadeIn : Transition.cupertino,
        getPages: getPages,
        theme: theme,
        darkTheme: darkTheme,
        initialRoute: Routes.splash.p,
        onInit: () {
          ExceptionHandler.instance.loaded();
        },
        builder: (_, c) {
          return FlavorBanner(
            enable: !kReleaseMode || Env().flavor != Flavor.production,
            child: c?.fixedScreenSize(
                  context,
                  designSize: const Size(606, 1280),
                ) ??
                const SizedBox.shrink(),
          );
        },
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
