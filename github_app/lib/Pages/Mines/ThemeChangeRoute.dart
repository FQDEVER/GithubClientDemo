import 'package:dfflutterdemo/common/Global.dart';
import 'package:dfflutterdemo/l10n/localization_intl.dart';
import 'package:dfflutterdemo/models/ThemeModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeChangeRoute extends StatefulWidget {
  const ThemeChangeRoute({super.key});

  @override
  State<ThemeChangeRoute> createState() => _ThemeChangeRouteState();
}

class _ThemeChangeRouteState extends State<ThemeChangeRoute> {
  var themes = Global.themes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GmLocalizations.of(context)!.themeColor),
      ),
      body: ListView(
          children: themes.map((element) {
        return GestureDetector(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Container(
              color: element,
              height: 40,
            ),
          ),
          onTap: () {
            Provider.of<ThemeModel>(context, listen: false).theme = element;
          },
        );
      }).toList()),
    );
  }
}
