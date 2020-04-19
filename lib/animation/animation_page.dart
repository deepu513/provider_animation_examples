import 'dart:math';

import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        child: Stack(
          children: <Widget>[
            new Page(),
            new GuillotineMenu(),
          ],
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(top: 90.0),
      color: Color(0xff222222),
    );
  }
}

class GuillotineMenu extends StatefulWidget  {

  @override
  _GuillotineMenuState createState() => new _GuillotineMenuState();
}
enum _GuillotineAnimationStatus { closed, open, animating }

class _GuillotineMenuState extends State<GuillotineMenu> with SingleTickerProviderStateMixin {

  AnimationController animationControllerMenu;
  Animation<double> animationMenu;
  Animation<double> animationTitleFadeInOut;

  double rotationAngle = 0.0;

  _GuillotineAnimationStatus menuAnimationStatus = _GuillotineAnimationStatus.closed;

  _handleMenuOpenClose(){
    if (menuAnimationStatus == _GuillotineAnimationStatus.closed){
      animationControllerMenu.forward().orCancel;
    } else if (menuAnimationStatus == _GuillotineAnimationStatus.open) {
      animationControllerMenu.reverse().orCancel;
    }
  }

  @override
  void initState(){
    super.initState();

    ///
    /// Initialization of the animation controller
    ///
    animationControllerMenu = new AnimationController(
        duration: const Duration(milliseconds: 1000),
        vsync: this
    )..addListener((){
      setState((){});
    })..addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        ///
        /// When the animation is at the end, the menu is open
        ///
        menuAnimationStatus = _GuillotineAnimationStatus.open;
      } else if (status == AnimationStatus.dismissed) {
        ///
        /// When the animation is at the beginning, the menu is closed
        ///
        menuAnimationStatus = _GuillotineAnimationStatus.closed;
      } else {
        ///
        /// Otherwise the animation is running
        ///
        menuAnimationStatus = _GuillotineAnimationStatus.animating;
      }
    });

    ///
    /// Initialization of the menu appearance animation
    ///
    animationMenu = new Tween(
        begin: -pi/2.0,
        end: 0.0
    ).animate(new CurvedAnimation(
      parent: animationControllerMenu,
      curve: Curves.bounceOut,
      reverseCurve: Curves.bounceIn,
    ));

    animationTitleFadeInOut = new Tween(
        begin: 1.0,
        end: 0.0
    ).animate(new CurvedAnimation(
      parent: animationControllerMenu,
      curve: new Interval(
        0.0,
        0.5,
        curve: Curves.ease,
      ),
    ));

  }

  @override
  void dispose(){
    animationControllerMenu.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    double angle = animationMenu.value;

    return new Transform.rotate(
      angle: angle,
      origin: new Offset(24.0, 56.0),
      alignment: Alignment.topLeft,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: screenWidth,
          height: screenHeight,
          color: Color(0xFF333333),
          child: new Stack(
            children: <Widget>[
              _buildMenuTitle(screenWidth),
              _buildMenuIcon(),
              _buildMenuContent(),
            ],
          ),
        ),
      ),
    );
  }

  ///
  /// Menu Title
  ///
  Widget _buildMenuTitle([double screenWidth]){
    return new Positioned(
      top: 32.0,
      left: 40.0,
      width: screenWidth,
      height: 24.0,
      child: new Transform.rotate(
          alignment: Alignment.topLeft,
          origin: Offset.zero,
          angle: pi / 2.0,
          child: new Center(
            child: new Container(
              width: double.infinity,
              height: double.infinity,
              child: new Opacity(
                opacity: animationTitleFadeInOut.value,
                child: new Text('ACTIVITY',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    )),
              ),
            ),
          )),
    );
  }

  ///
  /// Menu Icon
  ///
  Widget _buildMenuIcon(){
    return new Positioned(
      top: 32.0,
      left: 4.0,
      child: new IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: _handleMenuOpenClose,
      ),
    );
  }

  ///
  /// Menu content
  ///
  Widget _buildMenuContent(){
    final List<Map> _menus = <Map>[
      {
        "icon": Icons.person,
        "title": "profile",
        "color": Colors.white,
      },
      {
        "icon": Icons.view_agenda,
        "title": "feed",
        "color": Colors.white,
      },
      {
        "icon": Icons.swap_calls,
        "title": "activity",
        "color": Colors.cyan,
      },
      {
        "icon": Icons.settings,
        "title": "settings",
        "color": Colors.white,
      },
    ];

    return new Padding(
      padding: const EdgeInsets.only(left: 64.0, top: 96.0),
      child: new Container(
        width: double.infinity,
        height: double.infinity,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _menus.map((menuItem) {
            return new ListTile(
              leading: new Icon(
                menuItem["icon"],
                color: menuItem["color"],
              ),
              title: new Text(
                menuItem["title"],
                style: new TextStyle(
                    color: menuItem["color"],
                    fontSize: 24.0),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
