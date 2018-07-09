import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

// 显示计数器文本
class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});
  final int count;
  
  @override
  Widget build(BuildContext context) {
    return new Text('Count: $count');
  }
}

// 计数器
class CounterInCrementor extends StatelessWidget {
  CounterInCrementor({this.onPressed});
  final VoidCallback onPressed;
  
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
        onPressed: onPressed,
        child: new Text('Increment'),
    );
  }
}


// 计数组件
class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
     return new CounterState();
  }
}

class CounterState extends State<Counter> {
  int _counter = 0;
  void _increment(){
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        children: <Widget>[
          new CounterInCrementor(onPressed: _increment,),
          new CounterDisplay(count: _counter,)
        ],
    );
  }

}




class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return new GestureDetector(
       onTap: (){
         print('ddddd');
       },
       child: new Container(
         height: 36.0,
         padding: const EdgeInsets.all(8.0),
         margin: const EdgeInsets.symmetric(horizontal: 8.0),
         decoration: new BoxDecoration(
           borderRadius: new BorderRadius.circular(5.0),
           color: Colors.lightGreen[500]
         ),
         child: new Center(
           child: new Text('Engage'),
         ),
       ),
     );
  }
}


class TutorialHoe extends StatelessWidget{

  // 点击事件
  void test(){

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(icon: new Icon(Icons.menu), tooltip: 'Navigation menu', onPressed: null),
        title: new Text('Example title'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), tooltip: 'Search', onPressed: null),
          new MyButton()
        ],
      ),
      body: new Container(
        color: Colors.red,
        child: new Column(
          children: <Widget>[
            new Text('Hello World!'),
            new Counter()
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: 'Add',
          child: new Icon(Icons.add),
          onPressed: test
      ),
    );
  }
}

class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter Tutorial',
      home: new TutorialHoe()
    );
  }
  
  
  
}