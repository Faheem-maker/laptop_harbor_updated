import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laptop_harbor/screens/home.dart';
import 'package:laptop_harbor/screens/login.dart';
import 'package:laptop_harbor/screens/register.dart';
import 'package:laptop_harbor/services/auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = null;

  @override
  void initState() {
    user = AuthService.instance().user;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return LoginScreen();
    }

    return new Text("You are logged in");
  }
}