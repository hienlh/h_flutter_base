import 'package:flutter_base/src/translations/app_translations.dart';

class NoNetworkConnectionException implements Exception {
  @override
  String toString() => Strings.noNetworkConnection.tr;
}

class UnauthenticatedException implements Exception {}

class UnknownException implements Exception {
  final String message;

  UnknownException(this.message);
}
