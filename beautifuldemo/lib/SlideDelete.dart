import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main(){
  runApp(new MaterialApp(
    title: '',
    home: new MyApp(
      items: new List<String>.generate(20, (i)=> 'Item ${i+1}'),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final List<String> items;
  MyApp({Key key, @required this.items}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Dismissing Items';
    // TODO: implement build
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(title: new Text(title),),
        body: new ListView.builder(
            itemCount: this.items.length,
            itemBuilder: (context, index){
              final item = items[index];
              return Dismissible(
                key: new Key(item),
                onDismissed: (direction){
                  items.removeAt(index);
                  // tip
                  Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('$item dismissed')));
                },
                background: new Container(
                  color: Colors.red,
                ),
                child: new ListTile(
                  title: new Text('$item'),
                ),
              );
            }),
      ),
    );
  }
}