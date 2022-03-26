part of 'app_translations.dart';

enum Strings {
  hello,
  vietnamese,
  english,
  changeTheme,
  noNetworkConnection,
  unknownError,
}

extension StringsExt on Strings {
  String get tr => toString().tr;
}
