import 'package:get/get.dart';

import 'ui/pages/main/main_page.dart';
import 'ui/pages/maintenance/maintenance_page.dart';
import 'ui/pages/splash/splash_page.dart';

class Routes {
  static const splash = '/splash';
  static const main = '/main';
  static const maintenance = '/maintenance';
}

final List<GetPage> getPages = [
  GetPage(
    name: Routes.splash,
    page: () => SplashPage(),
    binding: SplashBinding(),
  ),
  GetPage(name: Routes.main, page: () => MainPage()),
  GetPage(name: Routes.maintenance, page: () => MaintenancePage()),
];
