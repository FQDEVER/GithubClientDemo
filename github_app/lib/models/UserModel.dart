

import 'package:github_app/common/ProfileChangeNotifier.dart';
import 'package:github_app/models/user.dart';

class UserModel extends ProfileChangeNotifier{

  //get方法.获取用户对象
  User get user => profile.user;
  //get方法.获取是否登录
  bool get isLogin => user != null;

  //用户信息发生变化时.更新用户信息并通知到依赖它的子孙Widgets更新
  set user(User user){
    if(user?.login != profile.user?.login){
      profile.lastLogin = profile.user?.login;
      profile.user = user;
      notifyListeners();
    }
  }

}