import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sentry/sentry.dart';

class AppConfig {
  static late AppConfig _instance;

  final String appName;
  final AppFlavor flavorName;
  final String apiUrl;
  final SentryClient? sentry;

  bool get isDev => flavorName == AppFlavor.DEVELOPMENT;

  factory AppConfig({
    required String appName,
    required AppFlavor flavorName,
    required String apiUrl,
    SentryClient? sentry,
  }) =>
      _instance = AppConfig._(
        apiUrl: apiUrl,
        appName: appName,
        flavorName: flavorName,
        sentry: sentry,
      );

  AppConfig._({
    required this.appName,
    required this.flavorName,
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
    AppFlavor? flavorName,
    String? apiUrl,
    String? wss,
    SentryClient? sentry,
  }) {
    _instance = AppConfig(
      appName: appName ?? this.appName,
      flavorName: flavorName ?? this.flavorName,
      apiUrl: apiUrl ?? this.apiUrl,
      sentry: sentry,
    );
    return _instance;
  }

  static AppConfig get shared => _instance;
}

enum AppFlavor { DEVELOPMENT, TEST, PRODUCTION }
