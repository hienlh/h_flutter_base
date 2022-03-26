part of 'services.dart';

class LogService extends GetxService implements ILogger {
  late final SentryClient? _sentry;
  final _logger = Logger();

  LogService([this._sentry]);

  @override
  void v(dynamic message) {
    _logger.v(message.toString());
  }

  @override
  void d(dynamic message) {
    _logger.d(message.toString());
  }

  @override
  void i(dynamic message) {
    _logger.i(message.toString());
  }

  @override
  void w(dynamic message) {
    _logger.w(message.toString());
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
