import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyApp();
  }
}

class _MyApp extends State<MyApp> {

  void _showMessage() {
    showDialog<Null>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('Rewind and remember'),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  new Text('You will never be satisfied.'),
                  new Text('You\’re like me. I’m never satisfied.'),
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Regret'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'd',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('bb')
        ),
        body: new Center(
          child: new RaisedButton(
            onPressed: _showMessage,
            child: new Text('显示底部面板'),),
        )
      ),
    );
  }
}