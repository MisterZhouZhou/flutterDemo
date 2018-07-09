import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

// StatelessWidget不需要可变状态的小部件
class MyApp extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(
        primaryColor: Colors.white
      ),
      home: new RandomWords()
    );
  }
}


class RandomWords extends StatefulWidget{
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  // 交互事件
  final _saved = new Set<WordPair>();
  Widget _buildSuggestions(){
    return new ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, i){
          if(i.isOdd) return new Divider();
          final index = i ~/ 2;
          if(index >= _suggestions.length){
            // 追加10条数据
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  // item cell
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

  void _pushSaved(){
      Navigator.of(context).push(
         new MaterialPageRoute(
             builder: (context){
               final tiles = _saved.map(
                   (pair){
                     return new ListTile(
                       title: new Text(
                         pair.asPascalCase,
                         style: _biggerFont,
                       ),
                       trailing: new Icon(Icons.favorite_border, color: null,),
                     );
                   }
               );
               final divided = ListTile.divideTiles(
                   context: context,
                   tiles: tiles
               ).toList();

               return new Scaffold(
                 appBar: new AppBar(
                   title: new Text('Saved Suggestions'),
                 ),
                 body: new ListView(children: divided),
               );

             }
         )
      );
  }
  
   @override
  Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(
         title: new Text('Startup Name Generator'),
         actions: <Widget>[
           new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
         ],
       ),
       body: _buildSuggestions(),
     );
  }

}