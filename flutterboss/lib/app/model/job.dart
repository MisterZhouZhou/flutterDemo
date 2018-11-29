import 'dart:convert';
import 'package:flutter/material.dart';


class Job {
  final String name;
  final String cname;
  final String size;
  final String salary;
  final String username;
  final String title;


  Job({@required  this.name, @required this.cname, @required this.size, @required this.salary, @required this.username, @required this.title});

  static List<Job> fromJson(String jsonStr) {
    List<Job> resultArray = new List<Job>();
    List listArray = json.decode(jsonStr)['list'];
    for(Map map in listArray){
      Job job = Job.fromMap(map);
      resultArray.add(job);
    }
    return resultArray;
    // 下面的报错
    return json.decode(jsonStr)['list'].map((obj) => Job.fromMap(obj)).toList();
  }

  static Job fromMap(Map map) {
    return new Job(name: map['name'], cname: map['cname'], size: map['size'], salary: map['salary'], username: map['username'], title: map['title']);
  }
}