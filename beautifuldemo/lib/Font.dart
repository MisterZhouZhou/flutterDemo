import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    title: 'font',
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text('font'),),
      body: new Center(
        child: new Text('ABCDRFFJLJLFaaaadafjdsaldf', style: const TextStyle(fontFamily: 'aller'),),
      ),
    );
  }
}