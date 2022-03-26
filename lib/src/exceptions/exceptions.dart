import '../translations/app_translations.dart';

class NoNetworkConnectionException implements Exception {
  @override
  String toString() => Strings.noNetworkConnection.tr;
}

class UnauthenticatedException implements Exception {}

class UnknownException implements Exception {
  final String? message;
  final dynamic error;
  final String? code;

  UnknownException({this.code, this.message, this.error});

  @override
  String toString() =>
      message ??
      '${Strings.unknownError.tr} ${code?.isNotEmpty ?? false ? '($code)' : ''}';
}
