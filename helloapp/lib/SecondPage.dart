import 'package:flutter/material.dart';
import 'ThirdPage.dart';

// SecondPage页面

class SecondPage extends StatelessWidget {
  SecondPage({Key key, this.saved}):super(key:key);
  final List saved;

  onItemClick(context){
    Navigator.of(context).push(
      new MaterialPageRoute(
       builder: (context) {
         return new ThirdPage(saved: saved,);
       } 
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final titles = saved.map(
      (pair){
          return new ListTile(
            title: new Text(pair.asPascalCase, style: const TextStyle(fontSize: 18.0),),
            onTap: ()=> onItemClick(context),
          );
      }
    );

    final divided = ListTile.divideTiles(
      context: context,
      tiles: titles
    ).toList();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Save Suggestions'),
        backgroundColor: Colors.green,
      ),
      body: new ListView(children: divided)
    );
  } 
}

