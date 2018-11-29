import 'package:flutter/material.dart';
import 'package:flutterboss/app/view/jobs_view.dart';
import 'package:flutterboss/app/component/icon_tab.dart';
import 'package:flutterboss/app/view/componey/company_view.dart';
import 'package:flutterboss/app/view/message_view.dart';
import 'package:flutterboss/app/view/mine_view.dart';


const double _kTabTextSize = 11.0;
const int INDEX_JOB = 0;
const int INDEX_COMPANY = 1;
const int INDEX_MESSAGE = 2;
const int INDEX_MINE = 3;
Color _kPrimaryColor = new Color.fromARGB(255, 0, 215, 198);


class BossApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}


class HomeState extends State<BossApp> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController _controller;
  VoidCallback onChanged;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(initialIndex: _currentIndex, length: 4, vsync: this);
    onChanged = () {
      setState(() {
        _currentIndex = this._controller.index;
      });
    };
    // 为控制器添加监听
    _controller.addListener(onChanged);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new TabBarView(
          children: <Widget>[
            new JobsTab(), new CompanyTab(), new MessageTab(), new MineTab()
          ],
          controller: _controller,
      ),
        bottomNavigationBar: new Material(
          color: Colors.white,
          child: new TabBar(
            controller: _controller,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: new TextStyle(fontSize: _kTabTextSize),
            tabs: <IconTab>[
              new IconTab(
                  icon: _currentIndex == INDEX_JOB
                      ? "assets/images/ic_main_tab_company_pre.png"
                      : "assets/images/ic_main_tab_company_nor.png",
                  text: "职位",
                  color: _currentIndex == INDEX_JOB ? _kPrimaryColor : Colors.grey[900]
              ),
              new IconTab(
                  icon: _currentIndex == INDEX_COMPANY
                      ? "assets/images/ic_main_tab_contacts_pre.png"
                      : "assets/images/ic_main_tab_contacts_nor.png",
                  text: "公司",
                  color: _currentIndex == INDEX_COMPANY ? _kPrimaryColor : Colors.grey[900]
              ),
              new IconTab(
                  icon: _currentIndex == INDEX_MESSAGE
                      ? "assets/images/ic_main_tab_find_pre.png"
                      : "assets/images/ic_main_tab_find_nor.png",
                  text: "消息",
                  color: _currentIndex == INDEX_MESSAGE ? _kPrimaryColor : Colors.grey[900]
              ),
              new IconTab(
                  icon: _currentIndex == INDEX_MINE
                      ? "assets/images/ic_main_tab_my_pre.png"
                      : "assets/images/ic_main_tab_my_nor.png",
                  text: "我的",
                  color: (_currentIndex == INDEX_MINE) ? _kPrimaryColor : Colors.grey[900]
              ),
            ],
          ),
        )
    );
  }

  @override
  void dispose() {
    _controller.removeListener(onChanged);
    _controller.dispose();
    super.dispose();
  }

}



void main() {
  runApp(new MaterialApp(
      title: "Boss直聘",
      theme: new ThemeData(
        primaryIconTheme: const IconThemeData(color: Colors.white),
        brightness: Brightness.light,
        primaryColor: _kPrimaryColor,
        accentColor: Colors.cyan[300],
      ),
      home: new BossApp()));
}