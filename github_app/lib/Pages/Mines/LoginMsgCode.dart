import 'dart:async';

import 'package:dfflutterdemo/NavigationManager.dart';
import 'package:dfflutterdemo/common/LoadingControl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class LoginMsgCode extends StatefulWidget {
  final String mobile;
  //required 必须传递的  非必须可以添加?
  const LoginMsgCode({Key? key, required this.mobile}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<LoginMsgCode> createState() => _LoginMsgCodeState(mobile: mobile);
}

class _LoginMsgCodeState extends State<LoginMsgCode> {
  String mobile;
  bool _isloading = false;
  Timer? _timer;
  _LoginMsgCodeState({required this.mobile});
  void _msgCodeChangeValue(String codeStr) {
    if (codeStr.length == 6) {
      //请求并跳转至首页
      showToast('请求数据');
      setState(() {
        _isloading = true;
      });
      int count = 0;
      //开启定时器
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        count++;
        if (kDebugMode) {
          print('大可---------------定时器$count');
        }
        if (count == 5) {
          timer.cancel();
          //跳转并关闭当前页面
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const TabNavigator()),
            (route) {
              print('大可---------------所有的页面信息:$route');
              return route == null;
            },
          );
        }
      });
    }
  }

  void _clickCover() {
    setState(() {
      _isloading = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('大可--------------------loginMsgCode释放');
    setState(() {
      _isloading = false;
    });
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginControl(
        isloading: _isloading,
        cover: true,
        clickCover: _clickCover,
        hasBgWhite: true,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text(''),
            ),
            body: Container(
              margin: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '请输入验证码',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text('验证码已发送至 ${widget.mobile}'),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                      child: TextField(
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            )),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.red,
                              width: 1.0,
                            ))),
                        cursorColor: Colors.grey,
                        autofocus: true,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        onChanged: _msgCodeChangeValue,
                      )),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 30),
                    child: Text(
                      'xx秒后重新获取验证码',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
