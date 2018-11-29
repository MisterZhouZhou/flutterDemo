import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}


class MyApp extends StatelessWidget {

  /**
   * 抽取item项
   */
  Widget _getContainer(String test, IconData icon) {
    return new Container(
      width: 160.0,
      child: new ListTile(
        leading: new Icon(icon),
        trailing: new Icon(icon),
        title: new Text(test),
        subtitle: new Text('subtitle'),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final title = 'list';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(title: new Text(title),),
        body: new Center(
          child: new ListView(
            children: <Widget>[
              _getContainer('Maps', Icons.map),
              _getContainer('Phone', Icons.phone),
              _getContainer('Maps', Icons.map)
            ],
          ),
        ),
      ),
    );
  }
}