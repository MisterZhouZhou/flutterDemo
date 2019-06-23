import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
            primaryColor: Colors.lightBlue[500], accentColor: Colors.cyan[600]),
        home: FirstScreen());
  }
}

class FirstScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('First Screen'),),
      body: new Center(
        child: new RaisedButton(
          child: new Text('Launch new screen'),
          onPressed: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context)=> new SecondScreen()));
          },
        ),
      ),
    );
  }
}


class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('Second Screen'),),
      body: new Center(
        child: new RaisedButton(
          child: new Text('Go back'),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}