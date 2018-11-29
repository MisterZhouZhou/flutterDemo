import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: '我的应用',
    theme: new ThemeData(
      primaryColor: Colors.white
    ),
    home: new CartHome(),
  ));
}

class MyAppbar extends StatelessWidget {
  final Widget title;
  final num test;

  MyAppbar({this.title, this.test});

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new IconButton(icon: new Icon(Icons.menu), tooltip: '导航菜单',onPressed: null),
          new Expanded(child: title),
          new IconButton(icon: new Icon(Icons.search), tooltip: '搜索', onPressed: null)
        ],
      ),
    );
  }

}

class CartHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppbar(
            title: new Text('京西商城',style: Theme.of(context).primaryTextTheme.title),
          ),
          new Expanded(child: new Center(
            child: new Text('hello flutter'),
          ))
        ],
      ),
    );
  }
}
