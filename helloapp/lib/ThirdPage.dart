import 'package:flutter/material.dart';

// ThirdPage

class ThirdPage extends StatelessWidget {
  ThirdPage({Key key, this.saved}):super(key:key);
  // 传过来的数据
  final List saved;

  click(){

  }

  @override
  Widget build(BuildContext context) {

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

    final titles = saved.map(
      (pair){
          return new ListTile(
            title: new Text(pair.asPascalCase, style: const TextStyle(fontSize: 18.0),),
          );
      }
    );

    final divided = ListTile.divideTiles(
      context: context,
      tiles: titles
    ).toList();

    return new DefaultTabController(
      length: myTabs.length,
      child: new Scaffold(
        appBar: new AppBar(
        title: new Text('dd'),
        // leading: new Icon(Icons.home),
        backgroundColor: Colors.amber[500],
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.add_alarm),
              tooltip: 'Add Alarm',
              onPressed: () {
                // do nothing
              }),
          new PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                    new PopupMenuItem<String>(
                        value: "price", child: new Text('Sort by price')),
                    new PopupMenuItem<String>(
                        value: "time", child: new Text('Sort by time')),
                  ],
              onSelected: (String action) {
                switch (action) {
                  case "price":
                    // do nothing
                    break;
                  case "time":
                    // do nothing
                    break;
                }
              })
        ],
        bottom: new TabBar(
          tabs: myTabs,
          isScrollable: true,
        ),
      ),
      body: new ListView(children: divided),
    ),
      
    );
  } 
}

