import 'package:flutter/material.dart';
// import 'dart:async';

class LoginControl extends StatelessWidget {
  final Widget child;
  final bool isloading;
  final bool cover;
  final Function()? clickCover;
  final bool hasBgWhite;
  final int showTime;
  const LoginControl({
    Key? key,
    required this.child,
    required this.isloading,
    this.cover = false,
    this.clickCover, //是否需要点击隐藏
    this.hasBgWhite = false,
    this.showTime = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _stackView;
  }

  //给个api.show或者隐藏

  Widget get _stackView {
    return Stack(
      children: <Widget>[
        child,
        isloading ? _loadingView : const Text(""),
      ],
    );
  }

  Widget get _loadingView {
    return GestureDetector(
      onTap: clickCover,
      child: Container(
        decoration: BoxDecoration(
          color: cover
              ? const Color.fromRGBO(150, 150, 150, 0.5)
              : Colors.transparent,
        ),
        child: Center(
            child: Container(
          decoration: BoxDecoration(
              color: hasBgWhite ? Colors.white : Colors.black,
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          width: 100,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                backgroundColor: hasBgWhite ? Colors.black54 : Colors.white,
                color: hasBgWhite ? Colors.white : Colors.black54,
                strokeWidth: 2.0,
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    '加载中',
                    style: TextStyle(
                        color: hasBgWhite ? Colors.black54 : Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none),
                  ))
            ],
          ),
        )),
      ),
    );
  }
}

class LoadingControl extends StatelessWidget {
  final Widget child;
  final bool isloading;
  final bool cover;

  const LoadingControl(
      {Key? key,
      required this.child,
      required this.isloading,
      this.cover = false //是否有遮罩.默认为false.即分开处理.如果为true.则加载进度在子视图上
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cover ? _stackView : (isloading ? _loadingView : child);
  }

  Widget get _stackView {
    return Stack(
      children: <Widget>[
        child,
        isloading ? _loadingView : const Text(""),
      ],
    );
  }

  Widget get _loadingView {
    return Container(
      color: Colors.transparent,
      child: const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.orange,
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}
