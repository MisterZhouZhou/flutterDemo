import 'package:flutter/material.dart';

//

// app 入口
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {


  final List<Tab> myTabs = <Tab>[
    new Tab(text: '语文'),
    new Tab(text: '数学'),
    new Tab(text: '英语'),
    new Tab(text: '化学'),
    new Tab(text: '物理'),
    new Tab(text: '政治'),
    new Tab(text: '经济'),
    new Tab(text: '体育'),
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new DefaultTabController(
          length: myTabs.length,
          child: new Scaffold(
            appBar: new AppBar(
              title: new Text('dd'),
              bottom: new TabBar(
                  tabs: myTabs,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.white,
                  labelStyle: new TextStyle(fontSize: 16.0),
                  unselectedLabelColor: Colors.black,
                  unselectedLabelStyle: new TextStyle(fontSize: 12.0),
              ),
            ),
            body: new TabBarView(
                children: myTabs.map((Tab tab) {
                  return new Center(child: new Text(tab.text));
                }).toList()),
          ),
        )
    );
  }

}

