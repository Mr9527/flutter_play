import 'package:flutter/material.dart';

class AnimationTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimationBuildTestState();
}

class AnimationBuildTestState extends State<AnimationTestRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation = new Tween(begin: 0.0, end: 300.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceIn));
    controller.forward();
    animation.addStatusListener((status) {
      print(status);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      widget: new Text(
        "Hello Animation",
        style: TextStyle(decoration: TextDecoration.none),
      ),
      animation: animation,
    );
  }
}

/// 通过 AnimationWidget 虽然可以从动画中把 Widget 分离出来，但是 渲染过程任然还在 AnimtaionWidget 中，加入我不需要再添加一个
/// Widget 透明度变化的动画那么我们就需要再实现一个 AnimationWidget。这样就不是很优雅。这时我们可以通过 AnimationBuildr 将
/// 渲染逻辑分离出去。
/// Flutter中正是通过这种方式封装了很多动画，
///如：FadeTransition、ScaleTransition、SizeTransition、FractionalTranslation等，很多时候都可以复用这些预置的过渡类。
class GrowTransition extends StatelessWidget {
  ///外部把需要渲染的 Widget 传递进来
  GrowTransition({this.widget, this.animation});
  final Widget widget;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          /// 将 widget 具体的渲染过程给构造出来
          return new Container(
            height: animation.value,
            width: animation.value,
            color: Colors.blue,
            child: child,
          );
        },

        /// 将 widget 绑定到视图里
        child: widget,
      ),
    );
  }
}

/// 通过 AnimatedWidget 可以简化 Anmation 的 addListener 与 setState 步骤，
/// 并把 widget 从动画中分离出来。
class _AnimationTestRouteState extends State<AnimationTestRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedImage(animation: animation);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return new Center(
      child: Container(
        width: animation.value,
        height: animation.value,
        color: Colors.blue,
      ),
    );
  }
}
