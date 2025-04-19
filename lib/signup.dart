import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailEditcontroller = TextEditingController();
  TextEditingController PasswordEditcontroller = TextEditingController();
  TextEditingController confirmPasswordEditcontroller = TextEditingController();
  signup() async {
    if (PasswordEditcontroller.text == confirmPasswordEditcontroller.text) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailEditcontroller.text,
          password: PasswordEditcontroller.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    }
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
                "Good to see u!",
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
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                    controller: confirmPasswordEditcontroller,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Confirm Password")),
              ),
              SizedBox(
                height: 35,
              ),
              GestureDetector(
                onTap: () => signup(),
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
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text("or continue with"),
              //     SizedBox(
              //       height: 50,
              //     ),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Container(
              //           height: 75,
              //           width: 75,
              //           child: Image.asset("lib/images/google.png"),
              //           decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(20)),
              //         ),
              //         SizedBox(
              //           width: 10,
              //         ),
              //         Container(
              //           height: 75,
              //           width: 75,
              //           child: Image.asset("lib/images/apple.png"),
              //           decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(20)),
              //         )
              //       ],
              //     )
              //   ],
              // ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already a member ?"),
                  SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login())),
                      child: Text(
                        "Login now",
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
