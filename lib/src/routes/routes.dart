import 'package:flutter/widgets.dart';
import 'package:flutter_base/src/routes/auth_guard.dart';
import 'package:get/get.dart';

import '../ui/pages/dev/dev_page.dart';
import '../ui/pages/login/login_page.dart';
import '../ui/pages/main/main_page.dart';
import '../ui/pages/maintenance/maintenance_page.dart';
import '../ui/pages/otp/otp_page.dart';
import '../ui/pages/splash/splash_page.dart';
import 'route_path.dart';

class Routes {
  static const splash = RoutePath('/splash');
  static const main = RoutePath('/main');
  static const maintenance = RoutePath('/maintenance');
  static const login = RoutePath('/login');
  static const otp = RoutePath('/otp');
  static const dev = RoutePath('/dev');

  // Example routes
  static const parent = RoutePath('/parent');
  static const child1 = RoutePath('/child1', parent: parent);
  static const child2 = RoutePath('/child2', parent: parent);
}

final List<GetPage> getPages = [
  GetPage(
    name: Routes.splash.sp,
    page: () => SplashPage(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: Routes.main.sp,
    page: () => MainPage(),
    binding: MainBinding(),
  ).protected(),
  GetPage(
    name: Routes.maintenance.sp,
    page: () => MaintenancePage(),
  ),
  GetPage(
    name: Routes.login.sp,
    page: () => LoginPage(),
    binding: LoginBinding(),
  ),
  GetPage(name: Routes.dev.sp, page: () => DevPage()),
  GetPage(name: Routes.otp.sp, page: () => OtpPage()),

  // Example routes
  GetPage(
    name: Routes.parent.sp,
    page: () => Container(),
    children: [
      GetPage(name: Routes.child1.sp, page: () => Container()),
      GetPage(name: Routes.child2.sp, page: () => Container()),
    ],
  ).protected(),
];
