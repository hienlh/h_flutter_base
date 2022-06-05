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

  /// `Đang gửi mã xác thực...`
  String get sendingOtp {
    return Intl.message(
      'Đang gửi mã xác thực...',
      name: 'sendingOtp',
      desc: '',
      args: [],
    );
  }

  /// `Trang chủ`
  String get home {
    return Intl.message(
      'Trang chủ',
      name: 'home',
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

  /// `Email hoặc số điện thoại`
  String get enterPhoneNumberOrEmail {
    return Intl.message(
      'Email hoặc số điện thoại',
      name: 'enterPhoneNumberOrEmail',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu`
  String get password {
    return Intl.message(
      'Mật khẩu',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Quên Mật Khẩu`
  String get forgotPassword {
    return Intl.message(
      'Quên Mật Khẩu',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại hoặc email không đúng`
  String get errorPhoneOrEmailIncorrect {
    return Intl.message(
      'Số điện thoại hoặc email không đúng',
      name: 'errorPhoneOrEmailIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Nhập tên`
  String get enterName {
    return Intl.message(
      'Nhập tên',
      name: 'enterName',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng điền thông tin`
  String get errorEmptyField {
    return Intl.message(
      'Vui lòng điền thông tin',
      name: 'errorEmptyField',
      desc: '',
      args: [],
    );
  }

  /// `Nhập mã chúng tôi đã gửi qua SMS đến điện thoại đã đăng ký của bạn`
  String get enterOtp {
    return Intl.message(
      'Nhập mã chúng tôi đã gửi qua SMS đến điện thoại đã đăng ký của bạn',
      name: 'enterOtp',
      desc: '',
      args: [],
    );
  }

  /// `Tôi không nhận được mã xác nhận?`
  String get didNotReceiveOtp {
    return Intl.message(
      'Tôi không nhận được mã xác nhận?',
      name: 'didNotReceiveOtp',
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

  /// `Chúng tôi đã gửi mã xác nhận đến`
  String get sentOtpTo {
    return Intl.message(
      'Chúng tôi đã gửi mã xác nhận đến',
      name: 'sentOtpTo',
      desc: '',
      args: [],
    );
  }

  /// `Không nhận được mã?`
  String get doNotReceiveOtp {
    return Intl.message(
      'Không nhận được mã?',
      name: 'doNotReceiveOtp',
      desc: '',
      args: [],
    );
  }

  /// `Gửi lại sau`
  String get resendOtpAfter {
    return Intl.message(
      'Gửi lại sau',
      name: 'resendOtpAfter',
      desc: '',
      args: [],
    );
  }

  /// `Điểm của bạn`
  String get yourPoint {
    return Intl.message(
      'Điểm của bạn',
      name: 'yourPoint',
      desc: '',
      args: [],
    );
  }

  /// `Chỉnh sửa tài khoản`
  String get editAccount {
    return Intl.message(
      'Chỉnh sửa tài khoản',
      name: 'editAccount',
      desc: '',
      args: [],
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

  /// `Lưu Thay Đổi`
  String get saveChanges {
    return Intl.message(
      'Lưu Thay Đổi',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Chọn ảnh từ`
  String get selectPictureFrom {
    return Intl.message(
      'Chọn ảnh từ',
      name: 'selectPictureFrom',
      desc: '',
      args: [],
    );
  }

  /// `Máy ảnh`
  String get camera {
    return Intl.message(
      'Máy ảnh',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Bộ sưu tập`
  String get gallery {
    return Intl.message(
      'Bộ sưu tập',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Hủy`
  String get cancel {
    return Intl.message(
      'Hủy',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Tên`
  String get lastName {
    return Intl.message(
      'Tên',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Ngày sinh`
  String get birthDate {
    return Intl.message(
      'Ngày sinh',
      name: 'birthDate',
      desc: '',
      args: [],
    );
  }

  /// `Địa chỉ`
  String get address {
    return Intl.message(
      'Địa chỉ',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại không đúng`
  String get errorPhoneIncorrect {
    return Intl.message(
      'Số điện thoại không đúng',
      name: 'errorPhoneIncorrect',
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

  /// `Thành công`
  String get success {
    return Intl.message(
      'Thành công',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Quét mã QR`
  String get scanQrCode {
    return Intl.message(
      'Quét mã QR',
      name: 'scanQrCode',
      desc: '',
      args: [],
    );
  }

  /// `Đổi mật khẩu`
  String get changePassword {
    return Intl.message(
      'Đổi mật khẩu',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Lịch sử booking`
  String get bookingHistory {
    return Intl.message(
      'Lịch sử booking',
      name: 'bookingHistory',
      desc: '',
      args: [],
    );
  }

  /// `Thông Tin Khách Hàng`
  String get customerInformation {
    return Intl.message(
      'Thông Tin Khách Hàng',
      name: 'customerInformation',
      desc: '',
      args: [],
    );
  }

  /// `Lịch sử tích điểm`
  String get pointHistory {
    return Intl.message(
      'Lịch sử tích điểm',
      name: 'pointHistory',
      desc: '',
      args: [],
    );
  }

  /// `Tìm kiếm`
  String get search {
    return Intl.message(
      'Tìm kiếm',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Đơn hàng`
  String get order {
    return Intl.message(
      'Đơn hàng',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Ngày`
  String get date {
    return Intl.message(
      'Ngày',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Thành tiền`
  String get toMoney {
    return Intl.message(
      'Thành tiền',
      name: 'toMoney',
      desc: '',
      args: [],
    );
  }

  /// `Số điểm tích được`
  String get accumulatedPoints {
    return Intl.message(
      'Số điểm tích được',
      name: 'accumulatedPoints',
      desc: '',
      args: [],
    );
  }

  /// `Xem thông tin khách hàng`
  String get viewCustomerInformation {
    return Intl.message(
      'Xem thông tin khách hàng',
      name: 'viewCustomerInformation',
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
