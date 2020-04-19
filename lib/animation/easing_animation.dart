import 'package:flutter/material.dart';

class EasingAnimation extends StatefulWidget {
  @override
  _EasingAnimationState createState() => _EasingAnimationState();
}

class _EasingAnimationState extends State<EasingAnimation> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _offsetAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: const Offset(1.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.slowMiddle,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return SlideTransition(
      position: _offsetAnimation,
      child: const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: FlutterLogo(size: 150.0),
        ),
      ),
    );
  }
}

// Example With Transform.translate

//class _EasingAnimationState extends State<EasingAnimation> with SingleTickerProviderStateMixin {
//  AnimationController _controller;
//  Animation<double> _offsetAnimation;
//
//  @override
//  void initState() {
//    super.initState();
//    _controller = AnimationController(
//      duration: const Duration(seconds: 2),
//      vsync: this,
//    )..repeat(reverse: true)..addListener((){
//      setState((){});
//    });
//    _offsetAnimation = Tween<double>(
//      begin: -1.0,
//      end: 1.0,
//    ).animate(CurvedAnimation(
//      parent: _controller,
//      curve: Curves.fastOutSlowIn,
//    ));
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    _controller.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    final double width = MediaQuery.of(context).size.width;
//    return Transform.translate(
//      offset: Offset(_offsetAnimation.value * width, 0.0),
//      child: const Padding(
//        padding: EdgeInsets.all(8.0),
//        child: FlutterLogo(size: 150.0),
//      ),
//    );
//  }
//}
