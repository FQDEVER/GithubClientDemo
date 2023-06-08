// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cacheConfig.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CacheConfig _$CacheConfigFromJson(Map<String, dynamic> json) {
  var config = CacheConfig()
    ..enable = json['enable'] as bool
    ..maxAge = json['maxAge'] as num
    ..maxCount = json['maxCount'] as num;
  return config;
}

Map<String, dynamic> _$CacheConfigToJson(CacheConfig instance) =>
    <String, dynamic>{
      'enable': instance.enable,
      'maxAge': instance.maxAge,
      'maxCount': instance.maxCount,
    };
