import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:providerexample/mobx/streams/random_store.dart';

class RandomNumberScreen extends StatefulWidget {
  @override
  _RandomNumberScreenState createState() => _RandomNumberScreenState();
}

class _RandomNumberScreenState extends State<RandomNumberScreen> {
  final RandomStore store = RandomStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Random Number Generator'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Random number',
                style: TextStyle(color: Colors.grey),
              ),
              Observer(
                builder: (_) {
                  final value = store.randomStream.value;

                  return Text(
                    '${value == null ? '---' : value}',
                    style: TextStyle(fontSize: 96),
                  );
                },
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }
}
