import 'dart:async';
import 'package:flutter/material.dart';
import 'HttpUtil.dart';

void main(){
  runApp(new MaterialApp(
    title: 'input',
    home: new Scaffold(
      appBar: new AppBar(title: new Text('输入事件'),),
      body: new MyWeather(),
    ),
  ));
}

class MyWeather extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyWeatherState();
  }
}

class MyWeatherState extends State<MyWeather> with NetListener{
  var weather = 'delay';
  HttpManager httpManager = new HttpManager();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Column(
        children: <Widget>[
          new RaisedButton(
              child: new Text('三天的预报'),
              onPressed: (){
                _getWeatherForecast();
              }),
          new RaisedButton(
              child: new Text('获取实时天气'),
              onPressed: (){
                _getWeatherNewWeather();
              }),
          new Expanded(
              child: new Center(
                child: new ListView(
                  children: <Widget>[
                    new Text('$weather')
                  ],
                ),
              )
          )
        ],
      ),
    );
  }

  /**
   * 获取三天的预报
   */
  _getWeatherForecast() async {
    print('请求获取三天的预报');
    await httpManager.getForecast(this, '朝阳区');
  }

  /**
   * 获取实况天气
   */
  _getWeatherNewWeather() async {
    await httpManager.getNewWeather(this, "浦东新区");
  }

  /**
   * 获取实况天气
   */
  @override
  void onNewWeatherResponse(String body) {
    weather = body;
    setState(() {});
  }

  @override
  void onError(error) {
    // TODO: implement onError
  }

  @override
  void onForecastResponse(String body) {
    print('响应获取三天的预报');
    weather = body;
    setState(() {});
  }

}

