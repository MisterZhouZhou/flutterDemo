import 'package:flutter/material.dart';
import 'package:helloapp/RandomWords.dart';
import 'package:helloapp/RandomWords2.dart';


// app 入口
void main() => runApp(new MyApp8());

class MyApp8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        body: new FirstScreen()
      )
    );
  }
}




class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First Screen'),
      ),
      body: new Center(
        child: new RaisedButton(
            child: new Text('Launch new screen'),
            onPressed: (){
              Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context)=> new ScreenScreen())
              );
            }
        ),
      ),
    );
  }
}



class ScreenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Second Screen'),
      ),
      body: new Center(
        child: new RaisedButton(
            child: new Text('Go back'),
            onPressed: (){
              Navigator.pop(context);
            }
        ),
      ),
    );
  }
}
