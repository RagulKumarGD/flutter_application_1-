import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Service/fire_store.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Humidity extends StatefulWidget {
  const Humidity({super.key});

  @override
  State<Humidity> createState() => _HumidityState();
}

class _HumidityState extends State<Humidity> {
  final Uservice firestore = Uservice();
  @override
  Widget build(BuildContext context) {
    List<valuee> value = [
      valuee("5", 85.25),
      valuee("10", 85.65),
      valuee("15", 85.10),
      valuee("20", 85.72),
      valuee("25", 85.46),
      valuee("30", 85.50),
      valuee("35", 85.12),
      valuee("40", 85.31),
      valuee("45", 85.96),
      valuee("50", 85.17),
    ];

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("HUMIDITY"),
        backgroundColor: Colors.grey[400],
        foregroundColor: Colors.black,
      ),
      // body: Padding(
      //   padding: EdgeInsets.all(8),
      //   child: SfCartesianChart(
      //     primaryXAxis: CategoryAxis(
      //       title: AxisTitle(text: "Minute"),
      //       labelRotation: 45,
      //     ),
      //      primaryYAxis: NumericAxis(
      //       title: AxisTitle(text: 'Humidity '),
      //       minimum: 84,
      //       maximum: 86,
      //       interval: 00.10,
      //     ),
      //     series: <CartesianSeries>[
      //       LineSeries<valuee,String>(
      //         dataSource: value,
      //         xValueMapper: (valuee data,_)=>data.minute,
      //         yValueMapper: (valuee data,_)=>data.percentage,
      //         markerSettings: const MarkerSettings(isVisible: true),
      //         ),
      //     ],
      //   ),
      // ));
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
                    String notetext = data['humidity'].toString();
                    dynamic time = data['timestamp'];

                    return (ListTile(
                      title: Text(notetext),
                      subtitle: Text(time),
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
