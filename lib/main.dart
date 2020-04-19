import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerexample/animation/animation_page.dart';
import 'package:providerexample/animation/easing_animation.dart';
import 'package:providerexample/animation/many_animations.dart';
import 'package:providerexample/mobx/connectivity/connectivity_screen.dart';
import 'package:providerexample/mobx/connectivity/connectivity_store.dart';
import 'package:providerexample/mobx/counter/counter_screen.dart';
import 'package:providerexample/mobx/dice/dice_screen.dart';
import 'package:providerexample/mobx/form/form_screen.dart';
import 'package:providerexample/mobx/streams/stream_screen.dart';
import 'package:providerexample/providercg/cart_screen.dart';
import 'package:providerexample/providercg/models/Cart.dart';
import 'package:providerexample/providercg/models/Catalog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Cart>(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider<Catalog>(
          create: (context) => Catalog(),
        ),
        Provider<ConnectivityStore>(
          create: (_) => ConnectivityStore(),
        )
      ],
      child: AnimationApp(),
    );
  }
}

class AnimationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ManyAnimations(),
    );
  }

}

class RandomNumberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Counter Demo',
        home: SafeArea(
          child: RandomNumberScreen(),
        )
    );
  }
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter Demo',
      home: SafeArea(
        child: CounterScreen(),
      )
    );
  }
}

class FormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice App',
      home: SafeArea(
        child: FormScreen(),
      ),
    );
  }

}

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice App',
      home: SafeArea(
        child: DiceScreen(),
      ),
    );
  }
}


class ConnectivityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<ConnectivityStore>(context, listen: false);
    return MaterialApp(
      title: 'Connectivity demo',
      home: SafeArea(
        child: ConnectivityScreen(store),
      ),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Catalog"),
              actions: <Widget>[MyAction()],
            ),
            body: CatalogList()),
      ),
      routes: {
        '/cart': (context) => CartScreen(),
      },
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var catalog = Provider.of<Catalog>(context);
    var cart = Provider.of<Cart>(context);
    return Container(
      child: ListView.builder(
          itemCount: catalog.items.length,
          itemBuilder: (context, index) => ListTile(
                title: Text(catalog.items[index].name),
                trailing: FlatButton(
                  child: catalog.items[index].isAddedToCart
                      ? Text("Remove")
                      : Text("Add"),
                  onPressed: () {
                    if (catalog.items[index].isAddedToCart) {
                      catalog.removeItemFromCart(index);
                    } else {
                      catalog.addItemToCart(index);
                      cart.add(catalog.items[index]);
                    }
                  },
                ),
              )),
    );
  }
}

class MyAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.shopping_cart),
      onPressed: () => Navigator.pushNamed(context, '/cart'),
    );
  }
}
