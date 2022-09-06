import 'package:flutter/material.dart';

import '../../../constants/assets.dart';

enum SocialProvider { google, apple, facebook }

extension SocialProviderExt on SocialProvider {
  String get icon {
    switch (this) {
      case SocialProvider.google:
        return Assets.icons.google;
      case SocialProvider.apple:
        return Assets.icons.apple;
      case SocialProvider.facebook:
        return Assets.icons.facebook;
    }
  }

  Color get color {
    switch (this) {
      case SocialProvider.google:
        return Color(0xffDA483F);
      case SocialProvider.apple:
        return Color(0xff000000);
      case SocialProvider.facebook:
        return Color(0xff3B5998);
    }
  }

  String get title {
    switch (this) {
      case SocialProvider.google:
        return 'Google';
      case SocialProvider.apple:
        return 'Apple';
      case SocialProvider.facebook:
        return 'Facebook';
    }
  }
}
