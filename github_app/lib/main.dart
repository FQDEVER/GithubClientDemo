import 'package:dfflutterdemo/NavigationManager.dart';
import 'package:dfflutterdemo/Pages/Mines/LanguageRoute.dart';
import 'package:dfflutterdemo/Pages/Mines/LoginCita.dart';
import 'package:dfflutterdemo/Pages/Mines/ThemeChangeRoute.dart';
import 'package:dfflutterdemo/common/Global.dart';
import 'package:dfflutterdemo/l10n/localization_intl.dart';
import 'package:dfflutterdemo/models/LocaleModel.dart';
import 'package:dfflutterdemo/models/ThemeModel.dart';
import 'package:dfflutterdemo/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//Global.init().then((value) =>
void main() => Global.init().then((value) {
      return runApp(const MyApp());
    });

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => LocaleModel()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
      ],
      child: Consumer2<ThemeModel, LocaleModel>(
          builder: (BuildContext context, themeModel, localeModel, child) {
        return OKToast(
            child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: themeModel.theme,
          ),
          onGenerateTitle: (context) {
            return GmLocalizations.of(context)!.title;
          },
          home: const TabNavigator(),
          locale: localeModel.getLocale(),
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('zh', 'CN'),
            //添加其他
          ],
          localizationsDelegates: const [
            // 本地化的代理类
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GmLocalizationsDelegate()
          ],
          localeResolutionCallback: (_locale, supportedLocales) {
            if (localeModel.getLocale() != null) {
              //如果已经选择了语言.就不跟随系统
              return localeModel.getLocale();
            } else {
              //跟随系统
              Locale locale;
              if (supportedLocales.contains(_locale)) {
                locale = _locale!;
              } else {
                //如果系统语言不是中文或者英文.则默认使用英文
                locale = const Locale('en', 'US');
              }
              return locale;
            }
          },
          //注册路由表
          routes: <String, WidgetBuilder>{
            'login': (context) => const LoginCita(),
            'themes': (context) => const ThemeChangeRoute(),
            'language': (context) => const LanguageRoute(),
          },
        ));
      }),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
