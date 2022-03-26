part of 'app_translations.dart';

extension _En on Strings {
  String get en {
    switch (this) {
      case Strings.hello:
        return 'Hello';
      case Strings.vietnamese:
        return 'Vietnamese';
      case Strings.english:
        return 'English';
      case Strings.changeTheme:
        return 'Change theme';
      case Strings.noNetworkConnection:
        return 'No network connection';
      case Strings.unknownError:
        return 'Unknown error. Please try again.';
    }
  }
}
