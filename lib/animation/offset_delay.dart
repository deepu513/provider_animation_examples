import 'package:flutter/material.dart';

class OffsetDelayAnimation extends StatefulWidget {
  @override
  _OffsetDelayAnimationState createState() => _OffsetDelayAnimationState();
}

class _OffsetDelayAnimationState extends State<OffsetDelayAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  Animation<Offset> _lateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: const Offset(1.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.slowMiddle,
    ));

    _lateAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: const Offset(1.0, 0.0),
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.3,
          1.0,
          curve: Curves.slowMiddle,
        )));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              SlideTransition(
                position: _offsetAnimation,
                child: FlutterLogo(size: 150.0),
              ),
              SlideTransition(
                position: _lateAnimation,
                child: FlutterLogo(size: 120.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
