import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  Future<void> addNotes(String note) {
    return notes.add({'note': note, 'timestamp': Timestamp.now()});
  }

  Stream<QuerySnapshot> getnotesstream() {
   
    final notesteam = notes.orderBy('timestamp', descending: true).limit(1).snapshots();
    return notesteam;
  }


}
class UserService {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('temperature');

  Future<void> addNotes(String note) {
    return notes.add({'note': note, 'timestamp': Timestamp.now()});
  }

  Stream<QuerySnapshot> getnotesstream() {
   
    final notesteam = notes.orderBy('timestamp', descending: true).limit(10).snapshots();
    return notesteam;
  }


}
class Uservice {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('humidity');

  Future<void> addNotes(String note) {
    return notes.add({'note': note, 'timestamp': Timestamp.now()});
  }

   Stream<QuerySnapshot> getnotesstream() {
   
    final notesteam = notes.orderBy('timestamp', descending: true).limit(10).snapshots();
    return notesteam;
  }

}

