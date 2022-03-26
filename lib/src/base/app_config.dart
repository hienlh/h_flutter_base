import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:sentry/sentry.dart';

class AppConfig {
  static late AppConfig _instance;

  final String appName;
  final AppFlavor flavor;
  final String apiUrl;
  final SentryClient? sentry;

  bool get isDev => flavor == AppFlavor.development;

  factory AppConfig({
    required String appName,
    required AppFlavor flavor,
    required String apiUrl,
    SentryClient? sentry,
  }) =>
      _instance = AppConfig._(
        apiUrl: apiUrl,
        appName: appName,
        flavor: flavor,
        sentry: sentry,
      );

  AppConfig._({
    required this.appName,
    required this.flavor,
    required this.apiUrl,
    this.sentry,
  }) {
    if (sentry == null || isDev || kIsWeb) return;
    FlutterError.onError = (FlutterErrorDetails details) {
      if (details.stack != null) {
        Zone.current.handleUncaughtError(details.exception, details.stack!);
      }
    };
  }

  AppConfig copyWith({
    String? appName,
    AppFlavor? flavor,
    String? apiUrl,
    String? wss,
    SentryClient? sentry,
  }) {
    _instance = AppConfig(
      appName: appName ?? this.appName,
      flavor: flavor ?? this.flavor,
      apiUrl: apiUrl ?? this.apiUrl,
      sentry: sentry,
    );
    return _instance;
  }

  static AppConfig get shared => _instance;
}

enum AppFlavor { development, test, prod }
