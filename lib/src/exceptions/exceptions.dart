import 'package:flutter_base/src/translations/app_translations.dart';

class NoNetworkConnectionException implements Exception {
  @override
  String toString() => Strings.noNetworkConnection.tr;
}
