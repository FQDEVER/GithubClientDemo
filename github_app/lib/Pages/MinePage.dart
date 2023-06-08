import 'package:dfflutterdemo/Pages/Mines/LoginCita.dart';
import 'package:dfflutterdemo/Pages/Mines/LoginView.dart';
import 'package:dfflutterdemo/Pages/Mines/SettingView.dart';
import 'package:dfflutterdemo/models/UserModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  var useDatas = [
    {
      'image': "https://img08.lechebangstatic.com/share/toc/taro/my/order.png",
      'text': "我的订单",
      'path': "/pages/My/MyOrder/index",
    },
    {
      'image':
          "https://img08.lechebangstatic.com/share/toc/taro/my/afterSale.png",
      'text': "我的售后",
      'path': "/pages/My/AfterSale/index",
    },
    {
      'image':
          "https://img08.lechebangstatic.com/share/toc/taro/my/my_medal.png",
      'text': "我的勋章",
      'path': "/pages/My/Medal/index",
    },
    {
      'image':
          "https://img08.lechebangstatic.com/share/toc/taro/my/cooperative.png",
      'text': "合伙人",
      'path': "/pages/My/NewPartner/Home/index",
    },
    {
      'image':
          "https://img08.lechebangstatic.com/share/toc/taro/my/contract.png",
      'text': "我的合同",
      'path': "/pages/My/ContractList/index",
    },
    {
      'image':
          "https://img08.lechebangstatic.com/share/toc/taro/my/rights_and_interests.png",
      'text': "我的权益",
      'path': "/pages/My/Rights/Index/index",
    },
    {
      'image': "https://img08.lechebangstatic.com/share/toc/taro/my/rescue.png",
      'text': "救援记录",
      'path': "/pages/My/ActivityWebview/index?url=",
    },
    {
      'image':
          "https://img08.lechebangstatic.com/share/toc/taro/my/pick_up.png",
      'text': "维保记录",
      'path': "/pages/Common/WebView/index?url=",
    },
  ];

  var otherDatas = [
    {
      'image': "https://img08.lechebangstatic.com/share/toc/taro/my/gift.png",
      'text': "邀请有礼",
      'path': "/pages/My/Invitation/Index/index",
    },
    {
      'image':
          "https://img08.lechebangstatic.com/share/toc/taro/my/address.png",
      'text': "收货地址",
      'path': "/pages/Common/Address/List/index?fromHome=1",
    },
    {
      'image':
          "https://img08.lechebangstatic.com/share/toc/taro/my/invoice.png",
      'text': "发票管理",
      'path': "/pages/My/InvoiceManage/InvoiceHome/index",
    },
    {
      'image':
          "https://img08.lechebangstatic.com/share/toc/taro/my/service.png",
      'text': "客服服务",
      'path':
          'https://iccs.dfpv.com.cn/yc-media/pages/web-chat.jsp?channelKey=fsxcx&keyCode=1',
    },
    {
      'image':
          "https://img08.lechebangstatic.com/share/toc/taro/my/feedback.png",
      'text': "我要反馈",
      'path': "/pages/My/Feedback/FeedbackIndex/index",
    },
    {
      'image':
          "https://img08.lechebangstatic.com/share/toc/taro/my/setting.png",
      'text': "设置",
      'path': "/pages/My/Setting/Index/index",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.network(
              'https://img08.lechebangstatic.com/share/toc/taro/my/myBg.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: RefreshIndicator(
                  onRefresh: onRefresh,
                  child: ListView(
                    children: [
                      headerView(context),
                      scoreView(context),
                      useView(context),
                      otherView(context),
                    ],
                  )))
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('大可--------------------minePage释放');
    super.dispose();
  }

  Future onRefresh() {
    return Future.delayed(const Duration(seconds: 1), () {
      if (kDebugMode) {
        print('请求数据');
      }
    });
  }

  List<SizedBox> _buildGridTileList(int count) => List.generate(count, (index) {
        var itemData = useDatas[index];
        return SizedBox(
          width: 110,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                itemData['image'] ?? '',
                fit: BoxFit.cover,
                width: 30,
                height: 30,
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    itemData['text'] ?? '暂无',
                  ))
            ],
          ),
        );
      });

  _onclickOtherDatas(int index, BuildContext context) {
    Map itemData = otherDatas[index];
    if (itemData['text'] == '设置') {
      //跳转到设置页面
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const SettingView()));
    }
  }

  List<SizedBox> _buildOtherGridTileList(int count, BuildContext context) =>
      List.generate(count, (index) {
        var itemData = otherDatas[index];
        return SizedBox(
            width: 85,
            height: 80,
            child: GestureDetector(
              onTap: () {
                _onclickOtherDatas(index, context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    itemData['image'] ?? '',
                    fit: BoxFit.cover,
                    width: 25,
                    height: 25,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        itemData['text'] ?? '暂无',
                      ))
                ],
              ),
            ));
      });

  Widget headerView(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                width: 62,
                height: 62,
                child: Image.network(
                  userModel.isLogin
                      ? userModel.user!.avatar_url
                      : 'https://img08.lechebangstatic.com/share/toc/taro/common/head.png',
                  fit: BoxFit.fill,
                ),
              ),
              InkWell(
                onTap: () {
                  if (userModel.isLogin) {
                    //跳转到个人信息页面
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginCita()));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    userModel.isLogin ? userModel.user!.name : '登录/注册',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                userItemView('发布'),
                userItemView('关注'),
                userItemView('粉丝'),
                userItemView('消息'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget userItemView(String itemStr) {
    return Column(
      children: [
        const Text(
          '-',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Text(itemStr)
      ],
    );
  }

  Widget scoreView(BuildContext context) {
    return Container(
        height: 100,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            scoreItemView('积分', '-'),
            Container(
              width: 1,
              height: 50,
              color: Colors.grey[200],
            ),
            scoreItemView('优惠券', '-'),
          ],
        ));
  }

  Widget scoreItemView(String titleStr, String valueStr) {
    return Container(
      width: 150,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  titleStr,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              // Text('$valueStr >'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(valueStr),
                  ),
                  Image.network(
                    'https://img08.lechebangstatic.com/share/toc/taro/common/right_arrow.png',
                    fit: BoxFit.fill,
                    width: 12,
                    height: 12,
                  ),
                ],
              )
            ],
          ),
          Image.network(
            titleStr == '积分'
                ? 'https://img08.lechebangstatic.com/share/toc/taro/my/score_img.png'
                : 'https://img08.lechebangstatic.com/share/toc/taro/my/coupon_img.png',
            fit: BoxFit.fill,
            width: 40,
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget useView(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white),
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                '常用功能',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Wrap(children: _buildGridTileList(useDatas.length)),
            )
          ],
        ));
  }

  Widget otherView(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white),
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                '其他功能',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Wrap(
                  children:
                      _buildOtherGridTileList(otherDatas.length, context)),
            )
          ],
        ));
  }
}
