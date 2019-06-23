import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'pages/mybutton.dart';
import 'pages/CounterDisplay.dart';

void main() => runApp(MyApp());

final Uint8List kTransparentImage = new Uint8List.fromList([
0x89,
0x50,
0x4E,
0x47,
0x0D,
0x0A,
0x1A,
0x0A,
0x00,
0x00,
0x00,
0x0D,
0x49,
0x48,
0x44,
0x52,
0x00,
0x00,
0x00,
0x01,
0x00,
0x00,
0x00,
0x01,
0x08,
0x06,
0x00,
0x00,
0x00,
0x1F,
0x15,
0xC4,
0x89,
0x00,
0x00,
0x00,
0x0A,
0x49,
0x44,
0x41,
0x54,
0x78,
0x9C,
0x63,
0x00,
0x01,
0x00,
0x00,
0x05,
0x00,
0x01,
0x0D,
0x0A,
0x2D,
0xB4,
0x00,
0x00,
0x00,
0x00,
0x49,
0x45,
0x4E,
0x44,
0xAE,
]);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // primarySwatch: Colors.blue,  // 主题
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[500],
        accentColor: Colors.cyan[600]
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      new Column(
        children: <Widget>[
          new Container(
            width: 200,
            height: 200,
            child: new Image.network(
                "https://img-blog.csdn.net/20160510110020141"),
          ),
 
          new Container(
            width: 200,
            height: 200,
            padding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: new Image.network(
                "https://img-blog.csdn.net/20160418120631895"),
          ),
 
          // //占位符
          // new Container(
          //     width: 200,
          //     height: 200,
          //     padding: new EdgeInsets.symmetric(
          //         vertical: 15.0, horizontal: 15.0),
          //     child: new FadeInImage.memoryNetwork(
          //         placeholder: kTransparentImage,
          //         image: "https://img-blog.csdn.net/20160510110020141")
          // ),
 
          //网络缓存
          new Container(
              width: 200,
              height: 200,
              padding: new EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: 15.0),
              child: new CachedNetworkImage(
                placeholder: (context, url) => new CircularProgressIndicator(),
                imageUrl: 'https://avatar.csdn.net/5/F/0/3_zww1984774346.jpg',
              )
          )

          // Image(image: new CachedNetworkImageProvider('https://img-blog.csdn.net/20160418120631895'))

        ],
 
 
      );
  }
}

// 


/*
* 一个带渐变颜色的正方形
* */
class Box extends StatelessWidget {
  String index;
  double boxSize=100;

  Box(String index) {
    this.index = index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: boxSize,
      height: boxSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.orange, Colors.deepOrange]),
      ),
      child: Text(
        index,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

Widget getColumn(){
  return new Scaffold(
        appBar: new AppBar(title: new Text('Welcome to Flutter'),),
        body: Container(
      width: double.infinity,
      height: 500,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Box("1"),
          Box("2"),
          Box("3"),
        ],
      ),
    )
      ); 
}


// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 


class ScaffoldHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ScaffoldHome();
  }
}

class _ScaffoldHome extends State<ScaffoldHome> {
  int _count = 0;
  
  void test(){
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(title: new Text('Welcome to Flutter'),),
        body: new Column(
          children: <Widget>[
            new Text('You have pressed the button $_count times.'),
            new Image.network('https://avatar.csdn.net/5/F/0/3_zww1984774346.jpg'),
            //new Image.network('https://github.com/flutter/plugins/raw/master/packages/video_player/doc/demo_ipod.gif'),
            // new FadeInImage.memoryNetwork(
            //   placeholder: kTransparentImage,
            //   image: 'https://avatar.csdn.net/5/F/0/3_zww1984774346.jpg',
            // ),

            // new Stack(
            //   children: <Widget>[
            //     new Center(child: new CircularProgressIndicator(),),
            //     new Center(
            //       child: new FadeInImage.memoryNetwork(
            //         placeholder: kTransparentImage,
            //         image: 'https://avatar.csdn.net/5/F/0/3_zww1984774346.jpg',
            //       ) ,
            //     )
            //   ],
            // )
          ],
        ),
        bottomNavigationBar: new BottomAppBar(
          child: new Container(height: 50.0,),
        ),
        floatingActionButton: new Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.red),
          child: new FloatingActionButton(
            onPressed: test,
            child: new Icon(Icons.add),
            tooltip: 'Counter',
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  ); ;
  }
}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 


/*
 *  Text
 */
Widget getTextHome(context){
  final _name = 'dd';

  Widget test1(){
    return new Text(
          'Hello, $_name! How are you?',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
        );
  }

  Widget test2(){
    return new Text.rich(
      TextSpan(
        text: 'Hello',
        children: <TextSpan>[
          TextSpan(text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
          TextSpan(text: ' world ', style: TextStyle(fontWeight: FontWeight.bold))
        ]
      )
    );
  }

  return new Scaffold(
        appBar: new AppBar(title: new Text('Welcome to Flutter'),),
        body: test2()
      ); 
}



// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 


/*
 *  transform
 */
Widget getColumnHome(context){

  Widget _test1(){
    return new Column(
            children: <Widget>[
              new Text('Deliver features faster'),
              new Text('Craft beautiful UIs'),
              new Expanded(
                child: FittedBox(child: const FlutterLogo(), fit: BoxFit.contain,),
              ),
            ],
          );
  }

  Widget _test2(context){
   return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Text('We move under cover and we move as one'),
        new Text('Through the night, we have one shot to live another day'),
        new Text('We cannot let a stray gunshot give us away'),
        new Text('We will fight up close, seize the moment and stay in it'),
        new Text('It’s either that or meet the business end of a bayonet'),
        new Text('The code word is ‘Rochambeau,’ dig me?'),
        new Text('Rochambeau!', style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.0)), // 改为2.0会报错
      ],
    );
  }

  return new Scaffold(
        appBar: new AppBar(title: new Text('Welcome to Flutter'),),
        body: _test2(context)
      ); 
}


// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 



/*
 *  transform
 */
Widget getRowHome(context){
  return new Scaffold(
        appBar: new AppBar(title: new Text('Welcome to Flutter'),),
        body: new Column(
          children: <Widget>[
              new Row(
                children: <Widget>[
                  new Expanded(child: Text('Deliver features faster', textAlign: TextAlign.center,),),
                  new Expanded(child: Text('Craft beautiful UIs', textAlign: TextAlign.center),),
                  new Expanded(child: FittedBox(child: const FlutterLogo(), fit: BoxFit.contain),)
                ],
              ),
              new Row(
                children: <Widget>[
                  const FlutterLogo(),
                  const Text('Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
                  const Icon(Icons.sentiment_very_satisfied)
                ],
              ),
              new Row(
                children: <Widget>[
                  const FlutterLogo(),
                  const Expanded(
                    child: Text('Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
                  ),
                  const Icon(Icons.sentiment_very_satisfied)
                ],
              )
          ],
        )
      ); 
}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 


/*
 *  transform
 */
Widget getContainerHome(context){
  return new Scaffold(
        appBar: new AppBar(title: new Text('Welcome to Flutter'),),
        body: new Container(
          constraints: BoxConstraints.expand(
            height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0
          ),
          // height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
          padding: const EdgeInsets.all(8.0),
          color: Colors.blue[500],
          alignment: Alignment.center,
          child: new Text('Hello World!', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white),),
          transform: Matrix4.rotationZ(0.1),
        ),
      ); 
}


// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 


class Product {
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallBack(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
    : product = product, 
    super(key: new ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallBack onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor; 
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
      onTap: (){
        onCartChanged(product, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(product.name, style: _getTextStyle(context)),
    );
  }
}


class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}):super(key: key);
  final List<Product> products;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set<Product>();
  
  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if(inCart){
        _shoppingCart.add(product);
      }else{
        _shoppingCart.remove(product);
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text('Shopping List'),),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList()
      ),
    );
  }
}


// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: new Text('Example title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search2',
            onPressed: null,
          ),
        ],
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Text('Hello,world!'),
            new MyButton(),
            new Counter()
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add',
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}


// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 

class MyAppBar extends StatelessWidget {
  MyAppBar({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 56.0, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      padding: const EdgeInsets.fromLTRB(18.0, 20.0, 18.0, 0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          new Expanded(
            child: new Center(
              child: new Text(title, style: new TextStyle(fontSize: 16.0)),
            )
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(title: 'Example title'),
          new Expanded(
            child: new Center(
              child: new Text('Hello world!'),
            ),
          )
        ],
      ),
    );
  }
}


// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandowWordsState();
  }
}

class RandowWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

   void _pushSaved(){
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context){
          final tiles = _saved.map(
            (wordPair){
                return new ListTile(
                  title: new Text(wordPair.asPascalCase, style: _biggerFont,)
                );
            }
          );
          final divided = ListTile.divideTiles(context: context, tiles: tiles).toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggesstions'),
            ),
            body: new ListView(children: divided,),
          );
        }
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved,)
          ],
        ),
        body: _buildSuggestions(),
    );
  }

  void _rowClick(alreadSaved, wordPair){
    setState(() {
          if(alreadSaved){
            _saved.remove(wordPair);
          }else{
            _saved.add(wordPair);
          }
    });
  }

  /*
   * row 配置 
   */
  Widget _buildRow(WordPair wordPair){
    final alreadSaved = _saved.contains(wordPair);
    return new ListTile(
      title: new Text(wordPair.asPascalCase, style: _biggerFont),
      trailing: new Icon(alreadSaved? Icons.favorite: Icons.favorite_border, color: alreadSaved?Colors.red:null,),
      onTap: ()=>_rowClick(alreadSaved, wordPair),
    );
  }

  Widget _buildSuggestions(){
    return new ListView.builder(
    padding: const EdgeInsets.all(16.0),
    itemBuilder: (context ,i){
      if(i.isOdd) return new Divider();  // 偶数行添加分割线
      final index = i ~/ 2;
      if(index >= _suggestions.length){
        // 接着再生成10个单词对，然后添加到建议列表
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    },
  );
}

}



/*
 *  函数式获取英文字母
 */
Widget getWordHome(){
  final wordPair = new WordPair.random();
  final wordPair2 = new WordPair('first', 'second');
  return new Scaffold(
        appBar: new AppBar(title: new Text('Welcome to Flutter'),),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new Text(wordPair.asPascalCase),
              new Text(wordPair2.asPascalCase)
            ],
          ),
        ),
      ); 
}

/*
 *  函数式获取首页内容
 */
Widget getHome(){
  return new Scaffold(
        appBar: new AppBar(title: new Text('Welcome to Flutter'),),
        body: new Center(
          child: new Text('Hello World'),
        ),
      ); 
}


// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 

/*
 *  组件式获取首页内容
 */
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
