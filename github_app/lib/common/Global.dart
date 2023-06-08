import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dfflutterdemo/common/CacheObject.dart';
import 'package:dfflutterdemo/models/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dfflutterdemo/common/Git.dart';

import '../models/cacheConfig.dart';

// 提供五套可选主题色
const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Global {
  static SharedPreferences? _prefs;
  static Profile profile = Profile();
  // 网络缓存对象
  static NetCache netCache = NetCache();

  // 可选的主题列表
  static List<MaterialColor> get themes => _themes;

  // 是否为release版
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();
    var tempprofile = _prefs?.getString("profile");
    if (tempprofile != null) {
      try {
        profile = Profile.fromJson(jsonDecode(tempprofile));
      } catch (e) {
        print(e);
      }
    } else {
      // 默认主题索引为0，代表蓝色
      profile = Profile()..theme = 0;
    }
    var cache = profile.cache;
    if (kDebugMode) {
      print(
        '大可-------------------->$profile,cache:$cache',
      );
    }
    var cacheConfig = CacheConfig();
    // 如果没有缓存策略，设置默认缓存策略
    profile.cache = profile.cache ?? cacheConfig
      ..enable = true
      ..maxAge = 3600
      ..maxCount = 100;
    if (kDebugMode) {
      cache = profile.cache;
      print(
        '大可-------------------->22$profile,cache:$cache',
      );
    }
    //初始化网络请求相关配置
    Git.init();
  }

  // 持久化Profile信息
  static saveProfile() =>
      _prefs?.setString("profile", jsonEncode(profile.toJson()));
}
