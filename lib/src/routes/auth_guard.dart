import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import 'routes.dart';

class AuthGuard extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    print('Checking auth guard...');
    final auth =
        Get.isRegistered<AuthController>() ? Get.find<AuthController>() : null;
    if (auth?.isAuth == true) return null;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.offAllNamed(
        Routes.login.p,
        parameters: {
          'redirect': route ?? Routes.main.p,
        },
      );
    });
    return RouteSettings(name: Routes.login.p);
  }
}

extension ProtectedPage on GetPage {
  GetPage protected() => copy(
        middlewares: [...middlewares ?? [], AuthGuard()],
        children: children.map((e) => e.protected()).toList(),
      );
}
