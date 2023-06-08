import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart'; //1

/*
  自己写个脚本.
  intl.sh
  执行国际化命令
 */

class GmLocalizations {
  static Future<GmLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode!.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    //2
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return GmLocalizations();
    });
  }

  static GmLocalizations? of(BuildContext context) {
    return Localizations.of<GmLocalizations>(context, GmLocalizations);
  }

  String get title {
    return Intl.message(
      'Flutter APP',
      name: 'title',
      desc: 'Title for the Demo application',
    );
  }

  remainingEmailsMessage(int howMany) => Intl.plural(howMany,
      zero: 'There are no emails left',
      one: 'There is $howMany email left',
      other: 'There are $howMany emails left',
      name: "remainingEmailsMessage",
      args: [howMany],
      desc: "How many emails remain after archiving.",
      examples: const {'howMany': 42, 'userName': 'Fred'});

  String get titleMsg {
    return Intl.message(
      'test content',
      name: 'titleMsg',
      desc: 'test content for the Demo application',
    );
  }

  String get mineTitle {
    return Intl.message(
      'Mine',
      name: 'mineTitle',
      desc: '我的标题',
    );
  }

  String get loginTitle {
    return Intl.message(
      'Login',
      name: 'loginTitle',
      desc: '登录按钮提示语',
    );
  }

  String get noDescription {
    return Intl.message(
      'noDescription',
      name: 'noDescription',
      desc: '--',
    );
  }

  String get themeColor {
    return Intl.message(
      'ThemeColor',
      name: 'themeColor',
      desc: 'changeThemeColor',
    );
  }

  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '语言',
    );
  }

  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '登出',
    );
  }

  String get logoutTip {
    return Intl.message(
      'Logout Confirm?',
      name: 'logoutTip',
      desc: '确定登出',
    );
  }

  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '取消',
    );
  }

  String get auto {
    return Intl.message(
      'Auto',
      name: 'auto',
      desc: '跟随系统',
    );
  }

  String get userNameOrPasswordWrong {
    return Intl.message(
      'UserName Or Password Wrong!',
      name: 'userNameOrPasswordWrong',
      desc: '账号或密码错误',
    );
  }
}

//Locale代理类
class GmLocalizationsDelegate extends LocalizationsDelegate<GmLocalizations> {
  const GmLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<GmLocalizations> load(Locale locale) {
    //3
    return GmLocalizations.load(locale);
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(GmLocalizationsDelegate old) => false;
}
