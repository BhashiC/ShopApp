import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantitiy;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantitiy,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    int count = 0;
    _items.forEach((key, value) {
      count += value.quantitiy;
    });
    return count;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (value) => CartItem(
          id: value.id,
          title: value.title,
          quantitiy: value.quantitiy + 1,
          price: value.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          quantitiy: 1,
          price: price,
        ),
      );
    }
    notifyListeners();
  }
}
