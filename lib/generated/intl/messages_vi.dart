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

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("App name"),
        "changeTheme": MessageLookupByLibrary.simpleMessage("Đổi giao diện"),
        "english": MessageLookupByLibrary.simpleMessage("Tiếng Anh"),
        "helloWorld": MessageLookupByLibrary.simpleMessage("Chào mừng!"),
        "noNetworkConnection":
            MessageLookupByLibrary.simpleMessage("Không có kết nối mạng"),
        "unknownError": MessageLookupByLibrary.simpleMessage(
            "Đã xảy ra lỗi, vui lòng thử lại"),
        "vietnamese": MessageLookupByLibrary.simpleMessage("Tiếng Việt")
      };
}
