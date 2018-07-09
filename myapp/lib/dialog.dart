import 'package:flutter/material.dart';

void main() => runApp(new ExampleWidget());

/// Opens an [AlertDialog] showing what the user typed.
class ExampleWidget extends StatefulWidget {
  ExampleWidget({Key key}) : super(key: key);

  @override
  _ExampleWidgetState createState() => new _ExampleWidgetState();
}

/// State for [ExampleWidget] widgets.
class _ExampleWidgetState extends State<ExampleWidget> {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ddd',
      home: new Scaffold(
          appBar: new AppBar(title: new Text('ddd'),),
          body: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                new TextField(
                  controller: _controller,
                  decoration: new InputDecoration(
                    hintText: 'Type something',
                  ),
                ),
                new RaisedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context)=>new AlertDialog(
                          title: new Text('what you typed'),
                          content: new Text(_controller.text),
                        )
                    );
                  },
                  child: new Text('DONE'),
                )
            ],
          )
      ),
    );
  }
}