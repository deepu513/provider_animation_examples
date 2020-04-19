import 'package:flutter/material.dart';
import 'package:providerexample/animation/easing_animation.dart';
import 'package:providerexample/animation/offset_delay.dart';
import 'package:providerexample/animation/parenting.dart';
import 'package:providerexample/animation/spring_animation.dart';
import 'package:providerexample/animation/transforming.dart';
import 'package:providerexample/animation/value_change.dart';

import 'masking_animation.dart';

class ManyAnimations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text("Select animation"),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Easing animation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EasingAnimation()));
              },
            ),
            ListTile(
              title: Text("Offset & Delay animation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => new OffsetDelayAnimation()));
              },
            ),
            ListTile(
              title: Text("Parenting animation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => new ParentingAnimation()));
              },
            ),
            ListTile(
              title: Text("Transformation animation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => new TransformingAnimation()));
              },
            ),
            ListTile(
              title: Text("Value Change animation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => new ValueChangeAnimation()));
              },
            ),
            ListTile(
              title: Text("Masking animation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => new MaskingAnimationWidget()));
              },
            ),
            ListTile(
              title: Text("Physics animation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => new SpringFreeFallingAnimation()));
              },
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}