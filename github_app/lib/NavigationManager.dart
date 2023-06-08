// ignore: file_names
import 'package:dfflutterdemo/Pages/ActivityPage.dart';
import 'package:dfflutterdemo/Pages/HomePage.dart';
import 'package:dfflutterdemo/Pages/LoveCarPage.dart';
import 'package:dfflutterdemo/Pages/MallPage.dart';
import 'package:dfflutterdemo/Pages/MinePage.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({super.key});

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  var _currentIndex = 0;
  final Color _normalColor = Colors.grey;
  final Color _selectColor = Colors.blue;

  void _clickNavigatorBarIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        alignment: AlignmentDirectional.topStart,
        index: _currentIndex,
        children: [
          HomePage(),
          ActivityPage(),
          LoveCarPage(),
          MallPage(),
          const MinePage(),
        ],
      ),
      bottomNavigationBar: Theme(
          data: ThemeData(
              brightness: Brightness.light,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: _selectColor,
            unselectedItemColor: _normalColor,
            selectedFontSize: 12,
            useLegacyColorScheme: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: _normalColor,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: _selectColor,
                ),
                label: '首页',
                backgroundColor:
                    _currentIndex == 0 ? _selectColor : _normalColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_activity,
                  color: _normalColor,
                ),
                activeIcon: Icon(
                  Icons.local_activity,
                  color: _selectColor,
                ),
                label: '活动',
                backgroundColor:
                    _currentIndex == 1 ? _selectColor : _normalColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.car_crash,
                  color: _normalColor,
                ),
                activeIcon: Icon(
                  Icons.car_crash,
                  color: _selectColor,
                ),
                label: '爱车',
                backgroundColor:
                    _currentIndex == 2 ? _selectColor : _normalColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.scale_outlined,
                  color: _normalColor,
                ),
                activeIcon: Icon(
                  Icons.scale_outlined,
                  color: _selectColor,
                ),
                label: '商城',
                backgroundColor:
                    _currentIndex == 3 ? _selectColor : _normalColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  color: _normalColor,
                ),
                activeIcon: Icon(
                  Icons.account_circle,
                  color: _selectColor,
                ),
                label: '我的',
                backgroundColor:
                    _currentIndex == 4 ? _selectColor : _normalColor,
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              _clickNavigatorBarIndex(index);
            },
          )),
    );
  }
}
