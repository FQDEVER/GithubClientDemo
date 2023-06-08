import 'package:dfflutterdemo/common/Global.dart';
import 'package:dfflutterdemo/common/ProfileChangeNotifier.dart';
import 'package:dfflutterdemo/models/index.dart';

class UserModel extends ProfileChangeNotifier {
  User? get user => Global.profile.user;

  // APP是否登录(如果有用户信息，则证明登录过)
  bool get isLogin => user != null;

  //用户信息发生变化，更新用户信息并通知依赖它的子孙Widgets更新
  set user(User? user) {
    if (user?.login != Global.profile.user?.login) {
      final tempUser = Global.profile.user;
      if (tempUser != null) {
        Global.profile.lastLogin = tempUser.login;
      }
      Global.profile.user = user;
      notifyListeners();
    }
  }
}
