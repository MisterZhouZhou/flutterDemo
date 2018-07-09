import 'package:flutter/material.dart';
//import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  final appName = 'Custom Themes';
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appName,
      theme: new ThemeData(
        brightness: Brightness.dark,   // 亮度
        primaryColor: Colors.lightBlue[800],  // 导航颜色
        accentColor: Colors.cyan[600]         //
      ),
      home: new MyHomePage(title: appName)
    );
  }
}


class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, @required this.title}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(title),),
      body: new Container(
          height: 2000.0,
          color: Theme.of(context).accentColor,
          child: new Column(
            children: <Widget>[
//              new Text(
//                'Text with a background color',
//                style: Theme.of(context).textTheme.title,
//              ),
//              new Image.network(
//                'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
//                height: 40.0,
//                width: 375.0,
//              ),
//              new Image.network(
//                 'https://github.com/flutter/plugins/raw/master/packages/video_player/doc/demo_ipod.gif?raw=true',
//              ),
//                new FadeInImage.memoryNetwork(
//                    placeholder: kTransparentImage,
//                    image: 'https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true',
//                )

//              new CachedNetworkImage(
//                placeholder: new CircularProgressIndicator(),
//                imageUrl:
//                'https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true',
//              ),

            ],
          )
        ),
      floatingActionButton: new Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.yellow), 
          child: new FloatingActionButton(onPressed: null, child: new Icon(Icons.add),)),
    );
  }
}