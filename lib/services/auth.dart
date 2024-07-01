import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  User? user;

  static AuthService? _instance;

  static AuthService instance() {
    _instance ??= AuthService();

    return _instance!;
  }

  AuthService() {
    FirebaseAuth.instance.authStateChanges()
      .listen((User? user) {
        this.user = user;
      });
  }

  bool isLoggedIn() {
    return this.user != null;
  }

  Future<User?> register(String username, String email, String password) async {
    var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

    return result.user;
  }

  Future<User?> login(String email, String password) async {
    var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

    return result.user;
  }
}