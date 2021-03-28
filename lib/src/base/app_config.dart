import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sentry/sentry.dart';

class AppConfig extends InheritedWidget {
  static late AppConfig _instance;

  final String appName;
  final AppFlavor flavorName;
  final String apiUrl;
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  final SentryClient? sentry;

  bool get isDev => flavorName == AppFlavor.DEVELOPMENT;

  factory AppConfig({
    required String appName,
    required AppFlavor flavorName,
    required String apiUrl,
    required Widget child,
    SentryClient? sentry,
  }) =>
      _instance = AppConfig._(
        apiUrl: apiUrl,
        appName: appName,
        flavorName: flavorName,
        sentry: sentry,
        child: child,
      );

  AppConfig._({
    required this.appName,
    required this.flavorName,
    required this.apiUrl,
    required Widget child,
    this.sentry,
  }) : super(child: child) {
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
    Widget? child,
    SentryClient? sentry,
  }) {
    _instance = AppConfig(
      appName: appName ?? this.appName,
      flavorName: flavorName ?? this.flavorName,
      apiUrl: apiUrl ?? this.apiUrl,
      sentry: sentry,
      child: child ?? this.child,
    );
    return _instance;
  }

  static AppConfig get instance => _instance;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

enum AppFlavor { DEVELOPMENT, TEST, PRODUCTION }
