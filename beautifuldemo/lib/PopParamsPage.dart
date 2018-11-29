import 'dart:async';  // 异步
import 'package:flutter/material.dart';  // 应用
import 'package:meta/meta.dart';         //

void main(){
  runApp(new MaterialApp(
    title: 'chen',
    home: new HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text('返回带参数'),),
      body: new Center(child: new SelectionButton(),),
    );
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RaisedButton(
        onPressed: (){
          print("----A------");
          _navigatorAndDisplaySelection(context);
          print("----B------");
        },
        child: new IconButton(icon: const Icon(Icons.shopping_cart, color: Colors.red,), onPressed: null),
    );
  }
}

/**
 *第一种异步方式 async await
 * 启动并等待返回结果
 */
//_navigatorAndDisplaySelection(BuildContext context) async {
//  var result = await Navigator.push(context, new MaterialPageRoute(builder: (context)=> new SelectionScreen()));
//  Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('$result')));
//}

/**
 *  第二种异步方式 Future API
 * 启动后不等待返回结果 但是返回后有回调函数 相当于注册了一个接收者
 */
_navigatorAndDisplaySelection(BuildContext context) {
  print("----c------");
  Navigator
      .push(context,
      new MaterialPageRoute(builder: (context) => new SelectionScreen()))
      .then((result) {
    print("----E------");
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text("$result")));
  }).catchError((error) {
    print("$error");
  });
  print("----d------");
}



/**
 * 在购物车页面中显示两个商品
 */
class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("购物车"),
      ),
      body: new Center(
        //创建一个垂直的布局
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _getPadding(context, "三级头"),
            _getPadding(context, "三级甲"),
          ],
        ),
      ),
    );
  }

  Widget _getPadding(BuildContext context, String text) {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new RaisedButton(
        onPressed: () {
          Navigator.pop(context, text);
        },
        child: new Text(text),
      ),
    );
  }
}