import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'WebSocket Demo';
    return new MaterialApp(
      title: title,
      home: new MyHomePage(
        title: title,
        channel: new IOWebSocketChannel.connect('ws://echo.websocket.org'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final WebSocketChannel channel;

  MyHomePage({Key key, @required this.title, @required this.channel})
      : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.title),),
      body: new Padding(
          padding: const EdgeInsets.all(20.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Form(
                  child: new TextFormField(
                    controller: _controller,
                    decoration: new InputDecoration(labelText: 'Send a message'),
                  )
              ),
              new StreamBuilder(
                  stream: widget.channel.stream,
                  builder: (context, snapshot){
                    return new Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: new Text(snapshot.hasData ? '$snapshot.data':''),
                    );
                  }
              )
            ],
          ),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: _sendMessage,
          tooltip: 'Send message',
          child: new Icon(Icons.send),
      ),
    );
  }
  
  void _sendMessage(){
    if(_controller.text.isNotEmpty){
      widget.channel.sink.add(_controller.text);
    }
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    widget.channel.sink.close();
    super.dispose();
  }
  
}
