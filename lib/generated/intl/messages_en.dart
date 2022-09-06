// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(privacy, termsAndConditions) =>
      "By continue, you agree to our ${termsAndConditions} and ${privacy}.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "agreePrivacy": m0,
        "appName": MessageLookupByLibrary.simpleMessage("App Name"),
        "changeTheme": MessageLookupByLibrary.simpleMessage("Change theme"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "deleteAccountSuccess":
            MessageLookupByLibrary.simpleMessage("Delete account success"),
        "dontReceiveOtp":
            MessageLookupByLibrary.simpleMessage("Don\'t receive OTP?"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "enterEmail": MessageLookupByLibrary.simpleMessage("Enter email"),
        "errorEmailIncorrect":
            MessageLookupByLibrary.simpleMessage("Email is incorrect"),
        "errorOtpIsExpired":
            MessageLookupByLibrary.simpleMessage("OTP is expired"),
        "helloWorld": MessageLookupByLibrary.simpleMessage("Hello World!"),
        "inDevelopment": MessageLookupByLibrary.simpleMessage("In development"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "noNetworkConnection":
            MessageLookupByLibrary.simpleMessage("No network connection"),
        "or": MessageLookupByLibrary.simpleMessage("Or"),
        "orLoginWith": MessageLookupByLibrary.simpleMessage("Or login with"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone number"),
        "privacy": MessageLookupByLibrary.simpleMessage("Privacy"),
        "resendOtp": MessageLookupByLibrary.simpleMessage("Resend OTP"),
        "resendOtpAfter": MessageLookupByLibrary.simpleMessage("After"),
        "sendingOtp": MessageLookupByLibrary.simpleMessage("Sending OTP"),
        "sentOtpTo": MessageLookupByLibrary.simpleMessage("Sent OTP to"),
        "termsAndConditions":
            MessageLookupByLibrary.simpleMessage("Terms and conditions"),
        "unknownError": MessageLookupByLibrary.simpleMessage(
            "Unknown error. Please try again."),
        "useAsGuest": MessageLookupByLibrary.simpleMessage("Use as guest"),
        "vietnamese": MessageLookupByLibrary.simpleMessage("Vietnamese")
      };
}
