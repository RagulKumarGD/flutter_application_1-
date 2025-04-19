import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Service/fire_store.dart';
import 'package:flutter_application_1/controller.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/monitoring.dart';
import 'package:flutter_application_1/smarthome.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TtsPage extends StatefulWidget {
  const TtsPage({super.key});

  @override
  State<TtsPage> createState() => _TtsPageState();
}

class _TtsPageState extends State<TtsPage> {
  final FlutterTts _flutterTts = FlutterTts();
  final TextEditingController _textEditingController = TextEditingController();
  final FirestoreService firestore = FirestoreService();
  void signout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }
  add() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: _textEditingController,
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      firestore.addNotes(_textEditingController.text);
                      _textEditingController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text("ADD"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("GESTURE MONITORING"),
        backgroundColor: Colors.grey[400],
        foregroundColor: Colors.black,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: add,
      //   child: const Icon(Icons.add),
      // ),
      drawer: Drawer(
        backgroundColor: Colors.grey[400],
        child: Column(
          children: [
            DrawerHeader(child: Icon(Icons.wifi)),
             Padding(padding: EdgeInsets.only(left: 25),
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text("HOME"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage())),
            ),
            ),
            Padding(padding: EdgeInsets.only(left: 25),
            child: ListTile(
              leading: Icon(Icons.front_hand),
              title: Text("GESTURE"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>TtsPage())),
            ),
            ),
            Padding(padding: EdgeInsets.only(left: 25),
            child: ListTile(
              leading: Icon(Icons.monitor),
              title: Text("MONITORING"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Monitoring())),
            ),
            ),
            Padding(padding: EdgeInsets.only(left: 25),
            child: ListTile(
              leading: Icon(Icons.smart_button),
              title: Text("CONTROLLER"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Controller())),
            ),
            ),
            Padding(padding: EdgeInsets.only(left: 25),
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text("SMART HOME"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Smarthome())),
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
      body: StreamBuilder<QuerySnapshot>(
          stream: firestore.getnotesstream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List notesList = snapshot.data!.docs;

              return ListView.builder(
                  itemCount: notesList.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = notesList[index];
                    // String docId = Document.id;
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    String notetext = data['note'];
                    speek(notetext);

                    return (ListTile(
                      title: Text(notetext),
                    ));
                  });
            } else {
              return const Text("error");
            }
          }),
    );
  }

  speek(String notetext) async {
    await Future.delayed(const Duration(seconds: 0));
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.5);
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.speak(notetext);

    print(notetext);
  }
}
