// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `App name`
  String get appName {
    return Intl.message(
      'App name',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Đổi giao diện`
  String get changeTheme {
    return Intl.message(
      'Đổi giao diện',
      name: 'changeTheme',
      desc: '',
      args: [],
    );
  }

  /// `Chào mừng!`
  String get helloWorld {
    return Intl.message(
      'Chào mừng!',
      name: 'helloWorld',
      desc: '',
      args: [],
    );
  }

  /// `Không có kết nối mạng`
  String get noNetworkConnection {
    return Intl.message(
      'Không có kết nối mạng',
      name: 'noNetworkConnection',
      desc: '',
      args: [],
    );
  }

  /// `Đã xảy ra lỗi, vui lòng thử lại`
  String get unknownError {
    return Intl.message(
      'Đã xảy ra lỗi, vui lòng thử lại',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Tiếng Anh`
  String get english {
    return Intl.message(
      'Tiếng Anh',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Tiếng Việt`
  String get vietnamese {
    return Intl.message(
      'Tiếng Việt',
      name: 'vietnamese',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập`
  String get login {
    return Intl.message(
      'Đăng nhập',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Nhập email`
  String get enterEmail {
    return Intl.message(
      'Nhập email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Hoặc đăng nhập bằng`
  String get orLoginWith {
    return Intl.message(
      'Hoặc đăng nhập bằng',
      name: 'orLoginWith',
      desc: '',
      args: [],
    );
  }

  /// `Email không đúng`
  String get errorEmailIncorrect {
    return Intl.message(
      'Email không đúng',
      name: 'errorEmailIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Tính năng đang phát triển`
  String get inDevelopment {
    return Intl.message(
      'Tính năng đang phát triển',
      name: 'inDevelopment',
      desc: '',
      args: [],
    );
  }

  /// `Đang gửi mã OTP`
  String get sendingOtp {
    return Intl.message(
      'Đang gửi mã OTP',
      name: 'sendingOtp',
      desc: '',
      args: [],
    );
  }

  /// `Mã OTP đã hết hạn`
  String get errorOtpIsExpired {
    return Intl.message(
      'Mã OTP đã hết hạn',
      name: 'errorOtpIsExpired',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận`
  String get confirm {
    return Intl.message(
      'Xác nhận',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại`
  String get phoneNumber {
    return Intl.message(
      'Số điện thoại',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Đã gửi mã OTP đến`
  String get sentOtpTo {
    return Intl.message(
      'Đã gửi mã OTP đến',
      name: 'sentOtpTo',
      desc: '',
      args: [],
    );
  }

  /// `Không nhận được mã OTP?`
  String get dontReceiveOtp {
    return Intl.message(
      'Không nhận được mã OTP?',
      name: 'dontReceiveOtp',
      desc: '',
      args: [],
    );
  }

  /// `Gửi lại`
  String get resendOtp {
    return Intl.message(
      'Gửi lại',
      name: 'resendOtp',
      desc: '',
      args: [],
    );
  }

  /// `Sau`
  String get resendOtpAfter {
    return Intl.message(
      'Sau',
      name: 'resendOtpAfter',
      desc: '',
      args: [],
    );
  }

  /// `Đã xóa tài khoản thành công`
  String get deleteAccountSuccess {
    return Intl.message(
      'Đã xóa tài khoản thành công',
      name: 'deleteAccountSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Hoặc`
  String get or {
    return Intl.message(
      'Hoặc',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Dùng ứng dụng như khách`
  String get useAsGuest {
    return Intl.message(
      'Dùng ứng dụng như khách',
      name: 'useAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `Chính sách quyền riêng tư`
  String get privacy {
    return Intl.message(
      'Chính sách quyền riêng tư',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `Điều khoản dịch vụ`
  String get termsAndConditions {
    return Intl.message(
      'Điều khoản dịch vụ',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Bằng cách nhấn Tiếp tục bạn đã đồng ý với {termsAndConditions} và {privacy} của chúng tôi.`
  String agreePrivacy(String privacy, String termsAndConditions) {
    return Intl.message(
      'Bằng cách nhấn Tiếp tục bạn đã đồng ý với $termsAndConditions và $privacy của chúng tôi.',
      name: 'agreePrivacy',
      desc: '',
      args: [privacy, termsAndConditions],
    );
  }

  /// `Đăng xuất`
  String get logout {
    return Intl.message(
      'Đăng xuất',
      name: 'logout',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
