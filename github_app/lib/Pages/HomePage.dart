import 'dart:convert';

import 'package:dfflutterdemo/common/Git.dart';
import 'package:dfflutterdemo/l10n/localization_intl.dart';
import 'package:dfflutterdemo/models/UserModel.dart';
import 'package:dfflutterdemo/models/index.dart';
import 'package:dfflutterdemo/widgets/RepoItem.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const loadingTag = "##loading##"; //表尾标记
  final _items = <Repo>[Repo()..name = loadingTag];
  bool hasMore = true; //是否还有数据
  int page = 1; //当前请求的是第几页
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    if (kDebugMode) {
      print('大可----------------加载中');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('大可--------------------HomePage释放');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('首页'),
      ),
      backgroundColor: Colors.grey[200],
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    UserModel userModel = Provider.of<UserModel>(context);
    String loginStr = GmLocalizations.of(context)!.loginTitle;
    if (!userModel.isLogin) {
      return Center(
          child: ElevatedButton(
        onPressed: () => Navigator.of(context).pushNamed('login'),
        child: Text(loginStr),
      ));
    } else {
      if (kDebugMode) {
        var length = _items.length;
        print(
          '大可--------------->_items.length:$length',
        );
      }
      //已登录，则显示项目列表
      return RefreshIndicator(
          onRefresh: _onRefresh,
          child: ListView.separated(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              print('大可--------------->loadingTag:$loadingTag');
              //如果到了表尾
              if (_items[index].name == loadingTag) {
                print('大可--------------->hasMore:$hasMore');
                //不足100条，继续获取数据
                if (hasMore) {
                  //获取数据
                  _retrieveData();
                  //加载时显示loading
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: const SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: CircularProgressIndicator(strokeWidth: 2.0),
                    ),
                  );
                } else {
                  //已经加载了100条数据，不再获取数据。
                  return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16.0),
                    child: const Text(
                      "没有更多了",
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }
              }
              //显示单词列表项
              return RepoItem(_items[index]);
            },
            separatorBuilder: (context, index) => const Divider(height: .0),
          ));
    }
  }

  //下拉刷新
  Future _onRefresh() async {
    setState(() {
      _items.clear();
      _items.insert(0, Repo()..name = loadingTag);
      page = 1;
    });
    _retrieveData();
  }

  //请求数据
  void _retrieveData() async {
    var data = await Git(context).getRepos(
      queryParameters: {
        'page': page,
        'page_size': 10,
      },
    );
    print('大可-------------------请求结果:$data');
    //如果返回的数据小于指定的条数，则表示没有更多数据，反之则否
    hasMore = data.isNotEmpty && data.length % 10 == 0;
    //把请求到的新数据添加到items中
    setState(() {
      _items.insertAll(_items.length - 1, data);
      page++;
    });
  }
}
