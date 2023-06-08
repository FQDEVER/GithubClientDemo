import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User();

  late String login;
  late num id;
  late String node_id;
  late String avatar_url;
  late String gravatar_id;
  late String url;
  late String html_url;
  late String followers_url;
  late String following_url;
  late String gists_url;
  late String starred_url;
  late String subscriptions_url;
  late String organizations_url;
  late String repos_url;
  late String events_url;
  late String received_events_url;
  late String type;
  late bool site_admin;
  late String name;
  String? company;
  late String blog;
  late String location;
  String? email;
  String? hireable;
  late String bio;
  String? twitter_username;
  late num public_repos;
  late num public_gists;
  late num followers;
  late num following;
  late String created_at;
  late String updated_at;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
