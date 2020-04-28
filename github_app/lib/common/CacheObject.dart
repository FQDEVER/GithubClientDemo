
import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:github_app/common/Global.dart';

class CacheObject{

  //初始化当前时间戳
  CacheObject(this.response):timeStamp = DateTime.now().millisecondsSinceEpoch;

  Response response; //响应数据
  int timeStamp; //创建时间

  @override
  bool operator ==(other) {
    // TODO: implement ==
    return response.hashCode == other.hashCode;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => response.realUri.hashCode;

}

class NetCache extends Interceptor {

  var cache = LinkedHashMap<String,CacheObject>();

  @override
  Future onRequest(RequestOptions options) async {

    //不做缓存.直接返回
    if(!Global.profile.cache.enable){
      return options;
    }

    //标记是否是下拉刷新
    bool refresh = options.extra["refresh"] == true;

    //如果是下拉刷新.先删除相关缓存
    if(refresh){
      if(options.extra["list"] == true){
        //若是列表.则只是url中包含当前path的缓存全部删除
        cache.removeWhere((key, value) => key.contains(options.path));
      }else{
        //若不是列表.则只删除uri相同的缓存
        cache.remove(options.uri.toString());
      }
      return options;
    }

    //有缓存.并且是get方式请求
    if(options.extra["noCache"] != true && options.method.toLowerCase() == 'get'){

      //获取缓存key - 如果没有就是请求uri
      String key = options.extra["cacheKey"] ?? options.uri.toString();

      var ob = cache[key];

      if(ob != null){
        //若缓存未过期.则返回缓存内容
        if(DateTime.now().millisecondsSinceEpoch - ob.timeStamp / 1000 < Global.profile.cache.maxAge){
          return cache[key].response;
        }else{
          //若已过期.则删除缓存.继续向服务器请求
          cache.remove(key);
        }
      }
    }
  }

  @override
  Future onError(DioError err) {
    // TODO: implement onError
    //错误状态不缓存
  }

  @override
  Future onResponse(Response response) {
    // TODO: implement onResponse
    if(Global.profile.cache.enable){
      //保存缓存信息
      _saveCache(response);
    }
  }

  _saveCache(Response object){
    RequestOptions options = object.request;
    if(options.extra["noCache"] != true && options.method.toLowerCase() == "get"){
      //如果缓存超过最大数量限制.则先移除最早的一条记录
      if(cache.length == Global.profile.cache.maxCount){
        cache.remove(cache[cache.keys.first]);
      }
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      cache[key] = CacheObject(object);
    }
  }


}