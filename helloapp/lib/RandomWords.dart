import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

/*
 * 随机字符组件 
 */
class RandomWords extends StatefulWidget {
  @override
  createState()=> new RandomWordsState(); 
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  /*
   * 更新状态
   */
  updateData(alreadySaved, pair){
    setState(() {
      if(alreadySaved){
        _saved.remove(pair);
      }else{
        _saved.add(pair);
      }
    });
  }

  Widget _buildSuggestions(){
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
         if(i.isOdd) return new Divider();
         final index = i ~/ 2;
         if(index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
         }
         return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: ()=> updateData(alreadySaved, pair),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator')
      ),
      body: _buildSuggestions(),
    );
  }
}
