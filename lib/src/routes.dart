import 'package:get/get.dart';

import 'ui/pages/splash/splash_screen.dart';

class Routes {
  static const splash = '/splash';
}

final List<GetPage> getPages = [
  GetPage(name: Routes.splash, page: () => SplashScreen()),
];
