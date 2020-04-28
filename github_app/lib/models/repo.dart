
import 'user.dart';

class Repo {
    int id;
    String name;
    String full_name;
    User owner;
    bool private;
    String description;
    bool fork;
    String language;
    int forks_count;
    int stargazers_count;
    int size;
    String default_branch;
    int open_issues_count;
    String pushed_at;
    String created_at;
    String updated_at;
    int subscribers_count;

    Repo(
        {this.id,
            this.name,
            this.full_name,
            this.owner,
            this.private,
            this.description,
            this.fork,
            this.language,
            this.forks_count,
            this.stargazers_count,
            this.size,
            this.default_branch,
            this.open_issues_count,
            this.pushed_at,
            this.created_at,
            this.updated_at,
            this.subscribers_count});

    Repo.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        full_name = json['full_name'];
        owner = json['owner'] == null ? null : User.fromJson(json['owner'] as Map<String, dynamic>);
        private = json['private'];
        description = json['description'];
        fork = json['fork'];
        language = json['language'];
        forks_count = json['forks_count'];
        stargazers_count = json['stargazers_count'];
        size = json['size'];
        default_branch = json['default_branch'];
        open_issues_count = json['open_issues_count'];
        pushed_at = json['pushed_at'];
        created_at = json['created_at'];
        updated_at = json['updated_at'];
        subscribers_count = json['subscribers_count'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['name'] = this.name;
        data['full_name'] = this.full_name;
        data['owner'] = this.owner;
        data['private'] = this.private;
        data['description'] = this.description;
        data['fork'] = this.fork;
        data['language'] = this.language;
        data['forks_count'] = this.forks_count;
        data['stargazers_count'] = this.stargazers_count;
        data['size'] = this.size;
        data['default_branch'] = this.default_branch;
        data['open_issues_count'] = this.open_issues_count;
        data['pushed_at'] = this.pushed_at;
        data['created_at'] = this.created_at;
        data['updated_at'] = this.updated_at;
        data['subscribers_count'] = this.subscribers_count;
        return data;
    }
}