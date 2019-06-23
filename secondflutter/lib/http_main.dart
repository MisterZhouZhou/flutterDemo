import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
            primaryColor: Colors.lightBlue[500], accentColor: Colors.cyan[600]),
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('data'),
        ),
        body: new Center(
          child: new FutureBuilder<Post>(
            future: fetchPost(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                  return new Text(snapshot.data.title);
              }else if(snapshot.hasError){
                return new Text("${snapshot.error}");
              }
              return new CircularProgressIndicator();
            },
          ),
        )
    );
  }
}

Future<Post> fetchPost() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');
  final responseJson = json.decode(response.body);
  return new Post.fromJson(responseJson);
}


Future<Post> fetchDioPost() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/posts/1', headers: {HttpHeaders.AUTHORIZATION: 'Basic your_api_token_here'});
  final responseJson = jsonDecode(response.body);
  return new Post.fromJson(responseJson);
}


class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json){
    return new Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}