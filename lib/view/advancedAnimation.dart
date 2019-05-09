import 'package:flutter/material.dart';

class StaggerView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StaggerViewState();
}

class _StaggerViewState extends State<StaggerView>
    with TickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

  Future<Null> _playAnimation() async {
    try {
      //先正向执行动画
      await _controller.forward().orCancel;
      //再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _playAnimation();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("advancedAnim"),
        ),
        body: Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(color: Colors.black.withOpacity(0.5))),
          child: AdvancedAnimation(
            controller: _controller,
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/// 动画同时进行颜色边距和大小的变换
class AdvancedAnimation extends StatefulWidget {
  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  AdvancedAnimation({Key key, this.controller}) : super(key: key) {
    height = Tween<double>(begin: 0, end: 300.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease)));
    color = ColorTween(begin: Colors.green, end: Colors.red).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease)));
    padding = Tween<EdgeInsets>(
            begin: EdgeInsets.only(left: 0), end: EdgeInsets.only(left: 100.0))
        .animate(CurvedAnimation(
            parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease)));
  }

  @override
  _AdvancedAnimationState createState() => _AdvancedAnimationState();
}

class _AdvancedAnimationState extends State<AdvancedAnimation> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimationWidget,
      animation: widget.controller,
    );
  }

  Widget _buildAnimationWidget(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: widget.padding.value,
      child: Container(
        color: widget.color.value,
        width: 50.0,
        height: widget.height.value,
      ),
    );
  }
}
