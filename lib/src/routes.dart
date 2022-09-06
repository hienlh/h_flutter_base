import 'package:get/get.dart';

import 'ui/pages/dev/dev_page.dart';
import 'ui/pages/login/login_page.dart';
import 'ui/pages/main/main_page.dart';
import 'ui/pages/maintenance/maintenance_page.dart';
import 'ui/pages/otp/otp_page.dart';
import 'ui/pages/splash/splash_page.dart';

class Routes {
  static const splash = '/splash';
  static const main = '/main';
  static const maintenance = '/maintenance';
  static const login = '/login';
  static const otp = '/otp';
  static const dev = '/dev';
}

final List<GetPage> getPages = [
  GetPage(
    name: Routes.splash,
    page: () => SplashPage(),
    binding: SplashBinding(),
  ),
  GetPage(name: Routes.main, page: () => MainPage(), binding: MainBinding()),
  GetPage(name: Routes.maintenance, page: () => MaintenancePage()),
  GetPage(name: Routes.login, page: () => LoginPage(), binding: LoginBinding()),
  GetPage(name: Routes.dev, page: () => DevPage()),
  GetPage(name: Routes.otp, page: () => OtpPage()),
];
