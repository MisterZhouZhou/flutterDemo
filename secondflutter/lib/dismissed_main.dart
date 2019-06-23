import 'package:flutter/material.dart';

void main() => runApp(MyApp(
  items: new List<String>.generate(20, (i)=> 'Item ${i+1}'),
));

class MyApp extends StatelessWidget {
  final List<String> items;

  MyApp({Key key, @required this.items}):super(key:key);

  @override
  Widget build(BuildContext context) {
    final title = 'Dismissing Items';
    return MaterialApp(
        title: title,
        home: new Scaffold(
          appBar: new AppBar(title: new Text(title),),
          body: new ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index){
              final item = items[index];
              return new Dismissible(
                  key: new Key(item),
                  onDismissed: (direction){
                    items.removeAt(index);
                    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('$item dismissed'),));
                  },
                  background: new Container(color: Colors.red,),
                  child: new ListTile(title: new Text('$item'),),
              );
            },
          ),
        )
    );
  }
}
