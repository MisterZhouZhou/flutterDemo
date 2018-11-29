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
    animation = new CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation.addStatusListener((state){
      if(state == AnimationStatus.completed){
        controller.reverse();
      }else if(state == AnimationStatus.dismissed){
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new AnimatedLogo(animation: animation,);
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


class AnimatedLogo extends AnimatedWidget {
  static final _opacityTween = new Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = new Tween<double>(begin: 0.1, end: 300.0);

  AnimatedLogo({Key key, Animation<double> animation}):super(key:key,listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Opacity(
          opacity: _opacityTween.evaluate(animation),
          child: new Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            height: _sizeTween.evaluate(animation),
            width: _sizeTween.evaluate(animation),
            child: new FlutterLogo(),
          ),
      ),
    );
  }
}