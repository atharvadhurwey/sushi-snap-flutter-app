import 'package:flutter/material.dart';
import 'package:sushi_snap/models/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    // Nigiri Sushi
    Food(
      name: "Nigiri Sushi",
      price: "21.00",
      imagePath: "lib/images/nigiri_sushi.png",
      rating: "4.5",
    ),

    // Sashimi
    Food(
      name: "Uramaki",
      price: "23.00",
      imagePath: "lib/images/uramaki.png",
      rating: "4.9",
    ),
  ];

  // customer cart
  final List<Food> _cart = [];

  // get methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food foodItem) {
    _cart.remove(foodItem);
    notifyListeners();
  }
}
