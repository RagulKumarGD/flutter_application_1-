import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/auth_service.dart'; 
import 'package:flutter_application_1/signup.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController emailEditcontroller = TextEditingController();

  TextEditingController PasswordEditcontroller = TextEditingController();

  void signuserin() async {
    print(emailEditcontroller.text);
    print(PasswordEditcontroller.text);
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailEditcontroller.text, password: PasswordEditcontroller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Colors.grey[200]),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock,
                size: 50,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Welcome Back !",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                    controller: emailEditcontroller,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Email",
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                    controller: PasswordEditcontroller,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Password")),
              ),
              SizedBox(
                height: 35,
              ),
              GestureDetector(
                onTap: () => signuserin(),
                child: Container(
                  padding: EdgeInsets.all(15),
                  margin: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Icon(Icons.login),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member ?"),
                  SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signup())),
                      child: Text(
                        "Register now",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}