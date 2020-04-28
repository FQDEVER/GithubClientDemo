
import 'package:flutter/material.dart';
import 'package:github_app/common/Global.dart';
import '../generated/i18n.dart';
import 'package:provider/provider.dart';
import 'package:github_app/models/ThemeModel.dart';

class ThemeChangeRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var themeModel = Provider.of<ThemeModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).app_theme),
      ),
      body: ListView( //显示主题色块
        children: Global.themes.map<Widget>((e) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              child: Container(
                color: e,
                height: 40,
              ),
            ),
            onTap: () {
              //主题更新后，MaterialApp会重新build
              themeModel.theme = e;
            },
          );
        }).toList(),
      ),
    );
  }
}