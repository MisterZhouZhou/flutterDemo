import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return new MaterialApp(
       title: 'Test',
       home: new Scaffold(
         appBar: new AppBar(
           title: new Text('Title')
         ),
         body: new FavoriteWidget(),
       ),
     );
  }
}

class FavoriteWidget extends StatefulWidget{
  @override
  FavoriteWidgetState createState() => new FavoriteWidgetState();
}

class FavoriteWidgetState extends State<FavoriteWidget>{
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      // If the lake is currently favorited, unfavorite it.
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
        // Otherwise, favorite it.
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          color: Colors.blue,
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
              icon: (_isFavorited ? new Icon(Icons.star) : new Icon(Icons.star_border)),
              color: Colors.red[500],
              onPressed: _toggleFavorite),
        ),
        new SizedBox(
          width: 18.0,
          child: new Container(
            child: new Text('$_favoriteCount'),
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}