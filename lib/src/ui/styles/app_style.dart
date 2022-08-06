import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:get/get.dart';

class AppStyle {
  static void setLight() => AdaptiveTheme.of(Get.context!).setLight();
  static void setDark() => AdaptiveTheme.of(Get.context!).setDark();
  static void setSystem() => AdaptiveTheme.of(Get.context!).setSystem();
}
