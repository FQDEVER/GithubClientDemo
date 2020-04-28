

import 'package:flutter/cupertino.dart';
import 'package:github_app/common/ProfileChangeNotifier.dart';

class LocaleModel extends ProfileChangeNotifier{

  //首先获取当前用户的app语言配置local类.如果为null.则语言跟随系统语言
  Locale getLocale(){
    if(profile.locale == null){
      return null;
    }
    var t = profile.locale.split("_");
    //语言.国家/地区
    return Locale(t[0],t[1]);
  }

  String get locale => profile.locale;

  set locale(String locale){
    if(locale != profile.locale){
       profile.locale = locale;
       notifyListeners();
    }
  }
}