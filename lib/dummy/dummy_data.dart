import 'package:laptop_harbor/models/category.dart';
import 'package:laptop_harbor/models/product.dart';

class DummyData {

  static final List<Category> categories = [
    new Category(id: 1, title: "New Laptops", url: "https://cdn.pixabay.com/photo/2020/10/21/18/07/laptop-5673901_1280.jpg"),
    new Category(id: 1, title: "Used Laptops", url: "https://cdn.pixabay.com/photo/2016/03/27/07/12/apple-1282241_1280.jpg"),
    new Category(id: 1, title: "Accessories", url: "https://cdn.pixabay.com/photo/2016/11/19/16/01/audio-1840073_1280.jpg"),
  ];

  static final List<Product> products = [
    new Product(id: 1, name: "SAMSUNG 14\" Galaxy Book4 Pro Laptop", image: "https://m.media-amazon.com/images/I/6131ZgIFn1L.__AC_SX300_SY300_QL70_FMwebp_.jpg", price: 1149, ratings: 4, category: categories[0]),
    new Product(id: 1, name: "SAMSUNG 14\" Galaxy Book4 Pro Laptop", image: "https://m.media-amazon.com/images/I/6131ZgIFn1L.__AC_SX300_SY300_QL70_FMwebp_.jpg", price: 1149, ratings: 4, category: categories[0]),
    new Product(id: 1, name: "SAMSUNG 14\" Galaxy Book4 Pro Laptop", image: "https://m.media-amazon.com/images/I/6131ZgIFn1L.__AC_SX300_SY300_QL70_FMwebp_.jpg", price: 1149, ratings: 4, category: categories[0]),
    new Product(id: 1, name: "SAMSUNG 14\" Galaxy Book4 Pro Laptop", image: "https://m.media-amazon.com/images/I/6131ZgIFn1L.__AC_SX300_SY300_QL70_FMwebp_.jpg", price: 1149, ratings: 4, category: categories[0]),
    new Product(id: 1, name: "SAMSUNG 14\" Galaxy Book4 Pro Laptop", image: "https://m.media-amazon.com/images/I/6131ZgIFn1L.__AC_SX300_SY300_QL70_FMwebp_.jpg", price: 1149, ratings: 4, category: categories[0]),
    new Product(id: 1, name: "SAMSUNG 14\" Galaxy Book4 Pro Laptop", image: "https://m.media-amazon.com/images/I/6131ZgIFn1L.__AC_SX300_SY300_QL70_FMwebp_.jpg", price: 1149, ratings: 4, category: categories[0]),
    new Product(id: 1, name: "SAMSUNG 14\" Galaxy Book4 Pro Laptop", image: "https://m.media-amazon.com/images/I/6131ZgIFn1L.__AC_SX300_SY300_QL70_FMwebp_.jpg", price: 1149, ratings: 4, category: categories[0]),
    new Product(id: 1, name: "SAMSUNG 14\" Galaxy Book4 Pro Laptop", image: "https://m.media-amazon.com/images/I/6131ZgIFn1L.__AC_SX300_SY300_QL70_FMwebp_.jpg", price: 1149, ratings: 4, category: categories[0]),
    new Product(id: 1, name: "SAMSUNG 14\" Galaxy Book4 Pro Laptop", image: "https://m.media-amazon.com/images/I/6131ZgIFn1L.__AC_SX300_SY300_QL70_FMwebp_.jpg", price: 1149, ratings: 4, category: categories[0]),
    new Product(id: 1, name: "SAMSUNG 14\" Galaxy Book4 Pro Laptop", image: "https://m.media-amazon.com/images/I/6131ZgIFn1L.__AC_SX300_SY300_QL70_FMwebp_.jpg", price: 1149, ratings: 4, category: categories[0]),
    new Product(id: 1, name: "SAMSUNG 14\" Galaxy Book4 Pro Laptop", image: "https://m.media-amazon.com/images/I/6131ZgIFn1L.__AC_SX300_SY300_QL70_FMwebp_.jpg", price: 1149, ratings: 4, category: categories[0]),
    new Product(id: 1, name: "SAMSUNG 14\" Galaxy Book4 Pro Laptop", image: "https://m.media-amazon.com/images/I/6131ZgIFn1L.__AC_SX300_SY300_QL70_FMwebp_.jpg", price: 1149, ratings: 4, category: categories[0]),
  ];

  static final List<Product> featured = [
    products[0],
    products[1],
    products[2],
    products[3],
  ];
}
