import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MyListView();
  }
}

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InfiniteListView();
  }
}

class InfiniteListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  ScrollController _controller = new ScrollController();
  static const loadingTag = "##loadingTag##";
  var _words = <String>[loadingTag];
  bool showFloatButton = false;

  @override
  void initState() {
    _retrieveData();
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 500 && showFloatButton) {
        setState(() {
          showFloatButton = false;
        });
      } else if (_controller.offset >= 500 && showFloatButton == false) {
        setState(() {
          showFloatButton = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView")),
      body: Scrollbar(
          child: ListView.separated(
        controller: _controller,
        itemCount: _words.length,
        itemBuilder: (context, index) {
          if (_words[index] == loadingTag) {
            if (_words.length - 1 < 100) {
              _retrieveData();
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(strokeWidth: 2.0)),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16.0),
                child: Text("没有更多了", style: TextStyle(color: Colors.blue)),
              );
            }
          }
          return ListTile(
            title: Text(_words[index]),
          );
        },
        separatorBuilder: (context, index) => Divider(height: .0),
      )),
      floatingActionButton: !showFloatButton
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                //返回到顶部时执行动画
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
            ),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((data) {
      _words.insertAll(_words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {});
    });
  }
}
