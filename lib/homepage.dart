import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Service/fire_store.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {  
  final FlutterTts _flutterTts = FlutterTts();
  final TextEditingController _textEditingController = TextEditingController(); 
  final FirestoreService firestore = FirestoreService();
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
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: const Icon(Icons.add),
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
