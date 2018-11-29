import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: '我的应用',
    home: new CartHome(),
  ));
}

class CartHome extends StatelessWidget {

  /**
   * 打开购物车
   */
  openCart(){
    print('打开购物车操作');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(icon: new Icon(Icons.menu), onPressed: null, tooltip: '导航菜单',),   // 标题之前显示的图标
        title: new Text('京西商城'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.shopping_cart),tooltip: '打开购物车', onPressed: ()=>openCart())
        ],
      ),
      body: new Center(
        child: new Text('hello flutter1'),
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: '添加',
          child: new Icon(Icons.add),
          onPressed: null,
          backgroundColor: Colors.pink,
      ),
    );
  }
}

