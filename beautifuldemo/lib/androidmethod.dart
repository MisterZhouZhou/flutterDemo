import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';      // 异步

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter & Android交互',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter & Android交互'),
        ),
        body: new HomeApp(),
      ),
    );
  }
}

class HomeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeAppPage();
  }
}

class HomeAppPage extends State<HomeApp> {
  static const platform = const MethodChannel("samples.flutter.io/battery");
  String _batteryLevel = "Unknown battery level.";

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try{
       print('dart-_getBatteryLevel');
       // 在通道上调用此方法
       final int result = await platform.invokeMethod('getBatteryLevel');
       batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e){
       batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new RaisedButton(onPressed: _getBatteryLevel,
          child: new Text('Get battery level'),
        ),
        new Text('当前电量:$_batteryLevel')
      ],
    );
  }

}