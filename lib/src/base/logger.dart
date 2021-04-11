import 'dart:developer';

import 'package:logger/logger.dart';

import 'app_config.dart';

var logger = MyLogger();

class MyLogger {
  final _logger = Logger();

  void v(dynamic message) {
    _logger.v(message);
  }

  void d(dynamic message) {
    _logger.d(message);
  }

  void i(dynamic message) {
    _logger.i(message);
  }

  void w(dynamic message) {
    _logger.w(message);
  }

  void e(dynamic message) {
    _logger.e(message);
    AppConfig.shared.sentry?.captureException(message);
  }

  void long(dynamic message, [String tag = '']) {
    log(message.toString(), name: tag);
  }
}
