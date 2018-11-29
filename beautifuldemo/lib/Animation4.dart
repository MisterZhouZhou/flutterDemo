import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';   // 动画

void main(){
  runApp(new AnimationApp());
}

class AnimationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Animation',
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Animation'),),
        body: new MyAnimation(),
      ),
    );
  }
}

class MyAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyLogoState();
  }
}

class MyLogoState extends State<MyAnimation> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;

  /**
   *重写此方法以执行初始化 每次构建State调用此方法一次 注意如果重写此方法 必须加 super.initState();
   */
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 动画控制器
    controller = new AnimationController(
      //vsync 需要实现TickerProviderStateMixin or SingleTickerProviderStateMixin 可以避免动画不在当前屏幕显示时消耗资源
        duration: const Duration(milliseconds: 2000),//持续时间
        vsync: this);
    CurvedAnimation curvedAnimation = new CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(curvedAnimation);
    // 开始执行动画
    controller.forward();
  }

  @override
  build(dynamic) {
    return new GrowTransition(
      child: new LogoWidget(),
      animation: animation,
    );
  }


  /**
   * 从树种删除此对象时调用释放资源
   */
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

}


class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      child: new FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  GrowTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return new Center(
//      顾名思义 AnimatedBuilder是用于构建动画的widget
      child: new AnimatedBuilder(
//        动画 没啥好说的
        animation: animation,
//        每次动画改变值时调用
        builder: (BuildContext contextm, Widget child) {
          return new Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
//        执行动画的事件源 这里很简单就是LogoWidget 就是一个Flutter LOGO
        child: child,
      ),
    );
  }
}