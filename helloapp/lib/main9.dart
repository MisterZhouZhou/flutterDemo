import 'package:flutter/material.dart';
import 'package:helloapp/model/Todo.dart';
import 'package:helloapp/DetailScreen.dart';

// app 入口
void main() => runApp(new MyApp9());

class MyApp9 extends StatelessWidget {
  
  final todos = new List<Todo>.generate(20, (i)=> new Todo('Todo $i', 'A description of what needs to be done for Todo $i'));
  
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
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return new ListTile(
                title: new Text(todos[index].title),
                onTap: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new DetailScreen(todo: todos[index])));
                },
              );
            }
        )
      )
    );
  }
}

