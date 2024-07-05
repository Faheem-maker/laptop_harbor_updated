import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laptop_harbor/Screens/Product/product.dart';
import 'package:laptop_harbor/layouts/layout.dart';
import 'package:laptop_harbor/screens/all_products.dart';
import 'package:laptop_harbor/screens/dashboard.dart';
import 'package:laptop_harbor/screens/home.dart';
import 'package:laptop_harbor/screens/login.dart';
import 'package:laptop_harbor/screens/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
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
        home: RegisterScreen(),
        routes: <String, WidgetBuilder> {
          '/home': (builder) => HomeScreen(),
          '/register': (builder) => RegisterScreen(),
          '/login': (builder) => LoginScreen(),
          '/dashboard': (builder) => DashboardLayout(DashboardScreen()),
          '/product': (builder) => DashboardLayout(ProductScreen()),
          '/products': (builder) => DashboardLayout(AllProductsScreen()),
        },
      ),
    );
  }
}
