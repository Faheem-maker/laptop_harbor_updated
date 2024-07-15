import 'package:laptop_harbor/models/product.dart';

class Cart {
  var products = <Product>[];
  var rating = 5;

  clear() {
    products.clear();
  }
}