import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth_page.dart';
import 'package:flutter_application_1/controller.dart';
// import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/monitoring.dart';
import 'package:flutter_application_1/smarthome.dart';
import 'package:flutter_application_1/ttspage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void signout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => AuthPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Icon(Icons.wifi),
        centerTitle: true,
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
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TtsPage())),
                    child: Container(
                        child: Text(
                          "Gesture Monitoring",
                          style: TextStyle(color: Colors.white),
                        ),
                        height: 150,
                        width: 150,
                        alignment: (Alignment.center),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(10)))),
                GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Monitoring())),
                    child: Container(
                        child: Text(
                          "Monitoring",
                          style: TextStyle(color: Colors.white),
                        ),
                        height: 150,
                        width: 150,
                        alignment: (Alignment.center),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(10)))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Controller())),
                    child: Container(
                        child: Text(
                          "Controller",
                          style: TextStyle(color: Colors.white),
                        ),
                        height: 150,
                        width: 150,
                        alignment: (Alignment.center),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(10)))),
                GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Smarthome())),
                    child: Container(
                        child: Text(
                          "Smart Home",
                          style: TextStyle(color: Colors.white),
                        ),
                        height: 150,
                        width: 150,
                        alignment: (Alignment.center),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(10))))
              ],
            )
          ],
        ),
      ),
    );
  }
}
