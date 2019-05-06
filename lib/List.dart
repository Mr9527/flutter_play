import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("ListView"),  
      ),
      body: new MyListView(),
    );
  }
}

class MyListView  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(title: Text("this is ListView Title")),
        Expanded(
          child: InfiniteListView(),
        )
      ],
    );
  }
}

class InfiniteListView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => new _InfiniteListViewState();
  
  }
  
class _InfiniteListViewState  extends State<InfiniteListView>{
    
    static const loadingTag = "##loadingTag##";
    var _words =<String>[loadingTag];

  @override
  void initState() {
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context,index){
        if (_words[index]==loadingTag) {

          if (_words.length-1<100) {
             _retrieveData();
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: SizedBox(width: 24.0,height: 24.0,child: CircularProgressIndicator(strokeWidth: 2.0)),
                );
          } else {
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16.0),
                child: Text("没有更多了",style:TextStyle(color: Colors.blue)),
                );
               }
              }
            return ListTile(title: Text(_words[index]),);
             },
       separatorBuilder: (context, index) => Divider(height: .0),
            );  
          }
        
          void _retrieveData() {
                  Future.delayed(Duration(seconds: 2)).then((data){
                    _words.insertAll(_words.length-1, generateWordPairs().take(20).map((e)=>e.asPascalCase).toList());
                  setState(() {
                    
                  });
                  });
          }
}