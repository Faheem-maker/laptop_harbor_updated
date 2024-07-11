import 'package:laptop_harbor/models/category.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';

class Product extends PersistentShoppingCartItem {
  int id;
  String name;
  String image;
  int price;
  int ratings;
  Category category;
  int productQuantity = 0;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.ratings,
    required this.category,
    this.productQuantity = 0
  }) : super(productId: id.toString(), productName: name, unitPrice: price.toDouble(), quantity: productQuantity);
}