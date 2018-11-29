import 'package:flutter/material.dart';

final todos = new List<Todo>.generate(20, (i)=>new Todo("Todo $i", "A description of what needs to be done for Todo $i"));

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

void main(){
  runApp(new MaterialApp(
    title: 'Flutter',
    home: new FirstScreen(todos),
  ));
}

class FirstScreen extends StatelessWidget {
  final List<Todo> todos;
  FirstScreen(this.todos);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('push page'),
      ),
      body: new Center(
        child: new ListView.builder( 
          itemCount: todos.length, 
          itemBuilder: (context, index){
            return new ListTile(
              title: new Text(todos[index].title),
              onTap: (){
                Navigator.push(context,
                  new MaterialPageRoute(builder: (context)=> new SecondPage(todo: todos[index]))
                );
              },
            );
          }),
      )
    );
  }
}

class SecondPage extends StatelessWidget {
  final Todo todo;
  SecondPage({Key key, @required this.todo}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text('pop page'),),
      body: new Center(
        child: new GestureDetector(
          child: new Text("${todo.description}"),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
