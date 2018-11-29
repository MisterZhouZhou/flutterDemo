/**
 * 动画实例2- AnimatedWidget简化
 */
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(new MaterialApp(
    title: 'd',
    home: new Scaffold(
      appBar: new AppBar(title: new Text('d'),),
      body: new LogoApp(),
    ),
  ));
}

/**
 * AnimatedWidget会自动调用addlistener和setState
 */
class AnimatedLogo extends AnimatedWidget{
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: new FlutterLogo(),
      ),
    );
    return null;
  }
  AnimatedLogo({Key key, Animation<double> animation}):super(key:key, listenable: animation);
}

class LogoApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _LogoAppState();
  }
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this,
        duration: const Duration(milliseconds: 2000));
    animation = new Tween(begin: 0.0,end: 300.0).animate(controller);
    controller.forward();
  }

  @override
  build(dynamic ) {
    return new AnimatedLogo(animation: animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
