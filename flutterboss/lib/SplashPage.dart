import 'package:flutter/material.dart';
import 'home.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  Timer _t;

  @override
  void initState() {
    super.initState();
    _t = new Timer(const Duration(milliseconds: 1500), (){
      try{
        Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(
            builder: (BuildContext context)=> new BossApp()),
            (Route route)=>route == null);
      }catch (e){

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: const Color.fromARGB(255, 0, 215, 198),
      child: new Padding(
          padding: const EdgeInsets.only(top: 150.0),
          child: new Column(
            children: <Widget>[
              new Text('Boss 招聘', style: const TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),)
            ],
          ),
      ),
    );
  }


  @override
  void dispose() {
    _t.cancel();
    super.dispose();
  }


}