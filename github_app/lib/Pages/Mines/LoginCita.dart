import 'package:dfflutterdemo/common/Git.dart';
import 'package:dfflutterdemo/l10n/localization_intl.dart';
import 'package:dfflutterdemo/models/UserModel.dart';
import 'package:dfflutterdemo/models/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

class LoginCita extends StatefulWidget {
  const LoginCita({super.key});

  @override
  State<LoginCita> createState() => _LoginCitaState();
}

class _LoginCitaState extends State<LoginCita> {
  String email = '';
  String password = '';
  bool hasEnterMsgCode = false;
  final GlobalKey _formKey = GlobalKey<FormState>();

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

  void _onRequetMsgCode() async {
    showLoading(context);
    User? user;
    try {
      user = await Git(context).login(email, password);
      // ignore: use_build_context_synchronously
      Provider.of<UserModel>(context, listen: false).user = user;
    } on DioError catch (e) {
      print('大可-----------------$e');
      //登录失败则提示
      if (e.response?.statusCode == 401) {
        showToast(GmLocalizations.of(context)!.userNameOrPasswordWrong);
      } else {
        showToast(e.toString());
      }
    } finally {
      // 隐藏loading框
      Navigator.of(context).pop();
    }
    //登录成功则返回
    if (user != null) {
      Navigator.of(context).pop();
    }
  }

  void _textFieldChanged(String value) {
    if (kDebugMode) {
      var length = value.length;
      print('大可---------------获取邮箱文案变化:$value,$length');
      if (value.isNotEmpty) {
        setState(() {
          email = value;
          hasEnterMsgCode = password.length >= 8;
        });
      } else {
        setState(() {
          hasEnterMsgCode = false;
        });
      }
    }
  }

  void _textFieldPasswordChanged(String value) {
    if (kDebugMode) {
      var length = value.length;
      print('大可---------------获取密码文案变化:$value,$length');
      if (value.length >= 8) {
        setState(() {
          password = value;
          hasEnterMsgCode = email.isNotEmpty;
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
                                    const EdgeInsets.fromLTRB(30, 0, 30, 10),
                                height: 48,
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: TextField(
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  onChanged: _textFieldChanged,
                                  decoration: const InputDecoration(
                                      hintText: '请输入邮箱',
                                      hintMaxLines: 20,
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24))),
                                margin:
                                    const EdgeInsets.fromLTRB(30, 0, 30, 10),
                                height: 48,
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: TextField(
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  onChanged: _textFieldPasswordChanged,
                                  decoration: const InputDecoration(
                                      hintText: '请输入密码',
                                      hintMaxLines: 20,
                                      border: InputBorder.none),
                                ),
                              ),
                              InkWell(
                                onTap: hasEnterMsgCode
                                    ? () {
                                        //调用方法
                                        _onRequetMsgCode();
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
                                    '登录',
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

void showLoading(context, [String? text]) {
  text = text ?? "Loading...";
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3.0),
                boxShadow: const [
                  //阴影
                  BoxShadow(
                    color: Colors.black12,
                    //offset: Offset(2.0,2.0),
                    blurRadius: 10.0,
                  )
                ]),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            constraints: const BoxConstraints(minHeight: 120, minWidth: 180),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    text!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
