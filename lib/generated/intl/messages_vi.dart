// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'vi';

  static String m0(privacy, termsAndConditions) =>
      "Bằng cách nhấn Tiếp tục bạn đã đồng ý với ${termsAndConditions} và ${privacy} của chúng tôi.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "agreePrivacy": m0,
        "appName": MessageLookupByLibrary.simpleMessage("App name"),
        "changeTheme": MessageLookupByLibrary.simpleMessage("Đổi giao diện"),
        "confirm": MessageLookupByLibrary.simpleMessage("Xác nhận"),
        "deleteAccountSuccess":
            MessageLookupByLibrary.simpleMessage("Đã xóa tài khoản thành công"),
        "dontReceiveOtp":
            MessageLookupByLibrary.simpleMessage("Không nhận được mã OTP?"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "english": MessageLookupByLibrary.simpleMessage("Tiếng Anh"),
        "enterEmail": MessageLookupByLibrary.simpleMessage("Nhập email"),
        "errorEmailIncorrect":
            MessageLookupByLibrary.simpleMessage("Email không đúng"),
        "errorOtpIsExpired":
            MessageLookupByLibrary.simpleMessage("Mã OTP đã hết hạn"),
        "helloWorld": MessageLookupByLibrary.simpleMessage("Chào mừng!"),
        "inDevelopment":
            MessageLookupByLibrary.simpleMessage("Tính năng đang phát triển"),
        "login": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
        "logout": MessageLookupByLibrary.simpleMessage("Đăng xuất"),
        "noNetworkConnection":
            MessageLookupByLibrary.simpleMessage("Không có kết nối mạng"),
        "or": MessageLookupByLibrary.simpleMessage("Hoặc"),
        "orLoginWith":
            MessageLookupByLibrary.simpleMessage("Hoặc đăng nhập bằng"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Số điện thoại"),
        "privacy":
            MessageLookupByLibrary.simpleMessage("Chính sách quyền riêng tư"),
        "resendOtp": MessageLookupByLibrary.simpleMessage("Gửi lại"),
        "resendOtpAfter": MessageLookupByLibrary.simpleMessage("Sau"),
        "sendingOtp": MessageLookupByLibrary.simpleMessage("Đang gửi mã OTP"),
        "sentOtpTo": MessageLookupByLibrary.simpleMessage("Đã gửi mã OTP đến"),
        "termsAndConditions":
            MessageLookupByLibrary.simpleMessage("Điều khoản dịch vụ"),
        "unknownError": MessageLookupByLibrary.simpleMessage(
            "Đã xảy ra lỗi, vui lòng thử lại"),
        "useAsGuest":
            MessageLookupByLibrary.simpleMessage("Dùng ứng dụng như khách"),
        "vietnamese": MessageLookupByLibrary.simpleMessage("Tiếng Việt")
      };
}
