part of 'services.dart';

class LogService extends GetxService implements ILogger {
  final _logger = Logger();

  LogService();

  @override
  void call(dynamic message) {
    print(message != null ? message.toString() : 'null');
  }

  @override
  void v(dynamic message) {
    _logger.t(message.toString());
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
  }

  @override
  void long(dynamic message, [String tag = '']) {
    log(message.toString(), name: tag);
  }
}
