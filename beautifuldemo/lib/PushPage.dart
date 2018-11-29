import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    title: 'Flutter',
    home: new FirstScreen(),
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('push page'),
      ),
      body: new Center(
        child: new RaisedButton(child: new Text('push'),onPressed: (){
          Navigator.push(context, new MaterialPageRoute(builder: (context)=> new SecondPage()));
        }),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text('pop page'),),
      body: new Center(
        child: new RaisedButton(child: new Text('pop'),onPressed: (){
          Navigator.pop(context);
        }),
      ),
    );
  }
}
