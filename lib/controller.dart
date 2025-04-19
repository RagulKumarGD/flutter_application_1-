import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/monitoring.dart';
import 'package:flutter_application_1/smarthome.dart';
import 'package:flutter_application_1/ttspage.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

class Controller extends StatefulWidget {
  const Controller({super.key});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  void signout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  final String esp32Ip = 'http://192.168.139.54:8080/hi';
  Future<void> send(String data) async {
    try {
      // Send a GET request with a "message" parameter
      final response = await http.get(Uri.parse('$esp32Ip?message=$data'));
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
        title: const Text("Controlling"),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => send("North"),
                  child: Container(
                    child: Icon(Icons.north),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => send("West"),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: Container(
                      child: Icon(Icons.west),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => send("Stop"),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0, bottom: 50),
                    child: Container(
                      child: Icon(Icons.stop),
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => send("East"),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Container(
                      child: Icon(Icons.east),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => send("South"),
                  child: Container(
                    child: Icon(Icons.south),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
