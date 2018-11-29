import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';  // 动画库

void main(){
  runApp(new MaterialApp(
    title: 'input',
    home: new Scaffold(
      appBar: new AppBar(title: new Text('输入事件'),),
      body: new LogoApp(),
    ),
  ));
}

class LogoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LogoAppState();
  }
}

class LogoAppState extends State<LogoApp> {

  final TextEditingController _controller = new TextEditingController.fromValue(new TextEditingValue(text: 'duo_shine'));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new TextField(
          controller: _controller,
          decoration: new InputDecoration(hintText: '用户名'),
        ),
        new RaisedButton(
            onPressed: (){
              showDialog(
                context: context,
                child: new AlertDialog(
                  title: new Text('用户名'),
                  content: new Text(_controller.text),
                )
              );
            },
            child: new Text('登录'),
        )
      ],
    );
  }
}