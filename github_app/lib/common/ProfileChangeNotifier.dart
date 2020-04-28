
import 'package:flutter/cupertino.dart';
import 'package:github_app/common/Global.dart';
import 'package:github_app/models/index.dart';


class ProfileChangeNotifier extends ChangeNotifier{
  //不能加_.这个代表私有的.子类使用不了
  Profile get profile => Global.profile;

  @override
  void notifyListeners(){
    //保存Profile变更
    Global.saveProfile();
    //通知依赖的Widget更新
    super.notifyListeners();
  }
}