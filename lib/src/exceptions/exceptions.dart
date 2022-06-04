import '../../generated/l10n.dart';

class NoNetworkConnectionException implements Exception {
  @override
  String toString() => S.current.noNetworkConnection;
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
      '${S.current.unknownError} ${code?.isNotEmpty ?? false ? '($code)' : ''}';
}
