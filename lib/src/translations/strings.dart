part of 'app_translations.dart';

enum Strings {
  hello,
  vietnamese,
  english,
  changeTheme,
  noNetworkConnection,
}

extension StringsExt on Strings {
  String get tr => toString().tr;
}