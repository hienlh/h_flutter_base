import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import '../../env.dart';
import '../../generated/l10n.dart';

class AppUtils {
  static Future<dynamic> jsonDecodeAsync(String data) {
    return compute(_jsonDecode, data);
  }

  static void showError(dynamic message) {
    if (message is String) {
      try {
        final json = jsonDecode(message);
        if (json['message'] != null) {
          message = json['message'];
        }
      } catch (_) {}
    } else if (message is Exception) {
      message = message.toString();
    }

    // Get.rawSnackbar(
    //   message: message is String ? message : S.current.unknownError,
    //   backgroundColor: Colors.red,
    // );
    _showSnackBar(
      contentType: ContentType.failure,
      message: message is String ? message : S.current.unknownError,
    );
  }

  static void showInDevelopment() {
    _showSnackBar(
      contentType: ContentType.warning,
      message: S.current.inDevelopment,
    );
  }

  static void showMessage(String message) {
    _showSnackBar(
      contentType: ContentType.help,
      message: message,
    );
  }

  static void showSuccess(String s) {
    // Get.rawSnackbar(
    //   message: s,
    //   backgroundColor: Get.context?.theme.colorScheme.onSurface ?? Colors.green,
    // );
    _showSnackBar(contentType: ContentType.success, message: s);
  }

  static _showSnackBar({
    String? title,
    required String message,
    required ContentType contentType,
  }) {
    final t = title ??
        (contentType == ContentType.success
            ? 'Wow!'
            : contentType == ContentType.help
                ? 'Info'
                : 'Oops!');
    var snackBar = SnackBar(
      elevation: 0,
      duration: 1500.milliseconds,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: t,
        message: message,
        contentType: contentType,
      ),
    );

    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  static void showUnknownError() => showError(S.current.unknownError);

  static String timeAgoFormat(DateTime date, {String? locale}) {
    final res = timeago.format(
      date,
      locale: locale ?? Get.locale?.languageCode,
      allowFromNow: true,
    );
    return res;
  }

  static Future launchUrl(String s, [bool isExternalApp = false]) async {
    await url_launcher.launchUrl(
      Uri.parse(s),
      mode: isExternalApp
          ? url_launcher.LaunchMode.externalApplication
          : url_launcher.LaunchMode.platformDefault,
    );
  }

  static String formatCurrency(String text) {
    final number = double.tryParse(text) ?? 0;

    final formatted = NumberFormat.currency(
      locale: 'en',
      symbol: 'đ',
      decimalDigits: 0,
      customPattern: '#,### \u00a4',
    ).format(number).toString();

    return formatted;
  }

  static void openPrivacy() {
    AppUtils.launchUrl('${Env().apiUrl}/privacy.html');
  }

  static void openTerms() {
    AppUtils.launchUrl('${Env().apiUrl}/terms-and-conditions.html');
  }
}

dynamic _jsonDecode(String data) => jsonDecode(data);
