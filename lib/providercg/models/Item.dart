import 'package:flutter/foundation.dart';

class Item {
  final String name;
  bool isAddedToCart;
  Item(this.name, {this.isAddedToCart = false});
}