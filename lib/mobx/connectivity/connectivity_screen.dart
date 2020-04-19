import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:providerexample/mobx/connectivity/connectivity_store.dart';

class ConnectivityScreen extends StatefulWidget {
  final ConnectivityStore store;

  const ConnectivityScreen(this.store, {Key key}) : super(key: key);

  @override
  _ConnectivityScreenState createState() => _ConnectivityScreenState();
}

class _ConnectivityScreenState extends State<ConnectivityScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();

    _disposer = reaction(
        (_) => widget.store.connectivityStream.value,
        (result) => _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text(result == ConnectivityResult.none
                  ? "You are offline"
                  : "You are online"),
            )),
        delay: 2000);
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
            'Turn your connection on/off for approximately 4 seconds to see the app respond to changes in your connection status.'),
      ),
    );
  }
}
