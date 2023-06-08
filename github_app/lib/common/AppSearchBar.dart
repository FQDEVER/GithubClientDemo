import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum SearchBarType {
  home, //首页searchBar默认状态
  homeLight, //首页searchBar高亮
  search, //searchBar搜索状态
}

class AppBarView extends StatefulWidget {
  final String placeholder; //当前占位视图
  final String city; //当前做左侧文本描述
  final SearchBarType searchBarType; //当前搜索框的状态
  final bool hiddenLeftBtn;
  String currentSearchStr; //当前搜索内容
  final void Function() leftButtonClick;
  final void Function() righButtonClick;
  final void Function() speakButtonClick;
  final void Function() inputBoxClick;
  final ValueChanged<String> onChanged;

  //将左侧与右侧的事件回调

  AppBarView({
    required this.placeholder,
    required this.city,
    required this.searchBarType,
    this.hiddenLeftBtn = false,
    required this.currentSearchStr,
    required this.leftButtonClick,
    required this.righButtonClick,
    required this.speakButtonClick,
    required this.inputBoxClick,
    required this.onChanged,
  });

  @override
  _AppBarViewState createState() => _AppBarViewState();
}

class _AppBarViewState extends State<AppBarView> {
  bool hasChangeTextField = false;
  final TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: widget.searchBarType == SearchBarType.search
          ? _searchEditWidget
          : _homeSearchWidget,
    );
  }

  //searchEdit的searchBar
  Widget get _searchEditWidget {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: widget.leftButtonClick,
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
            child: Icon(
              Icons.arrow_back_ios,
              size: widget.hiddenLeftBtn ? 0 : 20,
              color: Colors.black87,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: _searchEditBarWidget,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Theme(
            data: Theme.of(context).copyWith(
                buttonTheme: ButtonThemeData(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: 32,
                    minWidth: 44,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ))),
            child: ElevatedButton(
              onPressed: widget.righButtonClick,
              child: const Text(
                "搜索",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        )
      ],
    );
  }

  //添加一个searchEditBar
  Widget get _searchEditBarWidget {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 32,
      decoration: BoxDecoration(
        color: _searchBarBgColor,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            size: 20,
            color: Colors.blue,
          ),
          Expanded(
            flex: 1,
            child: Theme(
                data: new ThemeData(
                  primaryColor: Colors.transparent,
                  hintColor: Colors.black,
                ),
                child: Container(
                  height: 60,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 14),
                      // const EdgeInsets.only(top: 0.0, left: -8.0, right: -16.0, bottom: 14.0),
                      border: InputBorder.none,
//                  fillColor: Colors.transparent,
//                  filled: true,
                      hintText: widget.placeholder,
                      hintStyle: TextStyle(fontSize: 14),
//                  counterText: "",//如果设置了maxlength.那么就设置该属性.
                    ),

                    maxLines: 1,
//                  maxLength: 30,
//                  textAlign: TextAlign.start,   //文字显示位置
//                  autofocus: false,
//                  cursorColor: Colors.black,
                    textInputAction: TextInputAction.search,
                    controller: _editingController,
                    onChanged: _onTextFieldChange,
                  ),
                )),
          ),
          GestureDetector(
            onTap: () {
              if (this.hasChangeTextField) {
                _editingController.clear();
                widget.currentSearchStr = "";
                setState(() {
                  this.hasChangeTextField = false;
                });
              } else {
                //语音回调
                if (widget.speakButtonClick != null) {
                  widget.speakButtonClick();
                }
              }
            },
            child: Icon(
              this.hasChangeTextField ? Icons.clear : Icons.mic,
              size: 20,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  _onTextFieldChange(String valueStr) {
    setState(() {
      this.hasChangeTextField = valueStr.length != 0;
      widget.currentSearchStr = valueStr;
    });
    //回调出去.
    if (widget.onChanged != null) {
      widget.onChanged(valueStr);
    }
  }

  //home的searchBar

  Widget get _homeSearchWidget {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: widget.leftButtonClick,
          child: Container(
            child: Row(
              children: <Widget>[
                Text(
                  widget.city,
                  style: TextStyle(color: _homeFontColor, fontSize: 14),
                ),
                Icon(
                  Icons.expand_more,
                  size: 22,
                  color: _homeFontColor,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: widget.inputBoxClick,
            child: _searchBarWidget,
          ),
          flex: 1,
        ),
        GestureDetector(
          onTap: widget.righButtonClick,
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Icon(
              Icons.comment,
              size: 24,
              color: _homeFontColor,
            ),
          ),
        ),
      ],
    );
  }

  //添加一个searchBar
  Widget get _searchBarWidget {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 32,
      decoration: BoxDecoration(
        color: _searchBarBgColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            size: 20,
            color: Colors.blue,
          ),
          Expanded(
            flex: 1,
            child: Text(
              widget.placeholder,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          GestureDetector(
            child: Icon(
              Icons.mic,
              size: 20,
              color: Colors.grey,
            ),
            onTap: widget.speakButtonClick,
          ),
        ],
      ),
    );
  }

  //获取首页的文本颜色
  Color get _homeFontColor {
    if (widget.searchBarType == SearchBarType.home) {
      return Colors.white;
    } else if (widget.searchBarType == SearchBarType.homeLight) {
      return Colors.black54;
    } else {
      return Colors.orange;
    }
  }

  //获取首页的文本颜色
  Color get _searchBarBgColor {
    if (widget.searchBarType == SearchBarType.home) {
      return Colors.white;
    } else {
      return Color(0xFFF6F6F6);
    }
  }
}
