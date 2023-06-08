// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  var profile = Profile()
    ..user = User.fromJson(json['user'] as Map<String, dynamic>)
    ..token = json['token'] as String?
    ..theme = json['theme'] as num
    ..cache = CacheConfig.fromJson(json['cache'] as Map<String, dynamic>)
    ..lastLogin = json['lastLogin'] as String?
    ..locale = json['locale'] as String?;
  return profile;
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
      'theme': instance.theme,
      'cache': instance.cache,
      'lastLogin': instance.lastLogin,
      'locale': instance.locale,
    };
