import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintBaselinesEnabled;

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'container',
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Container'),),
        body: new MyContainer(),
      ),
    );
  }
}

class MyContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyContainerState();
  }
}

class MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var img = new Expanded(
        child: new Container(
          decoration: new BoxDecoration(
            border: new Border.all(color: Colors.black38, width: 10.0),
            borderRadius: const BorderRadius.all(const Radius.circular(8.0))
          ),
          margin: const EdgeInsets.all(4.0),
          child: new Image.asset('images/1.jpg'),
        )
    );


    var row = new Row(
      children: <Widget>[
        img,img,img
      ],
    );

    var row2 = new Row(
      children: <Widget>[
        new Stack(
          alignment: const Alignment(0.0, -0.6),
          children: <Widget>[
            new CircleAvatar(
              backgroundColor: Colors.black12,
              backgroundImage: new AssetImage('images/1.jpg'),
              radius: 50.0,
            ),
            new Container(
              child: new Text(
                'xiaogou',
                 style: new TextStyle(
                   color: Colors.blue,
                   fontSize: 20.0,
                   fontWeight: FontWeight.bold
                 ),
              ),
            )
          ],
        )
      ],
    );
    
    
    return new Container(
      decoration: new BoxDecoration(color: Colors.black26),
      child: new ListView(
        children: <Widget>[
          row,row,row,row2
        ],
      ),
    );
  }
}
