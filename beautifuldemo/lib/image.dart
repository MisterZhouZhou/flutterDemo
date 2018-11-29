import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: '',
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: new Text('Oeschinen Lake Campground', style: new TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  new Text('Kandersteg, Switzerland', style: new TextStyle(color: Colors.grey[500]),)
                ],
              )),
          new Icon(Icons.star, color: Colors.red[500],),
          new Text('41')
        ],
      ),
    );


    /**
     * 抽取button行的代码复用
     */
    Column getText(IconData icon, String text){
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, color: Colors.blue[500],),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(text, style: new TextStyle(color: Colors.blue[500]),),
          )
        ],
      );
    }

    /**
     * 实现按钮部分
     */
    Widget buttonSection = new Container(
      child: new Row(
        //MainAxisAlignment.spaceEvenly平均分配子空间  他会在每个子项之间,之前,之后平均分配空闲空间 当然也可以使用Expanded来实现
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          getText(Icons.call, "CALL"),
          getText(Icons.near_me, "ROUTE"),
          getText(Icons.share, "SHARE")
        ],
      ),
    );


    /**
     * 实现文本部分

     */
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
          "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.",
          softWrap: true),//softWrap: true 文本是否在换行符处中断
    );


    return new MaterialApp(
      title: 'Flutter Layout',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Layout'),
        ),
        body: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/1.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      ),
    );
  }
}