import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Card',
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Card'),),
        body: new MyCard(),
      ),
    );
  }
}

class MyCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyCardState();
  }
}

class MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SizedBox(
      height: 420.0,
      child: buildCard(),
    );
  }
}


Widget buildCard() {
  return new Card(
    color: Colors.cyan,
    elevation: 5.0,
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildStackImgBack(),
        _buildText(),
        _buildRowText()
      ],
    ),
  );
}


/**
 * 1.图片部分
 */
Widget _buildStackImgBack() {
  return new Stack(
    alignment: AlignmentDirectional.bottomStart,
    children: <Widget>[
      new Image.asset('images/1.jpg'),
      new Container(
        padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
        child: new Text(
          'Top 10 Australian beaches',
          style: new TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      )
    ],
  );
}

/**
 * 2.垂直文本部分
 */
Widget _buildText() {
  return new Expanded(
      child: new Container(
        margin: const EdgeInsets.only(left: 10.0, top: 10.0),
        padding: const EdgeInsets.all(5.0),
        child: new Column(
          //横轴对齐方式 起始测对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text("Number 10",style: const TextStyle(color: Colors.white),),
            new Text("Whitehaven Beach",style: const TextStyle(color: Colors.white),),
            new Text("Whitsunday lsland, Whitsunday lslands",style: const TextStyle(color: Colors.white),),
          ],
        ),
      ));
}


/**
 * 3.水平文本部分
 */
Widget _buildRowText() {
  return new Row(
    children: [
      _buildContainer("SHARE"),
      _buildContainer("EXPLORE"),
    ],
  );
}

Widget _buildContainer(String text) {
  return new Container(
      margin: const EdgeInsets.only(left: 10.0, bottom: 10.0),
      child: new Text(
        text,
        style: new TextStyle(
            fontSize: 15.0, color: Colors.blue, fontWeight: FontWeight.bold),
      ));
}
