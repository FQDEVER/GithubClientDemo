// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, always_declare_return_types

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = MessageLookup();

typedef String MessageIfAbsent(String? messageStr, List<Object>? args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'messages';

  static m0(howMany) => "${Intl.plural(howMany, zero: 'There are no emails left', one: 'There is ${howMany} email left', other: 'There are ${howMany} emails left')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function> {
    "auto" : MessageLookupByLibrary.simpleMessage("Auto"),
    "cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "language" : MessageLookupByLibrary.simpleMessage("Language"),
    "loginTitle" : MessageLookupByLibrary.simpleMessage("Login"),
    "logout" : MessageLookupByLibrary.simpleMessage("Logout"),
    "logoutTip" : MessageLookupByLibrary.simpleMessage("Logout Confirm?"),
    "mineTitle" : MessageLookupByLibrary.simpleMessage("Mine"),
    "noDescription" : MessageLookupByLibrary.simpleMessage("noDescription"),
    "remainingEmailsMessage" : m0,
    "themeColor" : MessageLookupByLibrary.simpleMessage("ThemeColor"),
    "title" : MessageLookupByLibrary.simpleMessage("Flutter APP"),
    "titleMsg" : MessageLookupByLibrary.simpleMessage("test content"),
    "userNameOrPasswordWrong" : MessageLookupByLibrary.simpleMessage("UserName Or Password Wrong!")
  };
}
