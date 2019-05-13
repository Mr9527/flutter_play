import 'dart:async' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativePluginRoute extends StatelessWidget {
  static const plugin = const MethodChannel('samples.flutter.io/plugin');

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Native Plugin Test"),
      ),
      body: Column(
        children: <Widget>[
          OutlineButton(
            child: Text("send Message"),
            onPressed: () {
              plugin.invokeMapMethod("print",{"message":"flutter second Message"});
            },
          ),
          PluginResultWidget(
            channel: plugin,
          )
        ],
      ),
    );
  }
}

class PluginResultWidget extends StatefulWidget {
  final MethodChannel channel;

  const PluginResultWidget({Key key, this.channel}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _PluginResultWidgetState();
}

class _PluginResultWidgetState extends State<PluginResultWidget> {
  String text = "obtain message";
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Text(text),
      onPressed: _obtainPluginInfo,
    );
  }

  Future<Null> _obtainPluginInfo() async {
    try {
      final String message = await widget.channel.invokeMethod("obtainInfo");
      setState(() {
        text = message;
      });
    } on PlatformException catch (e) {
      setState(() {
        text = "plugin connet error";
      });
    }
  }
}
