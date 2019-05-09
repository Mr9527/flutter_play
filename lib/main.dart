import 'package:enjoycar_agent_flutter/viewRoute.dart';
import 'package:enjoycar_agent_flutter/ioRoute.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Application")),
      body: new SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
            children: <Widget>[
              OutlineButton(
                  child: Text("View"),
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                      return new ViewRoute();
                    }));
                  }),
              OutlineButton(
                  child: Text("IO"),
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                      return new IOViewRoute();
                    }));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
