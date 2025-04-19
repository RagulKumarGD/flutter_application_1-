import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Temprature.dart';
import 'package:flutter_application_1/controller.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/humidity.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/smarthome.dart';
import 'package:flutter_application_1/ttspage.dart';

class Monitoring extends StatefulWidget {
  const Monitoring({super.key});

  @override
  State<Monitoring> createState() => _MonitoringState();
}

class _MonitoringState extends State<Monitoring> {
  void signout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Monitoring"),
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
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Humidity())),
                  child: Container(
                      child: Text(
                        "HUMIDITY",
                        style: TextStyle(color: Colors.white),
                      ),
                      height: 150,
                      width: 150,
                      alignment: (Alignment.center),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(10))),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Temprature())),
                  child: Container(
                      child: Text(
                        "TEMPRATURE",
                        style: TextStyle(color: Colors.white),
                      ),
                      height: 150,
                      width: 150,
                      alignment: (Alignment.center),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(10))),
                ),
                
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
