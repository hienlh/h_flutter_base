import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trihai_admin_app/src/ui/pages/booking_history/booking_history_page.dart';
import 'package:trihai_admin_app/src/ui/pages/customer_profile/customer_profile_page.dart';
import 'package:trihai_admin_app/src/ui/pages/point_history/point_history_page.dart';
import 'package:trihai_admin_app/src/ui/pages/qr_scanner/qr_scanner_page.dart';

import 'controllers/auth_controller.dart';
import 'data/models/entities/user_entity.dart';
import 'ui/pages/change_pass/change_pass_page.dart';
import 'ui/pages/edit_profile/edit_profile_page.dart';
import 'ui/pages/login/login_page.dart';
import 'ui/pages/main/main_page.dart';
import 'ui/pages/otp/otp_page.dart';
import 'ui/pages/splash/splash_page.dart';

class Routes {
  static const splash = '/splash';
  static const login = '/login';
  static const otp = '/otp';
  static const main = '/main';
  static const editProfile = '/profile/edit';
  static const changePassword = '/password/change';
  static const scanQrCode = '/scanQrCode';
  static const customerProfile = '/customer/:id';
  static const pointHistory = '/customer/:id/point-history';
  static const bookingHistory = '/orders';
}

final List<SpecialRoute> privateRoutes =
    [].map((e) => SpecialRoute(e)).toList();

final List<SpecialRoute> premiumRoutes = [];

final List<GetPage> getPages = [
  GetPage(
    name: Routes.splash,
    page: () => SplashPage(),
    binding: SplashBinding(),
  ),
  GetPage(name: Routes.login, page: () => LoginPage(), binding: LoginBinding()),
  GetPage(name: Routes.otp, page: () => OtpPage()),
  GetPage(name: Routes.main, page: () => MainPage()),
  GetPage(
    name: Routes.editProfile,
    page: () => EditProfilePage(),
    binding: EditProfileBinding(),
  ),
  GetPage(
    name: Routes.changePassword,
    page: () => ChangePassPage(),
    binding: ChangePassBinding(),
  ),
  GetPage(
    name: Routes.scanQrCode,
    page: () => QrScannerPage(),
    binding: QrScannerBinding(),
  ),
  GetPage(
    name: Routes.customerProfile,
    page: () => CustomerProfilePage(),
    binding: CustomerProfileBinding(),
  ),
  GetPage(
    name: Routes.pointHistory,
    page: () => PointHistoryPage(),
    binding: PointHistoryBinding(),
  ),
  GetPage(
    name: Routes.bookingHistory,
    page: () => BookingHistoryPage(),
    binding: BookingHistoryBinding(),
  ),
];

bool handlePrivateRoutes(Routing? r) {
  if (r == null) return false;
  if ([...privateRoutes, ...premiumRoutes]
      .map((e) => e.route)
      .contains(r.current)) {
    final isAuth = Get.find<AuthController>().isAuth;
    if (!isAuth) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Get.offNamed(Routes.login,
            arguments: Routing(current: r.current, args: r.args));
      });
      return true;
    }
  }
  return false;
}

class SpecialRoute {
  final String route;
  final bool requiredVip;
  final bool Function(dynamic args, UserEntity? user)? except;

  SpecialRoute(this.route, {this.requiredVip = true, this.except});
}
