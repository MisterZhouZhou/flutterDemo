import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // app入口
  // @override
  // Widget build(BuildContext context) {
  //   return new MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: new ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: new MyHomePage(title: 'Flutter Demo Home Page'),
  //   );
  // }

  @override
  Widget build(BuildContext context){
    // Material是一种标准的移动端和web端的视觉设计语言
    // main函数使用了(=>)符号, 这是Dart中单行函数或方法的简写。
    // 该应用程序继承了 StatelessWidget，这将会使应用本身也成为一个widget
    // Scaffold 是 Material library 中提供的一个widget, 它提供了默认的导航栏、标题和包含主屏幕widget树的body属性。widget树可以很复杂
    // final sordPair = new WordPair.random();
    return new MaterialApp(
       title: 'Welcome to Flutter',
       home: new RandomWords(),

      //  home: new Scaffold(
      //    appBar: new AppBar(
      //      title: new Text('Welcome to Flutter'),
      //    ),
      //    body: new Center(
      //     //  child: new Text('Hello World'),
      //     //  child: new Text(sordPair.asPascalCase)
      //     child: new RandomWords(),
      //    ),
      //  )
    );
  }
}

// 创建一个带有state的组件
class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

// class RandomWordsState extends State<RandomWords>{
//   @override
//   Widget build(BuildContext context){
//      final wordPair = new WordPair.random();
//      return new Text(wordPair.asPascalCase);
//   }
// }



class RandomWordsState extends State<RandomWords>{
  // 该变量以下划线（_）开头，在Dart语言中使用下划线前缀标识符，会强制其变成私有的
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  // 设置字体样式
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions(){
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context,i){
          // 奇数行添加一条分割线
          if(i.isOdd) return new Divider();
          final index = i ~/ 2;
          if(index>=_suggestions.length){
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair){
    final alreadySaved = _saved.contains(pair);
      return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
          trailing: new Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
          ),
          onTap: (){
            setState(() {
               if(alreadySaved){
                 _saved.remove(pair);
               }else{
                 _saved.add(pair);
               }    
            });
          },
      );
    }

  @override
  Widget build(BuildContext context){
     return new Scaffold(
          appBar: new AppBar(
            title: new Text('Startup Name Generator'),
          ),
          body: _buildSuggestions(),
     );
  }
}


// ####################################################


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
