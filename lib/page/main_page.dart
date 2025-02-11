import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/page/login_page.dart';
import 'package:flutter_wanandroid/page/project/project_page.dart';
import 'package:flutter_wanandroid/page/user/user_center/user_center.dart';
import 'package:flutter_wanandroid/res/colors.dart';
import 'package:flutter_wanandroid/res/dimens.dart';
import 'head_line/head_line_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> _bottomNavigationTitle;

  List<BottomNavigationBarItem> _listIcon;

  var _pageList;
  int _currentIndex;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    initPages();
  }

  initPages() {
    _currentIndex = 0;
    _pageController = new PageController();
    _bottomNavigationTitle = ["首页", "项目", "我的", "你的"];
    _pageList = [HeadLinePage(), ProjectPage(), LoginPage(), UserCenter()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            items: _buildBottomNavigationBarItem(),
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            elevation: 5.0,
            iconSize: 21,
            onTap: (index) => _pageController.jumpToPage(index),
            selectedFontSize: Dimens.font_sp10,
            unselectedFontSize: Dimens.font_sp10,
            selectedItemColor: Colours.red,
            unselectedItemColor: Colours.dark_unselected_item_color),
        body: PageView(
          children: _pageList,
          onPageChanged: _onPageChanged,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
        ));
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItem() {
    if (_listIcon == null) {
      var _tabImages = [
        const Icon(Icons.access_time),
        const Icon(Icons.print),
        const Icon(Icons.border_outer),
        const Icon(Icons.settings),
      ];
      _listIcon = List.generate(4, (i) {
        return BottomNavigationBarItem(
            icon: _tabImages[i],
            title: Text(_bottomNavigationTitle[i]),
            backgroundColor: Colors.red);
      });
    }
    return _listIcon;
  }

  void _onPageChanged(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }
}
