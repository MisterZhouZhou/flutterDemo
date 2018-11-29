import 'package:flutter/material.dart';
import 'package:helloapp/RandomWords.dart';
import 'package:helloapp/RandomWords2.dart';


// app 入口
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new RandomWords2()
    );
  }
}

