import 'package:flutter/material.dart';

void main() => runApp(new MyApp(items: new List<ListItem>.generate(10000, (i)=> i%6==0 ? new HeadingItem('Heading $i') : new MessageItem('Sender $i', 'Message body $i'))));

class MyApp extends StatelessWidget {
  final List<ListItem> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Mixed List';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index){
              final item = items[index];
              if(item is HeadingItem){
                return new ListTile(
                  title: new Text(
                    item.heading,
                    style: Theme.of(context).textTheme.headline,
                  ),
                );
              }else if(item is MessageItem){
                return new ListTile(
                  title: new Text(item.heading),
                  subtitle: new Text(item.body),
                );
              }
            }
        ),
      ),
    );
  }
}


abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String heading;
  final String body;
  MessageItem(this.heading, this.body);
}
