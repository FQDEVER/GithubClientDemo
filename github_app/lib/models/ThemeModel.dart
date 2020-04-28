


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_app/common/Global.dart';
import 'package:github_app/common/ProfileChangeNotifier.dart';
import 'package:github_app/models/user.dart';

class ThemeModel extends ProfileChangeNotifier{

  //get方法.获取用户对象.也就是firstWhere里面有满足条件element.value == profile.theme.有则使用.如果没有则默认用Colors.blue
  ColorSwatch get theme => Global.themes.firstWhere((element) => element.value == profile.theme,orElse: ()=> Colors.blue);

  //主题发生变化时.通知其依赖项.新主题会立即生效
  set theme(ColorSwatch color){
    if(color != theme){
      profile.theme = color[500].value;
      notifyListeners();
    }
  }

}