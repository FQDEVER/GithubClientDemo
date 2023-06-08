// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  var user = User()
    ..login = json['login'] as String
    ..id = json['id'] as num
    ..node_id = json['node_id'] as String
    ..avatar_url = json['avatar_url'] as String
    ..gravatar_id = json['gravatar_id'] as String
    ..url = json['url'] as String
    ..html_url = json['html_url'] as String
    ..followers_url = json['followers_url'] as String
    ..following_url = json['following_url'] as String
    ..gists_url = json['gists_url'] as String
    ..starred_url = json['starred_url'] as String
    ..subscriptions_url = json['subscriptions_url'] as String
    ..organizations_url = json['organizations_url'] as String
    ..repos_url = json['repos_url'] as String
    ..events_url = json['events_url'] as String
    ..received_events_url = json['received_events_url'] as String
    ..type = json['type'] as String
    ..site_admin = json['site_admin'] as bool
    ..name = json['name'] as String
    ..company = json['company'] as String?
    ..blog = json['blog'] as String
    ..location = json['location'] as String
    ..email = json['email'] as String?
    ..hireable = json['hireable'] as String?
    ..bio = json['bio'] as String
    ..twitter_username = json['twitter_username'] as String?
    ..public_repos = json['public_repos'] as num
    ..public_gists = json['public_gists'] as num
    ..followers = json['followers'] as num
    ..following = json['following'] as num
    ..created_at = json['created_at'] as String
    ..updated_at = json['updated_at'] as String;
  return user;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'node_id': instance.node_id,
      'avatar_url': instance.avatar_url,
      'gravatar_id': instance.gravatar_id,
      'url': instance.url,
      'html_url': instance.html_url,
      'followers_url': instance.followers_url,
      'following_url': instance.following_url,
      'gists_url': instance.gists_url,
      'starred_url': instance.starred_url,
      'subscriptions_url': instance.subscriptions_url,
      'organizations_url': instance.organizations_url,
      'repos_url': instance.repos_url,
      'events_url': instance.events_url,
      'received_events_url': instance.received_events_url,
      'type': instance.type,
      'site_admin': instance.site_admin,
      'name': instance.name,
      'company': instance.company,
      'blog': instance.blog,
      'location': instance.location,
      'email': instance.email,
      'hireable': instance.hireable,
      'bio': instance.bio,
      'twitter_username': instance.twitter_username,
      'public_repos': instance.public_repos,
      'public_gists': instance.public_gists,
      'followers': instance.followers,
      'following': instance.following,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
