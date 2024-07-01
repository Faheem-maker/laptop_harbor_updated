import 'package:flutter/material.dart';
import 'package:laptop_harbor/layouts/layout.dart';
import 'package:laptop_harbor/screens/dashboard.dart';
import 'package:laptop_harbor/screens/home.dart';
import 'package:laptop_harbor/screens/login.dart';
import 'package:laptop_harbor/screens/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:laptop_harbor/screens/splash.dart';
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
    return MaterialApp(
      home: DashboardLayout(DashboardScreen()),
      routes: <String, WidgetBuilder> {
        '/home': (builder) => HomeScreen(),
        '/register': (builder) => RegisterScreen(),
        '/login': (builder) => LoginScreen(),
        '/dashboard': (builder) => DashboardLayout(DashboardScreen()),
      },
    );
  }
}
