// Step 2: Add the English words package and generate a word pairing each
// time the app is hot reloaded.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.pink
      ),
      title: 'Welcome to Flutter',
      home:new RandomWords(),
      );
  }
}
class RandomWords extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      return new RandomWordsState();
    }
}

class RandomWordsState extends State<RandomWords>{
      //在flutter中使用_下划线开头时，会使其强制变成私有的
    final _suggestions = <WordPair>[];

    final _saved = new Set<WordPair>();

    final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
      appBar: new AppBar(
        title: new Text("startup Name"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list),onPressed: _pushSaved),
          new IconButton(icon:new Icon(Icons.image),onPressed:_pushImage ),
        ],
      ),
      body:_buildSuggerstions(),
    );
    }

  Widget _pushImage(){
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (context){
          return new Scaffold(
            appBar: new AppBar(
              title: new Text("images"),
            ),
            body: new Image.asset('images/lake.jpg',width: 600.0,height:240.0 ,fit: BoxFit.cover,)
          );
        }
    ));
  }

  Widget _pushSaved(){
  Navigator.of(context).push(new MaterialPageRoute(
builder: (context){
  final title =_saved.map(
    (pair){
      return new ListTile(
        title: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
      );
    },
  );
 final divider =ListTile.divideTiles(context: context,tiles: title).toList();
 return new Scaffold(
   appBar: new AppBar(
     title: new Text("Save Suggestions"),
    ),
    body: new ListView(children:divider),
  );
  },
  ),
  );
}


  Widget _buildSuggerstions(){
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context,i){
      // 在每一列之前，添加一个1像素高的分隔线widget
        if(i.isOdd) return new Divider();
         // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
        // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
        final index = i ~/ 2;
        //如果到达尾部则再继续添加数据
        if(index>=_suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair word){
    final alreadySaved=_saved.contains(word);
    return new ListTile(  
      title: new Text(word.asPascalCase,
      style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved?Icons.favorite:Icons.favorite_border,
        color: alreadySaved?Colors.red:null,
      ),
      onTap: (){
        setState(() {
           if(alreadySaved){
              _saved.remove(word);
           }else{
             _saved.add(word) ;
           }
          });
      },
      );
  }
} 