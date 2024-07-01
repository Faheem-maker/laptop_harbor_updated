import 'package:flutter/material.dart';
import 'package:laptop_harbor/layouts/layout.dart';
import 'package:laptop_harbor/screens/dashboard.dart';
import 'package:laptop_harbor/screens/register.dart';
import 'package:laptop_harbor/services/auth.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var emailInput = TextEditingController();
    var passwordInput = TextEditingController();

    final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

    return MaterialApp(
      home: ScaffoldMessenger(
        key: scaffoldKey,
        child: Scaffold(
          body: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                      "https://th.bing.com/th/id/R.f89348ee957a96de25bd1f630567986f?rik=T4hGm3BLZKf8VA&pid=ImgRaw&r=0",
                      height: 100,
                      width: 200),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Text("Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.7,
                        child: TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                          controller: emailInput,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.7,
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.key),
                            labelText: "Password",
                            border: OutlineInputBorder(),
                          ),
                          controller: passwordInput,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                          height: 50.0,
                          width: 200.0,
                          child: ElevatedButton(
                            onPressed: () async {
                              var user = await AuthService.instance().login(emailInput.value.text, passwordInput.value.text);
        
                              if (user == null) {
                                scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text("Invalid username/password, please try again")));
                              }
                              else {
                                if (context.mounted) {
                                  scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text("Logged in Successfully")));
                                  Navigator.push(context, 
                                  MaterialPageRoute(builder: (context) => DashboardLayout(DashboardScreen()), maintainState: true));
                                }
                              }
                            },
                            child: Text("Login"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellowAccent),
                          ))
                    ],
                  ),
                  ElevatedButton(onPressed: () => {
                    Navigator.of(context).pushNamed('/register'),
                  }, child: Text("Register Instead"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
