import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';


void main(){
  runApp(new MaterialApp(
    title: 'opacity',
    home: new Scaffold(
      appBar: new AppBar(title: new Text('opacity'),),
      body: new LogoApp(),
    ),
  ));
}

class LogoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LogoAppState();
  }
}

class LogoAppState extends State<LogoApp> {
  var _visible = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Opacity(
        opacity: _visible ? 1.0: 0.0,
        child: new Center(
          child: new GestureDetector(
            onTap: (){
              _visible = !_visible;
              setState(() {

              });
            },
            child: new Text('当你点击我的时候 你会失去我', textDirection: TextDirection.ltr, style: TextStyle(fontWeight: FontWeight.w900, fontStyle: FontStyle.italic),),
          ),
        )
    );
  }
}