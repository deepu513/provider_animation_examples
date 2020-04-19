import 'package:flutter/foundation.dart';
import 'package:providerexample/providercg/models/Item.dart';

class Cart extends ChangeNotifier {

  List<Item> selectedItems;

  Cart() {
    selectedItems = List();
  }
  
  void add(Item item) {
    selectedItems.add(item);
    notifyListeners();
  }
}