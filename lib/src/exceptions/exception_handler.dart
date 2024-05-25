import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'exceptions.dart';

class ExceptionHandler {
  final _completer = Completer();

  void loaded() {
    if (!_completer.isCompleted) _completer.complete();
  }

  static final ExceptionHandler instance = ExceptionHandler._internal();

  factory ExceptionHandler() => instance;
  ExceptionHandler._internal();

  bool _isUnauthenticatedShowing = false;

  void captureException(dynamic e, {dynamic stackTrace}) async {
    await _completer.future;
    if (e is UnauthenticatedException) {
      if (!_isUnauthenticatedShowing) {
        try {
          _isUnauthenticatedShowing = true;
          // TODO: show unauthenticated dialog
        } catch (e) {
          if (kDebugMode) {
            debugPrint(e.toString());
          } else {
            Sentry.captureException(e, stackTrace: stackTrace);
          }
        }
      }
    } else if (e is NoNetworkConnectionException) {
      // TODO: show no network connection dialog
    } else {
      if (kDebugMode) {
        debugPrint(e.toString());
        throw e;
      } else {
        Sentry.captureException(e, stackTrace: stackTrace);
      }
    }
  }
}
