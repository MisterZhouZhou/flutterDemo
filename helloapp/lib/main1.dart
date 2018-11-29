import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helloapp/RandomWords.dart';
import 'package:helloapp/RandomWords2.dart';


// app 入口
void main() => runApp(new MyApp1());

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ImageState()
    );
  }
}


class ImageState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ImageStateWidget();
  }

}

class ImageStateWidget extends State<ImageState> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('Startup Name Generator')
      ),
      body: new ListView(
        children: <Widget>[
//          new Image.asset('imgs/test.jpg'),
          new Image.network('https://flutter.io/images/homepage/header-illustration.png'),
          new Image.file(new File("/Users/zhouwei/Desktop/zw/flutterDemo/helloapp/imgs/test.jpg")),
          //使用ImageProvider加载图片
          new Image(image: new NetworkImage("https://flutter.io/images/homepage/screenshot-2.png"),)
        ],
      )
    );
  }

}