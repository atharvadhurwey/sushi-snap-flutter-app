class Food {
  String name;
  String price;
  String imagePath;
  String rating;
  String category;

  Food({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.category,
  });

  String get getName => name;
  String get getPrice => price;
  String get getImagePath => imagePath;
  String get getRating => rating;
  String get getCategory => category;
}

class Category {
  String name;
  String value;
  String imagePath;

  Category({
    required this.name,
    required this.value,
    required this.imagePath, 
  });

  String get getName => name;
  String get getValue => value;
  String get getImagePath => imagePath;
}
