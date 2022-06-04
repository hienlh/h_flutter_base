part of 'services.dart';

class LogService extends GetxService implements ILogger {
  late final SentryClient? _sentry;
  final _logger = Logger();

  LogService([this._sentry]);

  @override
  void call(dynamic message) {
    print(message != null ? message.toString() : 'null');
  }

  @override
  void v(dynamic message) {
    _logger.v(message.toString());
  }

  @override
  void d(dynamic message) {
    log(message.toString());
  }

  @override
  void i(dynamic message) {
    print(message.toString());
  }

  @override
  void w(dynamic message) {
    print(message.toString());
  }

  @override
  void e(dynamic message) {
    _logger.e(message.toString());
    _sentry?.captureException(message);
  }

  @override
  void long(dynamic message, [String tag = '']) {
    log(message.toString(), name: tag);
  }
}
