import 'package:flutter/material.dart';
import 'package:helloapp/RandomWords.dart';
import 'package:helloapp/RandomWords2.dart';


// app 入口
void main() => runApp(new MyApp7());

class MyApp7 extends StatelessWidget {
  
  final items = new List<String>.generate(20, (i)=> 'item ${i+1}');
  
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
              final item = items[index];
              return new Dismissible(
                  key: new Key(item),
                  onDismissed: (direction){
                    items.removeAt(index);
                    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('$item dismissed')));
                  },
                  background: new Container(color: Colors.red,),
                  child: new ListTile(title: new Text('$item'),));
            }
        )
      )
    );
  }
}

