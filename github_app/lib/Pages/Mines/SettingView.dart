import 'package:dfflutterdemo/l10n/localization_intl.dart';
import 'package:dfflutterdemo/models/UserModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: Container(child: _buildMenus()),
    );
  }

  Widget _buildMenus() {
    return Consumer<UserModel>(
        builder: (BuildContext context, UserModel userModel, Widget? child) {
      var gm = GmLocalizations.of(context);
      return ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.color_lens, color: Colors.grey),
            title: Text(
              gm!.themeColor,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            onTap: () => {
              Navigator.pushNamed(context, 'themes'),
            },
          ),
          ListTile(
            leading: const Icon(Icons.language, color: Colors.grey),
            title: Text(
              gm.language,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            onTap: () => {
              Navigator.pushNamed(context, 'language'),
            },
          ),
          if (userModel.isLogin)
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.grey),
              title: Text(
                gm.logout,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              onTap: () => {
                //弹出二次确认弹框
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        content: Text(gm.logoutTip),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(gm.cancel)),
                          TextButton(
                              onPressed: () {
                                userModel.user = null;
                                Navigator.pop(context);
                              },
                              child: Text(gm.logout)),
                        ],
                      );
                    })
              },
            ),
        ],
      );
    });
  }
}
