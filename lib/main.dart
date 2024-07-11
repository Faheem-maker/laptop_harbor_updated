import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laptop_harbor/Screens/Product/product.dart';
import 'package:laptop_harbor/layouts/layout.dart';
import 'package:laptop_harbor/screens/Cart/cart.dart';
import 'package:laptop_harbor/screens/all_products.dart';
import 'package:laptop_harbor/screens/dashboard.dart';
import 'package:laptop_harbor/screens/home.dart';
import 'package:laptop_harbor/screens/login.dart';
import 'package:laptop_harbor/screens/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:laptop_harbor/stores/store.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'firebase_options.dart';

void main() async {
  await PersistentShoppingCart().init().catchError((err) => print("ShoppingCart: ${err}"));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DashboardLayout(DashboardScreen()),
        routes: <String, WidgetBuilder> {
          '/home': (builder) => HomeScreen(),
          '/register': (builder) => RegisterScreen(),
          '/login': (builder) => LoginScreen(),
          '/dashboard': (builder) => DashboardLayout(DashboardScreen()),
          '/product': (builder) => DashboardLayout(ProductScreen()),
          '/products': (builder) => DashboardLayout(AllProductsScreen()),
          '/cart': (builder) => DashboardLayout(CartScreen()),
        },
      ),
    );
  }
}
