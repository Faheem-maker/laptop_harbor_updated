import 'package:laptop_harbor/models/category.dart';
import 'package:laptop_harbor/models/product.dart';

class DummyData {

  static final List<Category> categories = [
    new Category(id: 1, title: "New Laptops", url: "https://cdn.pixabay.com/photo/2020/10/21/18/07/laptop-5673901_1280.jpg"),
    new Category(id: 2, title: "Used Laptops", url: "https://cdn.pixabay.com/photo/2016/03/27/07/12/apple-1282241_1280.jpg"),
    new Category(id: 3, title: "Accessories", url: "https://cdn.pixabay.com/photo/2016/11/19/16/01/audio-1840073_1280.jpg"),
  ];

  static final List<Product> products = [
    new Product(id: 1, name: "SAMSUNG 14\" Galaxy Book4 Pro Laptop", image: "https://images.unsplash.com/photo-1593642533144-3d62aa4783ec?q=80&w=1469&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: 1149, ratings: 4, category: categories[0]),
    new Product(id: 2, name: "Dell 11\" Dell Laptop", image: "https://m.media-amazon.com/images/I/71y14pRuGJL._AC_SX569_.jpg", price: 2222, ratings: 3, category: categories[0]),
    new Product(id: 3, name: "Dell 10\"  Dell Laptop", image: "https://m.media-amazon.com/images/I/61GqSlHr41L.__AC_SX300_SY300_QL70_FMwebp_.jpg", price: 2155, ratings: 5, category: categories[0]),
    new Product(id: 4, name: "HP 12\" HP Pro Laptop", image: "https://images.unsplash.com/photo-1593642533144-3d62aa4783ec?q=80&w=1469&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: 1559, ratings: 6, category: categories[0]),
    new Product(id: 5, name: "Dell 9\" Dell Laptop", image: "https://m.media-amazon.com/images/I/71SZpMT7k3L._AC_SX569_.jpg", price: 1099, ratings: 2, category: categories[0]),
    new Product(id: 6, name: "HP 11\" HP Laptop", image: "https://plus.unsplash.com/premium_photo-1681319553238-9860299dfb0f?q=80&w=1331&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: 1299, ratings: 7, category: categories[0]),
    new Product(id: 7, name: "HP 14\" HP Laptop", image: "https://plus.unsplash.com/premium_photo-1681702178555-ab53d9f8d912?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: 1779, ratings: 4, category: categories[0]),
    new Product(id: 8, name: "Dell 10\" Dell Laptop", image: "https://images.unsplash.com/photo-1499673610122-01c7122c5dcb?q=80&w=1327&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: 2059, ratings: 3, category: categories[0]),
    new Product(id: 9, name: "HP 15\" HP Laptop", image: "https://images.unsplash.com/photo-1504707748692-419802cf939d?q=80&w=1447&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: 2149, ratings: 5, category: categories[0]),
    new Product(id: 10, name: "Dell 11\" Dell Laptop", image: "https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: 2009, ratings: 1, category: categories[0]),
    new Product(id: 11, name: "SAMSUNG 14\" Galaxy Book  Laptop", image: "https://images.unsplash.com/photo-1522199755839-a2bacb67c546?q=80&w=1472&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: 1599, ratings: 4, category: categories[0]),
  ];

  static final List<Product> featured = [
    products[0],
    products[1],
    products[2],
    products[3],
  ];
}