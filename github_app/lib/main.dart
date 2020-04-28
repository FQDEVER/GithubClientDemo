import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_app/common/Global.dart';
import 'package:github_app/common/Git.dart';
import 'package:github_app/models/LocaleModel.dart';
import 'package:github_app/models/UserModel.dart';
import 'package:github_app/models/repo.dart';
import 'package:github_app/models/ThemeModel.dart';
import 'package:github_app/routes/LanguageRoute.dart';
import 'package:github_app/routes/ThemeChangeRoute.dart';
import 'generated/i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:oktoast/oktoast.dart';
import 'package:github_app/routes/LoginRoute.dart';
import 'package:github_app/widgets/gmAvatar.dart';
import 'package:flukit/flukit.dart';
import 'package:github_app/widgets/RepoItem.dart';


void main(){
  final userModel = UserModel();
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((value) => runApp(
    MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => LocaleModel()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
      ],
      child: Consumer2<ThemeModel,LocaleModel>(
        builder: (BuildContext context,themeModel,localeModel,Widget child){
          return OKToast(
            child: MaterialApp(
              theme: ThemeData(
                primarySwatch: themeModel.theme,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              onGenerateTitle: (context){
                return S.of(context).app_title;
              },
              home: HomeRoute(),
              locale: localeModel.getLocale(),
              supportedLocales: S.delegate.supportedLocales,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              localeListResolutionCallback: (List<Locale> locales,Iterable<Locale> supportedLocales){
                if(localeModel.getLocale() != null){
                  //如果已选定语言,则不跟随系统
                  return localeModel.getLocale();
                } else{
                  Locale locale;
                  Locale _locale = locales.first;
                  if(supportedLocales.contains(_locale)){
                    locale = _locale;
                  }else{
                    locale = Locale("en","US");
                  }
                  return locale;
                }
              },
              routes: <String,WidgetBuilder>{
                "login": (context) => LoginRoute(),
                "themes": (context) => ThemeChangeRoute(),
                "language": (context) => LanguageRoute(),
              },

            ),
          );
        },
      ),
    );
  }
}



class HomeRoute extends StatefulWidget {

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(S.of(context).app_title),
      ),
      body: _buildBody(context),
      drawer: MyDrawer(), //抽屉菜单
    );
  }
}

//构建主页内容
Widget _buildBody(BuildContext context){
  UserModel userModel = Provider.of<UserModel>(context);

  if(!userModel.isLogin){
    return Center(
      child: RaisedButton(onPressed:(){
        Navigator.of(context).pushNamed("login");
      },
        child: Text(S.of(context).app_login),
      ),
    );
  }else{
    //已经登录.根据userId获取根据数据
//已登录，则展示项目列表
    return InfiniteListView<Repo>(
      onRetrieveData: (int page, List<Repo> items, bool refresh) async {
        var data = await Git(context).getRepos(
          refresh: refresh,
          queryParameters: {
            'page': page,
            'page_size': 20,
          },
        );
        //把请求到的新数据添加到items中
        items.addAll(data);
        // 如果接口返回的数量等于'page_size'，则认为还有数据，反之则认为最后一页
        return data.length==20;
      },
      itemBuilder: (List list, int index, BuildContext ctx) {
        // 项目信息列表项
        return RepoItem(repo: list[index],);
      },
    );
  }
}

//ListView<Repo>(
//onRetrieveData: (int page, List<Repo> items, bool refresh) async {
//var data = await Git(context).getRepos(
//refresh: refresh,
//queryParameters: {
//'page': page,
//'page_size': 20,
//},
//);
////把请求到的新数据添加到items中
//items.addAll(data);
//// 如果接口返回的数量等于'page_size'，则认为还有数据，反之则认为最后一页
//return data.length==20;
//},
//itemBuilder: (List list, int index, BuildContext ctx) {
//// 项目信息列表项
//return RepoItem(list[index]);
//},
//);


class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //移除顶部padding
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(), //构建抽屉菜单头部
            Expanded(child: _buildMenus()), //构建功能菜单
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Consumer<UserModel>(
      builder: (BuildContext context,UserModel value,Widget child) {
        return GestureDetector(
          child: Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(top: 40, bottom: 20),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ClipOval(
                    // 如果已登录，则显示用户头像；若未登录，则显示默认头像
                    child:value.isLogin ? gmAvatar(value.user.avatar_url, width: 80) : Image.asset(
                      "imgs/avatar-default.png",
                      width: 80,
                    ),
                  ),
                ),
                Text(
                  value.isLogin
                      ? value.user.login
                      : S.of(context).app_login,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            if (!value.isLogin) Navigator.of(context).pushNamed("login");
          },
        );
      },
    );
  }

  // 构建菜单项
  Widget _buildMenus() {
    return Consumer<UserModel>(
      builder: (BuildContext context, UserModel userModel, Widget child) {
        var gm = S.of(context);
        return ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: Text(gm.app_theme),
              onTap: () => Navigator.pushNamed(context, "themes"),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(gm.app_language),
              onTap: () => Navigator.pushNamed(context, "language"),
            ),
            if(userModel.isLogin) ListTile(
              leading: const Icon(Icons.power_settings_new),
              title: Text(gm.AppLogOut),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) {
                    //退出账号前先弹二次确认窗
                    return AlertDialog(
                      content: Text(gm.AppHasLogOut),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(gm.Cancel),
                          onPressed: () => Navigator.pop(context),
                        ),
                        FlatButton(
                          child: Text(gm.Confirm),
                          onPressed: () {
                            //该赋值语句会触发MaterialApp rebuild
                            userModel.user = null;
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
