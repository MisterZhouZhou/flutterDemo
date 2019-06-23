import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Passing Data',
        theme: new ThemeData(
            primaryColor: Colors.lightBlue[500], accentColor: Colors.cyan[600]),
        home: TodoScreen(
          todos: new List.generate(20, (i)=> new Todo('Todo $i', 'A description of what needs to be done for Todo $i')),
        ));
  }
}

class Todo {
  final String title;
  final String description;
  Todo(this.title, this.description);
}


class TodoScreen extends StatelessWidget {
  final List<Todo> todos;
  TodoScreen({Key key, @required this.todos}): super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('First Screen'),),
      body: new ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index){
          return new ListTile(
             title: new Text(todos[index].title), 
             onTap: (){
               final TodoCallBack callBack = (String result) {
                  Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(result),));
               };
               _navigateAndDisplaySelection(context, todos[index], callBack);
             },
          );
        },
      )
    );
  }
}

typedef void TodoCallBack(String result);


void _navigateAndDisplaySelection(BuildContext context, Todo t_todo, TodoCallBack callBack) async {
  final result = await Navigator.push(context, new MaterialPageRoute(builder: (context)=> new DetailsScreen(todo: t_todo,)));
  if(callBack != null){
    callBack(result);
  }
}


class DetailsScreen extends StatelessWidget {
  final Todo todo;
  DetailsScreen({Key key, @required this.todo}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('${todo.title}'),),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            new Text('${todo.description}'),
            new RaisedButton(
              onPressed: (){
                Navigator.pop(context, 'Nope');
              },
              child: new Text('Nope'),
            )
          ],
        ),
      )
    );
  }
}