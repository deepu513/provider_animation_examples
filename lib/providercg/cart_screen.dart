import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerexample/providercg/models/Cart.dart';


class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[Expanded(child: CardItemList())],
        ),
      ),
    );
  }
}

class CardItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartItems = Provider.of<Cart>(context).selectedItems;
    return ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              title: Text(cartItems[index].name),
            ));
  }
}
