import 'package:flutter/material.dart';
import 'package:laptop_harbor/screens/login.dart';
import 'package:laptop_harbor/services/auth.dart';

class RegisterScreen extends StatelessWidget {
  var usernameInput = TextEditingController();
  var emailInput = TextEditingController();
  var passwordInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

    return ScaffoldMessenger(
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
                      Text("Signup",
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
                          controller: usernameInput,
                          decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: "Username",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "This field is required";
                            }
      
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.7,
                        child: TextFormField(
                          controller: emailInput,
                          decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "This field is required";
                            }
                            
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.7,
                        child: TextFormField(
                          controller: passwordInput,
                          obscureText: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.key),
                            labelText: "Password",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "This field is required";
                            }
                            
                            return null;
                          },
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
                              var user = await AuthService.instance().register(usernameInput.value.text, emailInput.value.text, passwordInput.value.text);
      
                              if (user == null) {
                                scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text("Unable to register, unexpected error")));
                              }
                              else {
                                scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text("Successfully registered as ${user.email}")));
                                Navigator.pushNamed(context, "/dashboard");
                              }
                            },
                            child: Text("Register"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellowAccent),
                          ))
                    ],
                  ),
                  ElevatedButton(onPressed: () => {
                    Navigator.of(context).pushNamed('/login'),
                  }, child: Text("Login Instead"))
                ],
              ),
            ),
          ),
        ),
    );
  }
}
