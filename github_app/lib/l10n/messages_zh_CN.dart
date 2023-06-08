// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_CN locale. All the
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
  String get localeName => 'zh_CN';

  static m0(howMany) => "${Intl.plural(howMany, zero: '没有未读邮件', one: '有${howMany}封未读邮件', other: '有${howMany}封未读邮件')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function> {
    "auto" : MessageLookupByLibrary.simpleMessage("跟随系统"),
    "cancel" : MessageLookupByLibrary.simpleMessage("取消"),
    "language" : MessageLookupByLibrary.simpleMessage("语言"),
    "loginTitle" : MessageLookupByLibrary.simpleMessage("登录"),
    "logout" : MessageLookupByLibrary.simpleMessage("注销"),
    "logoutTip" : MessageLookupByLibrary.simpleMessage("确定退出登录吗?"),
    "mineTitle" : MessageLookupByLibrary.simpleMessage("我的"),
    "noDescription" : MessageLookupByLibrary.simpleMessage("没有详情"),
    "remainingEmailsMessage" : m0,
    "themeColor" : MessageLookupByLibrary.simpleMessage("主题"),
    "title" : MessageLookupByLibrary.simpleMessage("Flutter 应用"),
    "titleMsg" : MessageLookupByLibrary.simpleMessage("测试内容"),
    "userNameOrPasswordWrong" : MessageLookupByLibrary.simpleMessage("账号或密码错误")
  };
}
