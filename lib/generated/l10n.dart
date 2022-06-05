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

  /// `App Name`
  String get appName {
    return Intl.message(
      'App Name',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Change theme`
  String get changeTheme {
    return Intl.message(
      'Change theme',
      name: 'changeTheme',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Hello World!`
  String get helloWorld {
    return Intl.message(
      'Hello World!',
      name: 'helloWorld',
      desc: '',
      args: [],
    );
  }

  /// `No network connection`
  String get noNetworkConnection {
    return Intl.message(
      'No network connection',
      name: 'noNetworkConnection',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error. Please try again.`
  String get unknownError {
    return Intl.message(
      'Unknown error. Please try again.',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Vietnamese`
  String get vietnamese {
    return Intl.message(
      'Vietnamese',
      name: 'vietnamese',
      desc: '',
      args: [],
    );
  }

  /// `Sending the verification code...`
  String get sendingOtp {
    return Intl.message(
      'Sending the verification code...',
      name: 'sendingOtp',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone number or email`
  String get enterPhoneNumberOrEmail {
    return Intl.message(
      'Enter phone number or email',
      name: 'enterPhoneNumberOrEmail',
      desc: '',
      args: [],
    );
  }

  /// `Phone or email is incorrect`
  String get errorPhoneOrEmailIncorrect {
    return Intl.message(
      'Phone or email is incorrect',
      name: 'errorPhoneOrEmailIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Enter name`
  String get enterName {
    return Intl.message(
      'Enter name',
      name: 'enterName',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `By clicking subscribe, you are agreeing to our terms, agreements, operating regulations, privacy policy, complaints handling mechanism, ...`
  String get registerAcceptAgreement {
    return Intl.message(
      'By clicking subscribe, you are agreeing to our terms, agreements, operating regulations, privacy policy, complaints handling mechanism, ...',
      name: 'registerAcceptAgreement',
      desc: '',
      args: [],
    );
  }

  /// `Please enter something`
  String get errorEmptyField {
    return Intl.message(
      'Please enter something',
      name: 'errorEmptyField',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code we sent via SMS to your registered phone`
  String get enterOtp {
    return Intl.message(
      'Enter the code we sent via SMS to your registered phone',
      name: 'enterOtp',
      desc: '',
      args: [],
    );
  }

  /// `I did not receive the verification code?`
  String get didNotReceiveOtp {
    return Intl.message(
      'I did not receive the verification code?',
      name: 'didNotReceiveOtp',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resendOtp {
    return Intl.message(
      'Resend',
      name: 'resendOtp',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
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

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Sent OTP to`
  String get sentOtpTo {
    return Intl.message(
      'Sent OTP to',
      name: 'sentOtpTo',
      desc: '',
      args: [],
    );
  }

  /// `Do not receive the verification code?`
  String get doNotReceiveOtp {
    return Intl.message(
      'Do not receive the verification code?',
      name: 'doNotReceiveOtp',
      desc: '',
      args: [],
    );
  }

  /// `Resend OTP after`
  String get resendOtpAfter {
    return Intl.message(
      'Resend OTP after',
      name: 'resendOtpAfter',
      desc: '',
      args: [],
    );
  }

  /// `Your point`
  String get yourPoint {
    return Intl.message(
      'Your point',
      name: 'yourPoint',
      desc: '',
      args: [],
    );
  }

  /// `Edit your account`
  String get editAccount {
    return Intl.message(
      'Edit your account',
      name: 'editAccount',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
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
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
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
