import 'package:dfflutterdemo/l10n/localization_intl.dart';
import 'package:dfflutterdemo/models/LocaleModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageRoute extends StatefulWidget {
  const LanguageRoute({super.key});

  @override
  State<LanguageRoute> createState() => _LanguageRouteState();
}

class _LanguageRouteState extends State<LanguageRoute> {
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    var localeModel = Provider.of<LocaleModel>(context);
    var gm = GmLocalizations.of(context);

    Widget _buildLanguageItem(String lan, String? value) {
      return ListTile(
        title: Text(
          lan,
          style: TextStyle(color: localeModel.locale == value ? color : null),
        ),
        trailing:
            localeModel.locale == value ? Icon(Icons.done, color: color) : null,
        onTap: () {
          localeModel.locale = value;
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(gm!.language),
      ),
      body: ListView(
        children: [
          _buildLanguageItem('简体中文', 'zh_CN'),
          _buildLanguageItem('English', 'en_US'),
          _buildLanguageItem(gm.auto, null),
        ],
      ),
    );
  }
}
