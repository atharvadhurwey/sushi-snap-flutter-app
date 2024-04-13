import 'package:flutter/material.dart';
import 'package:sushi_snap/models/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    // Salmon Sushi
    Food(
      name: "Salmon Sushi",
      price: "21.00",
      imagePath: "lib/images/food/salmon/salmonSushi.png",
      rating: "4.5",
      category: "Sushi+Salmon",
    ),

    // Sushi
    Food(
      name: "Original Sushi",
      price: "23.00",
      imagePath: "lib/images/food/sushi/sushi.png",
      rating: "4.9",
      category: "Sushi+Rice",
    ),

    // Green Tea
    Food(
      name: "Green Tea",
      price: "23.00",
      imagePath: "lib/images/food/drinks/greenTea.png",
      rating: "4.9",
      category: "Drinks",
    ),
  ];

  final List<Category> _categoryList = [
    // Ramen
    Category(
      name: "Ramen",
      value: "ramen",
      imagePath: "lib/images/category/ramen.png",
    ),

    // salmon
    Category(
      name: "Salmon",
      value: "salmon",
      imagePath: "lib/images/category/salmon.png",
    ),

    // Rice
    Category(
      name: "Rice",
      value: "rice",
      imagePath: "lib/images/category/rice.png",
    ),

    // Shrimp
    Category(
      name: "Shrimp",
      value: "shrimp",
      imagePath: "lib/images/category/shrimp.png",
    ),

    // Sushi
    Category(
      name: "Sushi",
      value: "sushi",
      imagePath: "lib/images/category/sushi.png",
    ),

    // Drinks
    Category(
      name: "Drinks",
      value: "drinks",
      imagePath: "lib/images/category/drinks.png",
    ),
  ];

  // customer cart
  final List<Food> _cart = [];

  // get methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;
  List<Category> get categoryList => _categoryList;

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
