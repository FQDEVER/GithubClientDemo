import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
class S implements WidgetsLocalizations {
  const S();

  static S current;

  static const GeneratedLocalizationsDelegate delegate =
    GeneratedLocalizationsDelegate();

  static S of(BuildContext context) => Localizations.of<S>(context, S);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get AppHasLogOut => "AppHasLogOut";
  String get AppLogOut => "AppLogOut";
  String get Cancel => "Cancel";
  String get Confirm => "Confirm";
  String get app_auto => "System";
  String get app_language => "AppLanguage";
  String get app_login => "App Login";
  String get app_test => "app_test";
  String get app_theme => "AppThemeColor";
  String get app_title => "app_name";
  String get password => "Password";
  String get passwordRequired => "PasswordRequired";
  String get userName => "UserName";
  String get userNameOrEmail => "UserNameOrEmail";
  String get userNameOrPasswordWrong => "UserNameOrPasswordWrong";
  String get userNameRequired => "UserNameRequired";
}

class $en_US extends S {
  const $en_US();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get app_language => "AppLanguage";
  @override
  String get userNameOrEmail => "UserNameOrEmail";
  @override
  String get Cancel => "Cancel";
  @override
  String get app_title => "app_name";
  @override
  String get app_login => "App Login";
  @override
  String get AppHasLogOut => "AppHasLogOut";
  @override
  String get Confirm => "Confirm";
  @override
  String get app_test => "app_test";
  @override
  String get userName => "UserName";
  @override
  String get app_theme => "AppThemeColor";
  @override
  String get passwordRequired => "PasswordRequired";
  @override
  String get AppLogOut => "AppLogOut";
  @override
  String get password => "Password";
  @override
  String get userNameOrPasswordWrong => "UserNameOrPasswordWrong";
  @override
  String get userNameRequired => "UserNameRequired";
  @override
  String get app_auto => "System";
}

class $en extends S {
  const $en();
}

class $zh_CN extends S {
  const $zh_CN();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get app_language => "app语言";
  @override
  String get userNameOrEmail => "用户名或邮箱";
  @override
  String get Cancel => "取消";
  @override
  String get app_title => "App标题";
  @override
  String get app_login => "App登录";
  @override
  String get AppHasLogOut => "是否确定退出登录";
  @override
  String get Confirm => "确定";
  @override
  String get app_test => "App测试";
  @override
  String get userName => "用户名";
  @override
  String get app_theme => "主题颜色";
  @override
  String get passwordRequired => "密码不能为空";
  @override
  String get AppLogOut => "退出登录";
  @override
  String get password => "密码";
  @override
  String get userNameOrPasswordWrong => "用户名或密码错误";
  @override
  String get userNameRequired => "用户名不能为空";
  @override
  String get app_auto => "跟随系统";
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", "US"),
      Locale("en", ""),
      Locale("zh", "CN"),
    ];
  }

  LocaleListResolutionCallback listResolution({Locale fallback, bool withCountry = true}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported, withCountry);
      }
    };
  }

  LocaleResolutionCallback resolution({Locale fallback, bool withCountry = true}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported, withCountry);
    };
  }

  @override
  Future<S> load(Locale locale) {
    final String lang = getLang(locale);
    if (lang != null) {
      switch (lang) {
        case "en_US":
          S.current = const $en_US();
          return SynchronousFuture<S>(S.current);
        case "en":
          S.current = const $en();
          return SynchronousFuture<S>(S.current);
        case "zh_CN":
          S.current = const $zh_CN();
          return SynchronousFuture<S>(S.current);
        default:
          // NO-OP.
      }
    }
    S.current = const S();
    return SynchronousFuture<S>(S.current);
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale, true);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;

  ///
  /// Internal method to resolve a locale from a list of locales.
  ///
  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported, bool withCountry) {
    if (locale == null || !_isSupported(locale, withCountry)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  ///
  /// Returns true if the specified locale is supported, false otherwise.
  ///
  bool _isSupported(Locale locale, bool withCountry) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        // Language must always match both locales.
        if (supportedLocale.languageCode != locale.languageCode) {
          continue;
        }

        // If country code matches, return this locale.
        if (supportedLocale.countryCode == locale.countryCode) {
          return true;
        }

        // If no country requirement is requested, check if this locale has no country.
        if (true != withCountry && (supportedLocale.countryCode == null || supportedLocale.countryCode.isEmpty)) {
          return true;
        }
      }
    }
    return false;
  }
}

String getLang(Locale l) => l == null
  ? null
  : l.countryCode != null && l.countryCode.isEmpty
    ? l.languageCode
    : l.toString();
