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

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("App Name"),
        "changeTheme": MessageLookupByLibrary.simpleMessage("Change theme"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "didNotReceiveOtp": MessageLookupByLibrary.simpleMessage(
            "I did not receive the verification code?"),
        "doNotReceiveOtp": MessageLookupByLibrary.simpleMessage(
            "Do not receive the verification code?"),
        "editAccount":
            MessageLookupByLibrary.simpleMessage("Edit your account"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "enterName": MessageLookupByLibrary.simpleMessage("Enter name"),
        "enterOtp": MessageLookupByLibrary.simpleMessage(
            "Enter the code we sent via SMS to your registered phone"),
        "enterPhoneNumberOrEmail":
            MessageLookupByLibrary.simpleMessage("Enter phone number or email"),
        "errorEmptyField":
            MessageLookupByLibrary.simpleMessage("Please enter something"),
        "errorPhoneOrEmailIncorrect":
            MessageLookupByLibrary.simpleMessage("Phone or email is incorrect"),
        "helloWorld": MessageLookupByLibrary.simpleMessage("Hello World!"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "noNetworkConnection":
            MessageLookupByLibrary.simpleMessage("No network connection"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone number"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "registerAcceptAgreement": MessageLookupByLibrary.simpleMessage(
            "By clicking subscribe, you are agreeing to our terms, agreements, operating regulations, privacy policy, complaints handling mechanism, ..."),
        "resendOtp": MessageLookupByLibrary.simpleMessage("Resend"),
        "resendOtpAfter":
            MessageLookupByLibrary.simpleMessage("Resend OTP after"),
        "sendingOtp": MessageLookupByLibrary.simpleMessage(
            "Sending the verification code..."),
        "sentOtpTo": MessageLookupByLibrary.simpleMessage("Sent OTP to"),
        "unknownError": MessageLookupByLibrary.simpleMessage(
            "Unknown error. Please try again."),
        "vietnamese": MessageLookupByLibrary.simpleMessage("Vietnamese"),
        "yourPoint": MessageLookupByLibrary.simpleMessage("Your point")
      };
}
