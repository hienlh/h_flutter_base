import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import '../../generated/l10n.dart';
import '../base/extensions/context_ext.dart';
import '../ui/widgets/dialogs/loading_dialog.dart';

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
    } else if (message.message != null) {
      message = message.message;
    }

    Get.rawSnackbar(
      message: message is String ? message : S.current.unknownError,
      backgroundColor: Colors.red,
    );
  }

  static void showSuccess(String s) {
    Get.rawSnackbar(
      message: s,
      backgroundColor: Get.context?.colorScheme.onSurface ?? Colors.green,
    );
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

  static void showLoading([String? message]) {
    LoadingDialog.show(message: message);
  }

  static void hideLoading() {
    LoadingDialog.hide();
  }

  static launchUrl(String s) async {
    await url_launcher.launchUrl(Uri.parse(s));
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
}

dynamic _jsonDecode(String data) => jsonDecode(data);
