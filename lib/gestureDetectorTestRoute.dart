import 'package:flutter/material.dart';

class GestureDetectorTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GestureDetectorState();
}

class GestureDetectorState extends State<GestureDetectorTestRoute> {
  String _operation = "No Gesture Detector";
  double _top = 0.0;
  double _left = 0.0;
  double _width = 200.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
              top: _top,
              left: _left,
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  width: 200.0,
                  height: _width,
                  child: Text(
                    _operation,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onTap: () => updateText("Tap"),
                onDoubleTap: () => updateText("Double Tap"),
                onLongPress: () => updateText("Long Tap"),
                onPanDown: (DragDownDetails e) => updateText("Press Down"),
                onPanEnd: (DragEndDetails e) => updateText("Up"),
                onPanUpdate: (DragUpdateDetails e) {
                  updateText("move");
                  setState(() {
                    _left += e.delta.dx;
                    _top += e.delta.dy;
                  });
                },
                // onScaleUpdate: (ScaleUpdateDetails details) {
                //   setState(() {
                //     //缩放倍数在0.8到10倍之间
                //     _width = 200 * details.scale.clamp(.8, 10.0);
                //   });
                // },
              ))
        ],
      ),
    );
  }

  void updateText(String text) {
    setState(() {
      _operation = text;
    });
  }
}
