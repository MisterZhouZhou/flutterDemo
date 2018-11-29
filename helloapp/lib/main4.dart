import 'package:flutter/material.dart';
import 'package:helloapp/RandomWords.dart';
import 'package:helloapp/RandomWords2.dart';


// app 入口
void main() => runApp(new MyApp4());

class MyApp4 extends StatelessWidget {
  
  final items = new List<String>.generate(100, (i)=> 'item ${i}');
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('ddd'),
        ),
        body: new ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              if(index.isOdd) return new Divider();
              return new ListTile(
                title: new Text('${items[index]}'),
              );
            }
        )
      )
    );
  }
}

