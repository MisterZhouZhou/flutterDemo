import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'GridView',
      home: new Scaffold(
        appBar: new AppBar(title: new Text('GridView'),),
        body: new MyGridView(),
      ),
    );
  }
}

class MyGridView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyGridViewState();
  }
}

class MyGridViewState extends State<MyGridView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
       child: _buildGrid4(),
    );
  }
}

/**
 * 1.最常用的网格布局之extent
 */
Widget _buildGrid1() {
  return new GridView.extent(
      maxCrossAxisExtent: 180.0,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    children: _buildGridTileList(30),
  );
}


/**
 * 2.最常用的网格布局之count
 */
Widget _buildGrid2() {
  return new GridView.count(
    //  横轴数量 这里的横轴就是x轴 因为方向是垂直的时候 主轴是垂直的
    crossAxisCount: 2,
    padding: const EdgeInsets.all(4.0),
    //主轴间隔
    mainAxisSpacing: 0.0,
    //横轴间隔
    crossAxisSpacing: 4.0,
    children: _buildGridTileList(30),
  );
}


/**
 * 3.滚动效果的ScrollView
 */
Widget _buildGrid3() {
  return new CustomScrollView(
    primary: false,
    slivers: <Widget>[
      new SliverPadding(
        padding: const EdgeInsets.all(20.0),
        sliver: new SliverGrid.count(
          crossAxisSpacing: 10.0,
          //      横轴数量 这里的横轴就是x轴 因为方向是垂直的时候 主轴是垂直的
          crossAxisCount: 2,
          children: _buildGridTileList(30),
        ),
      ),
    ],
  );
}


/**
 * 4.GridView.custom
 */
Widget _buildGrid4() {
  return new GridView.custom(
    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
//      横轴数量 这里的横轴就是x轴 因为方向是垂直的时候 主轴是垂直的
      crossAxisCount: 2,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    ),
    childrenDelegate: new SliverChildBuilderDelegate(
          (context, index) {
        return new Image.asset("images/1.jpg");
      },
      childCount: 30,
    ),
  );
}

List<Container> _buildGridTileList(int count) {
  return new List.generate(
      count,
          (int index) => new Container(
        child: new Image.asset("images/1.jpg"),
      ));
}