

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github_app/common/CacheObject.dart';
import 'package:github_app/models/cacheConfig.dart';
import 'package:github_app/models/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:github_app/common/Git.dart';

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];


class Global {

  //全局持久化对象
  static SharedPreferences _prefs;
  //这个是项目设置对象
  static Profile profile = Profile();
  //网络缓存对象
  static NetCache netCache = NetCache();
  //主题色
  static List<MaterialColor> themes =  _themes;
  //是否为release版本
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");
  //初始化全局信息.会在App启动时执行.
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    var _profile = _prefs.getString("profile");
    if(_profile != null){
      try{
        profile = Profile.fromJson(jsonDecode(_profile));
      }catch(e){
        print(e);
      }
    }

    profile.cache = profile.cache ?? CacheConfig()
    ..enable = true
    ..maxAge = 3600
    ..maxCount = 100;

    Git.init();

  }

  //持久化Profile信息.保存最新的项目设置
  static saveProfile(){
    _prefs.setString("profile", jsonEncode(profile.toJson()));
  }

}