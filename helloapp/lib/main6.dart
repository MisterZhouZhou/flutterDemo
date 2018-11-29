import 'package:flutter/material.dart';
import 'package:helloapp/RandomWords.dart';
import 'package:helloapp/RandomWords2.dart';


// app 入口
void main() => runApp(new MyApp6());

class MyApp6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('d'),
        ),
        body: new FlatButton(
            onPressed: (){
              print('dd');
              final snackBar = new SnackBar(content: new Text("Tap"));
              Scaffold.of(context).showSnackBar(snackBar);
            }, 
            child: new Text('ddd')
        )
      )
    );
  }
}

