import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final int initValue;

  const CounterWidget({Key key, this.initValue: 0});

  @override
  State<StatefulWidget> createState() => CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  int _counter;

  /// 当 Widget 第一次插入到 Widget 树中时会被调用，对于每一个 State 对象， Flutter framework 只会调用一次该回调
  /// 所以，通常在该回调做一些一次性的操作，如状态初始化，订阅子树事件通知等。
  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
  }

  /// 1. 在调用 initState 后会被调用
  /// 2. 在 didUpateWidget 后会被嗲用
  /// 3. 在 setState 后会被调用
  /// 4. 在 didChangedDependencies 后会被调用
  /// 5. 在 deactivate 后又被重新插入到树的其他位置之后会被嗲用
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("counter")),
      body: FloatingActionButton(
        child: Text("$_counter"),
        backgroundColor: Colors.blue,
        onPressed: () => setState(() => ++_counter),
      ),
    );
  }

  /// 在 Widget 重新构建时，Flutter Framework 会调用 Widget.canUpate 来检测 Widget 树中同一位置的新旧节点，然后决定是否需要更新，如果 Widget.canUpate 返回 ture 则会调用此回调
  /// ，然后决定是否更新，如果 Widget canUpate 返回 true 则会调用此回调。正如之前所述， Widget。canUpdate 会判断新旧 Widget 的 key 和 runtimeType 是否相等来决定是否更新，当它们
  /// 都相等的时候就会调用 canUpdate 继而调用 didUpateWidget 
  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  // 当 State 对象从树中被移除的时候会回调此方法
  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

 /// 当 State 对象从树中被永久移除时调用；通常在此回调中释放资源
  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  /// 此回调是专门为开发调试所提供的，会在热重载的时候被嗲用，在 Release 模式下永远不会被回调
  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  // didChangeDependencies 当 State 对象的依赖发生变化时会被调用；
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
