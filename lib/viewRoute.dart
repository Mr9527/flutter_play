import 'package:flutter/material.dart';
import 'package:enjoycar_agent_flutter/view/list.dart';
import 'package:enjoycar_agent_flutter/view/gridViewView.dart';
import 'package:enjoycar_agent_flutter/view/singleChildScrollViewImpl.dart';
import 'package:enjoycar_agent_flutter/view/customScrollViewImpl.dart';
import 'package:enjoycar_agent_flutter/view/counterWidget.dart';
import 'package:enjoycar_agent_flutter/view/willPopScope.dart';
import 'package:enjoycar_agent_flutter/view/gestureDetectorTestRoute.dart';
import 'package:enjoycar_agent_flutter/view/animationTestRoute.dart';
import 'package:enjoycar_agent_flutter/view/advancedAnimation.dart';
import 'package:enjoycar_agent_flutter/view/turnBox.dart';
import 'package:enjoycar_agent_flutter/view/myCanvas.dart';
import 'package:enjoycar_agent_flutter/view/circularProgressIndicator.dart';
import 'package:enjoycar_agent_flutter/view/viewGroup.dart';

class ViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("ViewPreview"),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            WrapTestWidget(),
            StackTestWidget(),
            FloatingActionButton(
              child: Text("List"),
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new ListPage();
                }));
              },
            ),
            FlatButton(
                child: Text("SingleChildScrollView"),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new SingleChildScrollViewImpl();
                  }));
                }),
            FlatButton(
                child: Text("围棋"),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new WeiQiRoute();
                  }));
                }),
            RaisedButton(
                child: Text("GrdiView"),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new GridViewPreview();
                  }));
                }),
            OutlineButton(
                child: Text("CustomScrollView"),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new CustomScrollViewImpl();
                  }));
                }),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("CounterWidget"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () => {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                      return new CounterWidget();
                    }))
                  },
            ),
            OutlineButton(
                child: Text("WillPopScopeTest"),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new WillPopScopeTestRoute();
                  }));
                }),
            OutlineButton(
                child: Text("getstureDetectorTest"),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new GestureDetectorTestRoute();
                  }));
                }),
            OutlineButton(
                child: Text("animtaion"),
                onPressed: () {
                  Navigator.push(
                      context,
                      new PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 500),
                          pageBuilder: (BuildContext context,
                              Animation animation,
                              Animation scondaryAnimation) {
                            return FadeTransition(
                                opacity: animation,
                                child: AnimationTestRoute());
                          }));
                }),
            OutlineButton(
                child: Text("AdvancedAnimation"),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new StaggerView();
                  }));
                }),
            OutlineButton(
                child: Text("TurnBox"),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new TurnBoxRoute();
                  }));
                }),
            OutlineButton(
                child: Text("progressBar"),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new GradientCircularProgressRoute();
                  }));
                }),
            OutlineButton(
                child: Text("group"),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new ViewGruop();
                  }));
                }),
          ],
        )));
  }
}

class WrapTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      alignment: WrapAlignment.start,
      children: <Widget>[
        new Chip(
          avatar:
              new CircleAvatar(backgroundColor: Colors.blue, child: Text("C")),
          label: Text("ChenZhaoJun"),
        ),
        new Chip(
          avatar:
              new CircleAvatar(backgroundColor: Colors.blue, child: Text("X")),
          label: Text("XunPei"),
        ),
        new Chip(
          avatar:
              new CircleAvatar(backgroundColor: Colors.blue, child: Text("C")),
          label: Text("Cooper"),
        ),
        new Chip(
          avatar:
              new CircleAvatar(backgroundColor: Colors.red, child: Text("B")),
          label: Text("Boss"),
        ),
      ],
    );
  }
}

class StackTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Container(
          margin: EdgeInsets.only(left: 10),
          width: 80.0,
          height: 80.0,
          color: Colors.red,
        ),
        new Container(
          margin: EdgeInsets.only(left: 15),
          width: 80.0,
          height: 80.0,
          color: Colors.green,
        ),
        new Container(
          margin: EdgeInsets.only(left: 18),
          width: 80.0,
          height: 80.0,
          color: Colors.blue,
        ),
        new Container(
          margin: EdgeInsets.only(left: 20),
          width: 80.0,
          height: 80.0,
          color: Colors.yellow,
        ),
        new Container(
          margin: EdgeInsets.only(left: 22),
          width: 80.0,
          height: 80.0,
          color: Colors.brown,
        ),
        new Container(
          margin: EdgeInsets.only(left: 24),
          width: 80.0,
          height: 80.0,
          color: Colors.purple,
        ),
        Positioned(
          left: 26,
          child: new Container(
            width: 80.0,
            height: 80.0,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (var i = 0; i < context.childCount; i++) {
      var width = context.getChildSize(i).width + x + margin.right;
      //如果长度小于父容器长度则横向绘制，否则则另一起一行
      if (width < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = width + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
