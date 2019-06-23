import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
            primaryColor: Colors.lightBlue[500], accentColor: Colors.cyan[600]),
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('data'),
        ),
        body: getGridListView(context)
    );
  }
}

Widget getVListView() {
  return new ListView(
    children: <Widget>[
      new ListTile(
        leading: new Icon(Icons.map),
        title: new Text('Maps'),
      ),
      new ListTile(
        leading: new Icon(Icons.photo_album),
        title: new Text('Album'),
      ),
      new ListTile(
        leading: new Icon(Icons.phone),
        title: new Text('Phone'),
      ),
    ],
  );
}

Widget getHListView() {
  return new ListView(
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      new Container(
        width: 160.0,
        color: Colors.red,
        child: new ListTile(
          leading: new Icon(Icons.map),
          title: new Text('Maps'),
        ),
      ),
      new Container(
        width: 160.0,
        child: new ListTile(
          leading: new Icon(Icons.photo_album),
          title: new Text('Album'),
        ),
      ),
      new Container(
        width: 160.0,
        child: new ListTile(
          leading: new Icon(Icons.phone),
          title: new Text('Phone'),
        ),
      ),
    ],
  );
}


Widget getLongListView() {
  final items = new List<String>.generate(1000, (i)=>'Item $i');
  return new ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index){
      return new ListTile(
        title: new Text('${items[index]}'),
      );
    },
  );
}

Widget getGridListView(context) {
  final items = new List.generate(100, (i){
      return new Center(
        child: new Text(
          'Item $i',
          style: Theme.of(context).textTheme.headline
        ),
      );
    });

  return new GridView.count(
    crossAxisCount: 2,
    children: items
  );
}


Widget getDifferentLongListView() {
  final items = new List<ListItem>.generate(
    1000, 
    (i)=> i % 6 == 0 ? new HeadingItem('Heading $i') : new MessageItem("Sender $i", 'Message body $i')
  );
  return new ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index){
      final item = items[index];
      if(item is HeadingItem){
         return new ListTile(
           title: new Text(item.heading, style: Theme.of(context).textTheme.headline),
         );
      }else if(item is MessageItem){
        return new ListTile(
           title: new Text(item.sender, style: Theme.of(context).textTheme.headline),
           subtitle: new Text(item.body),
         );
      }
    },
  );
}


abstract class ListItem{}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;
  MessageItem(this.sender, this.body);
}