import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Service/fire_store.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Temprature extends StatefulWidget {
  const Temprature({super.key});

  @override
  State<Temprature> createState() => _TempratureState();
}

class _TempratureState extends State<Temprature> {
  final UserService firestore = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("TEMPRATURE"),
        backgroundColor: Colors.grey[400],
        foregroundColor: Colors.black,
      ),
    
      body: StreamBuilder<QuerySnapshot>(
          stream: firestore.getnotesstream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // Handle error state
        if (snapshot.hasError) {
          return const Center(child: Text("Error loading data"));
        }
            if (snapshot.hasData) {
              List notesList = snapshot.data!.docs;

              return ListView.builder(
                  itemCount: notesList.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = notesList[index];
                    // String docId = Document.id;
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    String notetext = data['temperature'].toString();
                    dynamic timestamp = data['timestamp'];
                     

                    return (ListTile(
                      title: Text(notetext),
                      subtitle: Text(timestamp),
                    ));
                  });
            } else {
              return const Text("error");
            }
          }),
    );
  }
}

class valuee {
  valuee(this.minute, this.percentage);
  final String minute;
  final double percentage;
}
