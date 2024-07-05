import 'package:laptop_harbor/models/category.dart';

class Product {
  int id;
  String name;
  String image;
  int price;
  int ratings;
  Category category;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.ratings,
    required this.category,
  });
}