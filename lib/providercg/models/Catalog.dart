import 'package:flutter/foundation.dart';
import 'package:providerexample/providercg/models/Item.dart';

class Catalog extends ChangeNotifier {
  final List<Item> items = [
    Item("Tomatoes"),
    Item("Potatoes"),
    Item("Apples"),
    Item("Carrots"),
    Item("Bananas"),
    Item("Lemon"),
    Item("Water melon"),
    Item("Musk melon"),
    Item("Custard apple"),
    Item("Grapes"),
    Item("Papaya"),
    Item("Kiwi"),
    Item("Jack fruit"),
    Item("Strawberry"),
    Item("Pineapple"),
    Item("Orange"),
    Item("Sweet lime"),
    Item("Chickoo"),
    Item("Onions"),
    Item("Flour"),
    Item("Ketchup"),
    Item("Tamarind")];

  addItemToCart(int index) {
    items[index].isAddedToCart = true;
    notifyListeners();
  }

  removeItemFromCart(int index) {
    items[index].isAddedToCart = false;
    notifyListeners();
  }
}
