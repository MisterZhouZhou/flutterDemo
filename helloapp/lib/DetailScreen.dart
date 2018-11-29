import 'package:flutter/material.dart';
import 'package:helloapp/model/Todo.dart';

class DetailScreen extends StatelessWidget {

  final Todo todo;
  DetailScreen({Key key, @required this.todo}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${todo.title}"),
      ),
      body: new Padding(
          padding: new EdgeInsets.all(16.0),
          child: new Text('${todo.description}')
      ),
    );
  }
}

