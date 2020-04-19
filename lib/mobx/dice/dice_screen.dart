import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'dice_counter.dart';

class DiceScreen extends StatelessWidget {
  final diceCounter = DiceCounter();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Observer(
                  builder: (_) => Expanded(
                    child: Center(
                      child: Text(
                        "${diceCounter.left}"
                      ),
                    ),
                  ),
                ),
                Observer(
                  builder: (_) => Expanded(
                    child: Center(
                      child: Text(
                        "${diceCounter.right}"
                      ),
                    ),
                  ),
                )
              ],
            ),
            FlatButton(
              onPressed: diceCounter.roll,
              child: Text("Roll the dice"),
            ),
            Observer(
              builder: (_) => Text("Dice total is ${diceCounter.total}"),
            )
          ],
        ),
      ),
    );
  }
}
