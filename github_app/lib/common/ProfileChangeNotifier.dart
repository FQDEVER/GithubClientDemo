import 'package:dfflutterdemo/common/Global.dart';
import 'package:dfflutterdemo/models/index.dart';
import 'package:flutter/foundation.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  Profile get _profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile(); //保存Profile变更
    super.notifyListeners(); //通知依赖的Widget更新
  }
}
