import 'package:flutter/material.dart';
import 'package:helloapp/RandomWords.dart';
import 'package:helloapp/RandomWords2.dart';


// app 入口
void main() => runApp(new MyApp5());

class MyApp5 extends StatelessWidget {

  final items = new List<ListItem>.generate(
    1200,
        (i) => i % 6 == 0
        ? new HeadingItem('Heading $i')
        : new MessageItem('Sender $i', 'Message body $i'),
  );

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
               if(item is HeadingItem){
                  return new ListTile(
                    title: new Text(item.heading, style: Theme.of(context).textTheme.headline,),
                  );
               }else if(item is MessageItem){
                 return new ListTile(
                   title: new Text(item.sender, style: Theme.of(context).textTheme.headline,),
                   subtitle: new Text(item.body),
                 );
               }
            }
        )
      )
    );
  }
}


abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}