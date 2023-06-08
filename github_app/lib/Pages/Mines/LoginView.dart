import 'package:dfflutterdemo/pages/Mines/LoginMsgCode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String mobile = '';
  bool hasEnterMsgCode = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('大可--------------------loginView释放');
    super.dispose();
  }

  void _requetMsgCode(BuildContext context) {
    // LoginRequestDao.fetch(mobile).then((value) {
    //   if (kDebugMode) {
    //     print('大可---------------获取获取验证码$value');
    //   }
    // }).catchError((e) {
    //   if (kDebugMode) {
    //     print('大可---------------获取获取验证码失败$e');
    //   }
    // });
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => LoginMsgCode(mobile: mobile)));
  }

  void _textFieldChanged(String value) {
    if (kDebugMode) {
      var length = value.length;
      print('大可---------------获取文案变化:$value,$length');
      if (value.length == 11) {
        setState(() {
          mobile = value;
          hasEnterMsgCode = true;
        });
      } else {
        setState(() {
          hasEnterMsgCode = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://img08.lechebangstatic.com/share/toc/taro/common/loginShadow.png',
                    fit: BoxFit.cover,
                  ),
                  SingleChildScrollView(
                      child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            //跳转返回
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20, 34 + 12, 0, 0),
                            child: Image.network(
                              'https://img08.lechebangstatic.com/share/toc/taro/common/nav_back.png',
                              fit: BoxFit.cover,
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth,
                          height: screenHeight - 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24))),
                                margin:
                                    const EdgeInsets.fromLTRB(30, 0, 30, 30),
                                height: 48,
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: TextField(
                                  cursorColor: Colors.black,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.phone,
                                  onChanged: _textFieldChanged,
                                  decoration: const InputDecoration(
                                      hintText: '请输入手机号',
                                      hintMaxLines: 20,
                                      border: InputBorder.none),
                                ),
                              ),
                              InkWell(
                                onTap: hasEnterMsgCode
                                    ? () {
                                        //调用方法
                                        _requetMsgCode(context);
                                      }
                                    : null,
                                child: Container(
                                  width: screenWidth - 70,
                                  alignment: Alignment.center,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: hasEnterMsgCode
                                        ? Colors.red
                                        : Colors.grey,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(24)),
                                  ),
                                  margin:
                                      const EdgeInsets.fromLTRB(30, 0, 30, 0),
                                  child: const Text(
                                    '获取验证码',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              )),
        ));
  }
}
