import 'dart:ui';
import 'package:get/get.dart';

part 'en_us_translations.dart';
part 'vi_vi_translations.dart';

enum SupportedLocale { vi, en }

class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en_US': enUs,
    'vi_VI': viVi,
  };
}

extension SupportedLocaleExt on SupportedLocale {
  Locale get locale {
    switch (this) {
      case SupportedLocale.vi:
        return const Locale('vi', 'VI');
      case SupportedLocale.en:
        return const Locale('en', 'US');
    }
  }

  String get title {
    switch (this) {
      case SupportedLocale.vi:
        return 'vietnamese'.tr;
      case SupportedLocale.en:
        return 'english'.tr;
    }
  }
}

extension LocaleExt on Locale {
  String get title {
    if (this == SupportedLocale.vi.locale) {
      return SupportedLocale.vi.title;
    } else if (this == SupportedLocale.en.locale) {
      return SupportedLocale.en.title;
    } else {
      return '';
    }
  }
}
