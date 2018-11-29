import 'package:flutter/material.dart';
import 'package:helloapp/RandomWords.dart';
import 'package:helloapp/RandomWords2.dart';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';


// app 入口
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {


  _getIpAddress() async {

    Dio dio = new Dio();
    Response response = await dio.get('http://www.baidu.com');
    print(response);






//    var url = 'http://www.baidu.com';
//    var httpClient = new HttpClient();
//
//    String result;
//    try{
//      var request = await httpClient.getUrl(Uri.parse(url));
//      var response = await request.close();
//      if(response.statusCode == HttpStatus.OK) {
//         var json = await response.transform(Utf8Decoder()).join();
//         print(json);
////         var data = JsonDecoder(json);
////         result = data['origin'];
//      }else{
//        result =
//        'Error getting IP address:\nHttp status ${response.statusCode}';
//      }
//    }catch(exception) {
//      result = 'Failed getting IP address';
//    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('d'),
        ),
        body: new Center(
          child: new RaisedButton(onPressed: _getIpAddress, child: new Text('ddddd'),),
        ),
      )
    );
  }
}

