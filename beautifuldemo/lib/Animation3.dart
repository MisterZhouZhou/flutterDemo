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

    animation  = new Tween(begin: 0.0, end: 300.0).animate(controller)..addListener((){
//      if (state == AnimationStatus.completed) {
//          controller.reverse();
//          //当动画在开始处停止再次从头开始执行动画
//      } else if (state == AnimationStatus.dismissed) {
//          controller.forward();
//      }
    });
    // 开始执行动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),// 对称
        height: animation.value,
        width: animation.value,
        child: new FlutterLogo(),
      ),
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