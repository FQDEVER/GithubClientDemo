import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dfflutterdemo/common/Global.dart';
import 'package:dfflutterdemo/models/index.dart';
// import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
export 'package:dio/dio.dart' show DioError;

class Git {
  // 在网络请求过程中可能会需要使用当前的context信息，比如在请求失败时
  // 打开一个新路由，而打开新路由需要context信息。
  Git([this.context]) {
    _options = Options(extra: {"context": context});
  }

  BuildContext? context;
  late Options _options;
  static Dio dio = Dio(BaseOptions(
    baseUrl: 'https://api.github.com/',
    headers: {
      HttpHeaders.acceptHeader: "application/vnd.github.squirrel-girl-preview,"
          "application/vnd.github.symmetra-preview+json",
    },
  ));

  static void init() {
    // 添加缓存插件
    dio.interceptors.add(Global.netCache);
    // 设置用户token（可能为null，代表未登录）
    dio.options.headers[HttpHeaders.authorizationHeader] =
        Global.profile.token ?? '';

    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    // if (!Global.isRelease) {
    //   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //       (client) {
    //     // client.findProxy = (uri) {
    //     //   return 'PROXY 192.168.50.154:8888';
    //     // };
    //     //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
    //     client.badCertificateCallback =
    //         (X509Certificate cert, String host, int port) => true;
    //   };
    // }
  }

  // 登录接口，登录成功后返回用户信息
  Future<User> login(String login, String pwd) async {
    // String basic = 'Basic ${base64.encode(utf8.encode('$login:$pwd'))}';
    // var r = await dio.get(
    //   "/user",
    //   options: _options.copyWith(headers: {
    //     HttpHeaders.authorizationHeader: basic
    //   }, extra: {
    //     "noCache": true, //本接口禁用缓存
    //   }),
    // );
    // //登录成功后更新公共头（authorization），此后的所有请求都会带上用户身份信息
    // dio.options.headers[HttpHeaders.authorizationHeader] = basic;
    // //清空所有缓存
    // Global.netCache.cache.clear();
    // //更新profile中的token信息
    // Global.profile.token = basic;
    // // var r =
    // //     '{"login":"FQDEVER","id":20611833,"node_id":"MDQ6VXNlcjIwNjExODMz","avatar_url":"https://avatars.githubusercontent.com/u/20611833?v=4","gravatar_id":"","url":"https://api.github.com/users/FQDEVER","html_url":"https://github.com/FQDEVER","followers_url":"https://api.github.com/users/FQDEVER/followers","following_url":"https://api.github.com/users/FQDEVER/following{/other_user}","gists_url":"https://api.github.com/users/FQDEVER/gists{/gist_id}","starred_url":"https://api.github.com/users/FQDEVER/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/FQDEVER/subscriptions","organizations_url":"https://api.github.com/users/FQDEVER/orgs","repos_url":"https://api.github.com/users/FQDEVER/repos","events_url":"https://api.github.com/users/FQDEVER/events{/privacy}","received_events_url":"https://api.github.com/users/FQDEVER/received_events","type":"User","site_admin":false,"name":"FQRUNING","company":null,"blog":"","location":"ShenZhen.China","email":null,"hireable":null,"bio":"Show up","twitter_username":null,"public_repos":30,"public_gists":0,"followers":0,"following":0,"created_at":"2016-07-23T11:29:41Z","updated_at":"2023-06-07T06:49:27Z"}';
    // // var resut = json.decode(r);
    // // print('大可-------------------->jsonStr:$r');
    // var data = r.data;
    // print('大可---------------------------->$data');
    // return User.fromJson(data);

    var login1 = 'FQDEVER';
    var pwd1 =
        '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';
    String basic = 'Basic ${base64.encode(utf8.encode('$login1:$pwd1'))}';
    print('大可-------------------请求结果:$basic');

    //登录成功后更新公共头（authorization），此后的所有请求都会带上用户身份信息
    dio.options.headers[HttpHeaders.authorizationHeader] = basic;
    //清空所有缓存
    Global.netCache.cache.clear();
    //更新profile中的token信息
    Global.profile.token = basic;
    //保存到缓存中
    var r =
        '{"login":"FQDEVER","id":20611833,"node_id":"MDQ6VXNlcjIwNjExODMz","avatar_url":"https://avatars.githubusercontent.com/u/20611833?v=4","gravatar_id":"","url":"https://api.github.com/users/FQDEVER","html_url":"https://github.com/FQDEVER","followers_url":"https://api.github.com/users/FQDEVER/followers","following_url":"https://api.github.com/users/FQDEVER/following{/other_user}","gists_url":"https://api.github.com/users/FQDEVER/gists{/gist_id}","starred_url":"https://api.github.com/users/FQDEVER/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/FQDEVER/subscriptions","organizations_url":"https://api.github.com/users/FQDEVER/orgs","repos_url":"https://api.github.com/users/FQDEVER/repos","events_url":"https://api.github.com/users/FQDEVER/events{/privacy}","received_events_url":"https://api.github.com/users/FQDEVER/received_events","type":"User","site_admin":false,"name":"FQRUNING","company":null,"blog":"","location":"ShenZhen.China","email":null,"hireable":null,"bio":"Show up","twitter_username":null,"public_repos":30,"public_gists":0,"followers":0,"following":0,"created_at":"2016-07-23T11:29:41Z","updated_at":"2023-06-07T06:49:27Z"}';
    var resut = json.decode(r);
    print('大可-------------------->jsonStr:$r');
    // var data = r.data;
    print('大可---------------------------->$resut');
    return User.fromJson(resut);
  }

  //获取用户项目列表
  Future<List<Repo>> getRepos({
    Map<String, dynamic>? queryParameters, //query参数，用于接收分页信息
    refresh = false,
  }) async {
    if (refresh) {
      // 列表下拉刷新，需要删除缓存（拦截器中会读取这些信息）
      _options.extra!.addAll({"refresh": true, "list": true});
    }
    var r = await dio.get<List>(
      "user/repos",
      queryParameters: queryParameters,
      options: _options,
    );
    print('大可---------------------------->r:$r');
    var data = r.data;
    print('大可---------------------------->$data');
    return r.data!.map((e) => Repo.fromJson(e)).toList();
  }
}

class DefaultHttpClientAdapter {
  late Null Function(dynamic client) onHttpClientCreate;
}
