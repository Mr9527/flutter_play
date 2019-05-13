import 'package:flutter/material.dart';
import 'package:enjoycar_agent_flutter/io/diskTestRoute.dart';
import 'package:enjoycar_agent_flutter/io/nativePluginRoute.dart';

class IOViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("IO Control Preview"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              OutlineButton(
                  child: Text("disk"),
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                      return new FileOperationRoute();
                    }));
                  }),
              OutlineButton(
                  child: Text("plugin"),
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                      return new NativePluginRoute();
                    }));
                  }),
            ],
          )
        ],
      ),
    );
  }
}
