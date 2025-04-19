import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/monitoring.dart';
import 'package:flutter_application_1/ttspage.dart';
import 'package:http/http.dart' as http;

class Smarthome extends StatefulWidget {
  const Smarthome({super.key});

  @override
  State<Smarthome> createState() => _SmarthomeState();
}

class _SmarthomeState extends State<Smarthome> {
  List<dynamic> pins = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  void signout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  final String esp32Ip = 'http://192.168.139.54:8080/hi';
  Future<void> control(int pinnum) async {
    if (pins[pinnum] == false) {
      pins[pinnum] = true;
    } else {
      pins[pinnum] = false;
    }
    print('$pinnum ${pins[pinnum]}');
    try {
      // Send a GET request with a "message" parameter
      final response =
          await http.get(Uri.parse('$esp32Ip?message=$pinnum+${pins[pinnum]}'));
      print('$pinnum ${pins[pinnum]}');
      print(response.body);
      if (response.statusCode == 200) {
        print('Received response: ${response.body}');
      } else {
        print('Failed to send message');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Smart Home"),
        backgroundColor: Colors.grey[400],
        foregroundColor: Colors.black,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[400],
        child: Column(
          children: [
            DrawerHeader(child: Icon(Icons.wifi)),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text("HOME"),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepage())),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(Icons.front_hand),
                title: Text("GESTURE"),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TtsPage())),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(Icons.monitor),
                title: Text("MONITORING"),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Monitoring())),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(Icons.smart_button),
                title: Text("CONTROLLER"),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Controller())),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text("SMART HOME"),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Smarthome())),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("LOG-OUT"),
                  onTap: () => signout()),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () => control(1),
                    child: Container(
                        child: Text("PIN 1 ON"),
                        height: 150,
                        width: 150,
                        alignment: (Alignment.center),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)))),
                GestureDetector(
                  onTap: () => control(1),
                  child: Container(
                      child: Text(
                        "PIN 1 OFF",
                        style: TextStyle(color: Colors.black54),
                      ),
                      height: 150,
                      width: 150,
                      alignment: (Alignment.center),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => control(2),
                  child: Container(
                      child: Text(
                        "PIN 2 ON",
                        style: TextStyle(color: Colors.black54),
                      ),
                      height: 150,
                      width: 150,
                      alignment: (Alignment.center),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10))),
                ),
                GestureDetector(
                  onTap: () => control(2),
                  child: Container(
                      child: Text(
                        "PIN 2 OFF",
                        style: TextStyle(color: Colors.black54),
                      ),
                      height: 150,
                      width: 150,
                      alignment: (Alignment.center),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => control(3),
                  child: Container(
                      child: Text(
                        "PIN 3 ON",
                        style: TextStyle(color: Colors.black54),
                      ),
                      height: 150,
                      width: 150,
                      alignment: (Alignment.center),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10))),
                ),
                GestureDetector(
                  onTap: () => control(3),
                  child: Container(
                      child: Text(
                        "PIN 3 OFF",
                        style: TextStyle(color: Colors.black54),
                      ),
                      height: 150,
                      width: 150,
                      alignment: (Alignment.center),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => control(4),
                  child: Container(
                      child: Text(
                        "PIN 4 ON",
                        style: TextStyle(color: Colors.black54),
                      ),
                      height: 150,
                      width: 150,
                      alignment: (Alignment.center),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10))),
                ),
                GestureDetector(
                  onTap: () => control(4),
                  child: Container(
                      child: Text(
                        "PIN 4 OFF",
                        style: TextStyle(color: Colors.black54),
                      ),
                      height: 150,
                      width: 150,
                      alignment: (Alignment.center),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
